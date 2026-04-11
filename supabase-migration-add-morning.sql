-- Existing Supabase project migration for morning check-ins.
-- Run this once in Supabase SQL Editor before using the updated app.

ALTER TABLE checkins
ADD COLUMN IF NOT EXISTS checkin_type TEXT NOT NULL DEFAULT 'workout';

ALTER TABLE checkins
DROP CONSTRAINT IF EXISTS checkins_user_name_checked_date_key;

ALTER TABLE checkins
DROP CONSTRAINT IF EXISTS checkins_user_date_type_key;

ALTER TABLE checkins
DROP CONSTRAINT IF EXISTS checkins_checkin_type_check;

ALTER TABLE checkins
ADD CONSTRAINT checkins_checkin_type_check
CHECK (checkin_type IN ('workout', 'morning'));

ALTER TABLE checkins
ADD CONSTRAINT checkins_user_date_type_key
UNIQUE (user_name, checked_date, checkin_type);

DROP INDEX IF EXISTS idx_checkins_user;

CREATE INDEX IF NOT EXISTS idx_checkins_user
ON checkins(user_name, checked_date, checkin_type);
