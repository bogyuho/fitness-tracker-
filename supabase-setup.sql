-- =============================================
-- 헬스 인증 트래커 - Supabase 설정
-- Supabase SQL Editor에서 실행하세요
-- =============================================

-- 1. 체크인 테이블
CREATE TABLE checkins (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_name TEXT NOT NULL CHECK (user_name IN ('보규', '혜림')),
  checkin_type TEXT NOT NULL DEFAULT 'workout' CHECK (checkin_type IN ('workout', 'morning')),
  photo_url TEXT NOT NULL,
  memo TEXT DEFAULT '',
  checked_date DATE NOT NULL DEFAULT CURRENT_DATE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_name, checked_date, checkin_type)  -- 인증 종류별 하루에 한 번
);

-- 2. 인덱스
CREATE INDEX idx_checkins_date ON checkins(checked_date);
CREATE INDEX idx_checkins_user ON checkins(user_name, checked_date, checkin_type);

-- 3. RLS (Row Level Security) - 공개 읽기/쓰기 (2명만 쓰니까)
ALTER TABLE checkins ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can read checkins"
  ON checkins FOR SELECT
  USING (true);

CREATE POLICY "Anyone can insert checkins"
  ON checkins FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anyone can delete own checkins"
  ON checkins FOR DELETE
  USING (true);

-- 4. 스토리지 버킷 (사진 저장용)
INSERT INTO storage.buckets (id, name, public)
VALUES ('photos', 'photos', true);

-- 스토리지 정책 - 누구나 업로드/읽기 가능
CREATE POLICY "Anyone can upload photos"
  ON storage.objects FOR INSERT
  WITH CHECK (bucket_id = 'photos');

CREATE POLICY "Anyone can read photos"
  ON storage.objects FOR SELECT
  USING (bucket_id = 'photos');
