#!/usr/bin/env python3
"""
واردکردن JSON به پایگاه داده (SQLite یا PostgreSQL).
Usage:
    python scripts/import/import.py --db data/bakhtiari.db \
        --lexicon data/lexicon-trilingual.json \
        --folklore data/folklore.json \
        --locations data/locations.json \
        --schema scripts/import/schema.sql
"""
import argparse, json, sqlite3, sys
from pathlib import Path


def load_json(path):
    p = Path(path)
    if not p.exists():
        print(f"⚠ فایل یافت نشد: {path}")
        return None
    return json.loads(p.read_text(encoding="utf-8"))


def init_db(db_path, schema_path):
    db = sqlite3.connect(db_path)
    db.execute("PRAGMA foreign_keys = ON")
    schema = Path(schema_path).read_text(encoding="utf-8")
    db.executescript(schema)
    db.commit()
    return db


def import_language(db, data):
    if not data or "language" not in data:
        return
    lang = data["language"]
    db.execute(
        "INSERT OR REPLACE INTO language (id, iso639_3, glottolog, name_fa, name_en) "
        "VALUES (?, ?, ?, ?, ?)",
        ("bqi", lang.get("iso639_3"), lang.get("glottolog"),
         lang.get("name_fa"), lang.get("name_en"))
    )
    print(f"  ✓ زبان: {lang.get('name_en')}")


def import_lexicon(db, data):
    if not data:
        return
    entries = data.get("entries", [])
    n_lex = n_sense = n_deriv = n_comp = 0

    for e in entries:
        db.execute(
            """INSERT OR REPLACE INTO lexeme
               (id, lexeme, transliteration, ipa, pos, status, ipa_status,
                false_friend, revision, region, source_id, folklore_ref,
                cultural_note_fa, cultural_note_en)
               VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)""",
            (
                e["id"], e["lexeme"], e.get("transliteration"), e.get("ipa"),
                e.get("pos"), e.get("status", "proposed"),
                e.get("ipa_status", "pending_review"),
                1 if e.get("false_friend") else 0,
                e.get("revision"), e.get("region"), e.get("source_id"),
                e.get("folklore_ref"),
                e.get("cultural_note_fa"), e.get("cultural_note_en"),
            ),
        )
        n_lex += 1

        for s in e.get("senses", []):
            db.execute(
                """INSERT OR REPLACE INTO sense
                   (lexeme_id, sense_no, fa, en, ar, fr, de,
                    example_bqi, example_fa, example_en, example_ar)
                   VALUES (?,?,?,?,?,?,?,?,?,?,?)""",
                (
                    e["id"], s.get("sense_id", 1),
                    s.get("fa"), s.get("en"), s.get("ar"),
                    s.get("fr"), s.get("de"),
                    s.get("example_bqi"), s.get("example_fa"),
                    s.get("example_en"), s.get("example_ar"),
                ),
            )
            n_sense += 1

        for d in e.get("derived", []):
            db.execute(
                """INSERT INTO derived
                   (lexeme_id, form, ipa, fa, en, ar, fr, de)
                   VALUES (?,?,?,?,?,?,?,?)""",
                (e["id"], d.get("form"), d.get("ipa"),
                 d.get("fa"), d.get("en"), d.get("ar"),
                 d.get("fr"), d.get("de")),
            )
            n_deriv += 1

        for c in e.get("compounds", []):
            db.execute(
                "INSERT INTO compound (lexeme_id, form) VALUES (?, ?)",
                (e["id"], c),
            )
            n_comp += 1

    db.commit()
    print(f"  ✓ مدخل: {n_lex}  |  معنا: {n_sense}  |  مشتق: {n_deriv}  |  ترکیب: {n_comp}")


