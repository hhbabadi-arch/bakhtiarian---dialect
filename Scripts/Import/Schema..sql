-- ============================================================
--  ساختار کامل پایگاه داده — نسخه ۱.۳
--  Compatible: SQLite 3.35+ / PostgreSQL 14+
-- ============================================================

PRAGMA foreign_keys = ON;

-- ---------- زبان ----------
CREATE TABLE IF NOT EXISTS language (
  id         TEXT PRIMARY KEY,
  iso639_3   TEXT UNIQUE,
  glottolog  TEXT UNIQUE,
  name_fa    TEXT,
  name_en    TEXT
);

-- ---------- گویشور ----------
CREATE TABLE IF NOT EXISTS speaker (
  id         TEXT PRIMARY KEY,
  pseudonym  TEXT,
  region     TEXT,
  age_group  TEXT,
  gender     TEXT,
  consent    TEXT
);

-- ---------- مدخل واژگانی ----------
CREATE TABLE IF NOT EXISTS lexeme (
  id               TEXT PRIMARY KEY,
  lexeme           TEXT NOT NULL,
  transliteration  TEXT,
  ipa              TEXT,
  pos              TEXT,             -- noun | verb | adj | prep | ...
  status           TEXT DEFAULT 'proposed',
  ipa_status       TEXT DEFAULT 'pending_review',
  false_friend     INTEGER DEFAULT 0,
  revision         TEXT,
  region           TEXT,
  source_id        TEXT REFERENCES speaker(id),
  folklore_ref     TEXT,
  cultural_note_fa TEXT,
  cultural_note_en TEXT,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------- معنا ----------
CREATE TABLE IF NOT EXISTS sense (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  lexeme_id   TEXT REFERENCES lexeme(id) ON DELETE CASCADE,
  sense_no    INTEGER,
  fa          TEXT,
  en          TEXT,
  ar          TEXT,
  fr          TEXT,
  de          TEXT,
  example_bqi TEXT,
  example_fa  TEXT,
  example_en  TEXT,
  example_ar  TEXT,
  UNIQUE (lexeme_id, sense_no)
);

-- ---------- مشتقات ----------
CREATE TABLE IF NOT EXISTS derived (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  lexeme_id  TEXT REFERENCES lexeme(id) ON DELETE CASCADE,
  form       TEXT,
  ipa        TEXT,
  fa         TEXT,
  en         TEXT,
  ar         TEXT,
  fr         TEXT,
  de         TEXT
);

-- ---------- ترکیبات ----------
CREATE TABLE IF NOT EXISTS compound (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  lexeme_id  TEXT REFERENCES lexeme(id) ON DELETE CASCADE,
  form       TEXT
);

-- ---------- فولکلور ----------
CREATE TABLE IF NOT EXISTS folklore (
  id              TEXT PRIMARY KEY,
  type            TEXT,             -- verse | proverb | narrative
  genre           TEXT,
  title_fa        TEXT,
  title_en        TEXT,
  title_ar        TEXT,
  title_fr        TEXT,
  title_de        TEXT,
  region          TEXT,
  source_id       TEXT REFERENCES speaker(id),
  date_recorded   DATE,
  text_bqi        TEXT,             -- JSON array
  ipa             TEXT,             -- JSON array
  translation_fa  TEXT,
  translation_en  TEXT,
  translation_ar  TEXT,
  translation_fr  TEXT,
  translation_de  TEXT,
  cultural_note_fa TEXT,
  cultural_note_en TEXT,
  status          TEXT DEFAULT 'proposed',
  ipa_status      TEXT DEFAULT 'pending_review',
  license         TEXT DEFAULT 'CC-BY-4.0',
  audio_path      TEXT
);

-- ---------- پیوند فولکلور-مدخل ----------
CREATE TABLE IF NOT EXISTS folklore_lexeme (
  folklore_id TEXT REFERENCES folklore(id) ON DELETE CASCADE,
  lexeme_id   TEXT REFERENCES lexeme(id) ON DELETE CASCADE,
  relation    TEXT,
  PRIMARY KEY (folklore_id, lexeme_id)
);

-- ---------- مکان ----------
CREATE TABLE IF NOT EXISTS location (
  id                TEXT PRIMARY KEY,
  name_fa           TEXT NOT NULL,
  name_en           TEXT,
  name_bqi          TEXT,
  type              TEXT,
  latitude          REAL,
  longitude         REAL,
  national_registry TEXT,
  period            TEXT,
  region            TEXT,
  description_fa    TEXT,
  description_en    TEXT
);

-- ---------- پیوند مدخل-مکان ----------
CREATE TABLE IF NOT EXISTS lexeme_location (
  lexeme_id   TEXT REFERENCES lexeme(id) ON DELETE CASCADE,
  location_id TEXT REFERENCES location(id) ON DELETE CASCADE,
  relation    TEXT,
  PRIMARY KEY (lexeme_id, location_id)
);

-- ---------- بازبینی ----------
CREATE TABLE IF NOT EXISTS revision (
  id           TEXT PRIMARY KEY,
  date         DATE,
  type         TEXT,
  description  TEXT,
  lexeme_ids   TEXT,                -- JSON array
  source_id    TEXT REFERENCES speaker(id),
  status       TEXT DEFAULT 'approved'
);

-- ---------- نمایه‌ها ----------
CREATE INDEX IF NOT EXISTS idx_lexeme_lexeme   ON lexeme(lexeme);
CREATE INDEX IF NOT EXISTS idx_lexeme_region   ON lexeme(region);
CREATE INDEX IF NOT EXISTS idx_sense_fa        ON sense(fa);
CREATE INDEX IF NOT EXISTS idx_folklore_region ON folklore(region);
