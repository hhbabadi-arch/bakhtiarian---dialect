-- اگر قبلاً ساخته شده، این ALTER ها را اجرا کنید:
ALTER TABLE sense   ADD COLUMN fr TEXT;
ALTER TABLE sense   ADD COLUMN de TEXT;
ALTER TABLE derived ADD COLUMN fr TEXT;
ALTER TABLE derived ADD COLUMN de TEXT;
ALTER TABLE folklore ADD COLUMN title_fr TEXT;
ALTER TABLE folklore ADD COLUMN title_de TEXT;
ALTER TABLE folklore ADD COLUMN translation_fr TEXT;
ALTER TABLE folklore ADD COLUMN translation_de TEXT;

-- برای نصب تمیز، نسخه جدید schema.sql از ابتدا این ستون‌ها را دارد.