def import_folklore(db, data):
    if not data:
        return
    items = data.get("items", [])
    n_items = n_links = 0

    for f in items:
        tr = f.get("translations", {})
        cn = f.get("cultural_notes", {})
        db.execute(
            """INSERT OR REPLACE INTO folklore
               (id, type, genre, title_fa, title_en, title_ar, title_fr, title_de,
                region, source_id, date_recorded,
                text_bqi, ipa,
                translation_fa, translation_en, translation_ar, translation_fr, translation_de,
                cultural_note_fa, cultural_note_en,
                status, ipa_status, license, audio_path)
               VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)""",
            (
                f["id"], f.get("type"), f.get("genre"),
                f.get("title_fa"), f.get("title_en"),
                f.get("title_ar"), f.get("title_fr"), f.get("title_de"),
                f.get("region"), f.get("source_id"), f.get("date_recorded"),
                json.dumps(f.get("text_bqi"), ensure_ascii=False),
                json.dumps(f.get("ipa"), ensure_ascii=False),
                tr.get("fa"), tr.get("en"), tr.get("ar"),
                tr.get("fr"), tr.get("de"),
                cn.get("fa"), cn.get("en"),
                f.get("status"), f.get("ipa_status"),
                f.get("license", "CC-BY-4.0"),
                (f.get("archive") or {}).get("audio"),
            ),
        )
        n_items += 1

        for lex_id in f.get("related_entries", []):
            db.execute(
                """INSERT OR REPLACE INTO folklore_lexeme
                   (folklore_id, lexeme_id, relation)
                   VALUES (?, ?, ?)""",
                (f["id"], lex_id, "mentions"),
            )
            n_links += 1

    db.commit()
    print(f"  ✓ فولکلور: {n_items}  |  پیوند: {n_links}")


def import_locations(db, data):
    if not data:
        return
    items = data.get("locations", [])
    n_loc = n_links = 0

    for l in items:
        coords = l.get("coordinates") or [None, None]
        db.execute(
            """INSERT OR REPLACE INTO location
               (id, name_fa, name_en, name_bqi, type,
                latitude, longitude, national_registry, period,
                region, description_fa, description_en)
               VALUES (?,?,?,?,?,?,?,?,?,?,?,?)""",
            (
                l["id"], l["name_fa"], l.get("name_en"), l.get("name_bqi"),
                l.get("type"), coords[0], coords[1],
                l.get("national_registry"), l.get("period"),
                l.get("region"),
                l.get("description_fa"), l.get("description_en"),
            ),
        )
        n_loc += 1

        for lex_id in l.get("related_lexemes", []):
            db.execute(
                """INSERT OR REPLACE INTO lexeme_location
                   (lexeme_id, location_id, relation)
                   VALUES (?, ?, ?)""",
                (lex_id, l["id"], "located_at"),
            )
            n_links += 1

    db.commit()
    print(f"  ✓ مکان: {n_loc}  |  پیوند: {n_links}")


def print_summary(db):
    print("\n" + "=" * 50)
    print("📊 خلاصه پایگاه داده")
    print("=" * 50)
    for table in ["language", "speaker", "lexeme", "sense", "derived",
                  "compound", "folklore", "folklore_lexeme",
                  "location", "lexeme_location", "revision"]:
        try:
            n = db.execute(f"SELECT COUNT(*) FROM {table}").fetchone()[0]
            print(f"  {table:20s} {n:>5d}")
        except sqlite3.OperationalError:
            pass
    print("=" * 50)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--db", required=True)
    ap.add_argument("--schema", default="scripts/import/schema.sql")
    ap.add_argument("--lexicon", default="data/lexicon-trilingual.json")
    ap.add_argument("--folklore", default="data/folklore.json")
    ap.add_argument("--locations", default="data/locations.json")
    args = ap.parse_args()

    print(f"→ آماده‌سازی پایگاه داده: {args.db}")
    db = init_db(args.db, args.schema)

    print("→ واردکردن زبان...")
    import_language(db, load_json(args.lexicon))

    print("→ واردکردن مدخل‌ها...")
    import_lexicon(db, load_json(args.lexicon))

    print("→ واردکردن فولکلور...")
    import_folklore(db, load_json(args.folklore))

    print("→ واردکردن مکان‌ها...")
    import_locations(db, load_json(args.locations))

    print_summary(db)
    db.close()
    print("\n✓ واردکردن کامل شد")


if __name__ == "__main__":
    sys.exit(main())
