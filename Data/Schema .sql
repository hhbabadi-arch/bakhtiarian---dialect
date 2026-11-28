-- ============================================================
--  افزودن ستون‌های چندزبانه و فولکلور
-- ============================================================

-- جدول sense: افزودن ستون عربی
ALTER TABLE sense ADD COLUMN ar TEXT;

-- جدول lexeme: افزودن ستون transliteration
ALTER TABLE lexeme ADD COLUMN transliteration TEXT;

-- جدول جدید: folklore
CREATE TABLE folklore (
  id             TEXT PRIMARY KEY,
  type           TEXT NOT NULL,         -- verse | proverb | narrative
  genre          TEXT,
  title_fa       TEXT,
  title_en       TEXT,
  title_ar       TEXT,
  region         TEXT,
  source_id      TEXT REFERENCES speaker(id),
  date_recorded  DATE,
  text_bqi       JSONB,
  ipa            JSONB,
  translation_fa TEXT,
  translation_en TEXT,
  translation_ar TEXT,
  status         TEXT DEFAULT 'proposed',
  ipa_status     TEXT DEFAULT 'pending_review',
  license        TEXT DEFAULT 'CC-BY-4.0'
);

-- جدول پیوند فولکلور-مدخل
CREATE TABLE folklore_lexeme (
  folklore_id TEXT REFERENCES folklore(id),
  lexeme_id   TEXT REFERENCES lexeme(id),
  relation    TEXT,                      -- mentions | defines | exemplifies
  PRIMARY KEY (folklore_id, lexeme_id)
);

-- جدول جدید: location
CREATE TABLE location (
  id             TEXT PRIMARY KEY,
  name_fa        TEXT NOT NULL,
  name_en        TEXT,
  name_bqi       TEXT,
  coordinates    POINT,
  type           TEXT,                   -- village | site | gorge | cemetery
  national_registry TEXT,                -- شماره ثبت ملی
  period         TEXT,
  region         TEXT,
  description_fa TEXT,
  description_en TEXT
);

-- پیوند مدخل-مکان
CREATE TABLE lexeme_location (
  lexeme_id   TEXT REFERENCES lexeme(id),
  location_id TEXT REFERENCES location(id),
  relation    TEXT,
  PRIMARY KEY (lexeme_id, location_id)
);
