# 헬스 인증 트래커 - 설정 가이드

## 1단계: Supabase 프로젝트 만들기 (5분)

1. **https://supabase.com** 접속 → "Start your project" 클릭
2. GitHub 계정으로 로그인
3. "New Project" 클릭
   - Organization: 기본값
   - Project name: `fitness-tracker`
   - Database Password: 아무거나 (기억해둘 필요 없음)
   - Region: `Northeast Asia (Tokyo)` 선택
4. "Create new project" 클릭 → 2분 대기

## 2단계: 데이터베이스 설정 (2분)

1. 왼쪽 메뉴에서 **SQL Editor** 클릭
2. `supabase-setup.sql` 파일 내용을 전부 복사
3. SQL Editor에 붙여넣기
4. **Run** 클릭
5. "Success" 뜨면 완료

## 3단계: API 키 복사 (1분)

1. 왼쪽 메뉴 → **Settings** → **API**
2. 두 가지를 복사:
   - **Project URL**: `https://xxxxx.supabase.co` 형태
   - **anon public** 키: `eyJhbGci...` 형태

## 4단계: 앱에 키 입력 (1분)

`index.html` 파일을 텍스트 에디터로 열어서:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // ← 여기에 Project URL 붙여넣기
const SUPABASE_KEY = 'YOUR_SUPABASE_ANON_KEY';  // ← 여기에 anon public 키 붙여넣기
```

## 5단계: 배포 (2분) — 2가지 방법

### 방법 A: Vercel (추천 - 무료, 링크 생성)

1. **https://vercel.com** → GitHub 로그인
2. "Add New Project" → "Import Git Repository"
3. 만약 GitHub 리포 없으면:
   - GitHub에서 새 리포지토리 만들기 (`fitness-tracker`)
   - `fitness-tracker` 폴더의 `index.html`을 업로드
4. Vercel에서 해당 리포 선택 → Deploy
5. 나오는 URL (예: `fitness-tracker-xxx.vercel.app`)을 폰으로 접속!

### 방법 B: 그냥 파일로 열기 (로컬 테스트용)

- `index.html`을 브라우저에서 바로 열면 됨
- 단, 같은 기기에서만 작동 (공유 링크 없음)
- Supabase 연결은 정상 작동하므로 데이터는 공유됨

## 사용법

1. 링크 접속 → 이름 선택 (보규 / 혜림)
2. "📸 오늘 인증하기" 버튼 → 사진 촬영
3. 달력에서 날짜 클릭 → 그날 인증 사진 확인
4. 벌금은 자동 계산 (주 4회 미달 시 1회당 10만원)

## 규칙 정리

- 보규: 유산소 30분
- 혜림: 유산소 20분
- 주 4회 목표
- 1회 빠질 때마다 상대에게 10만원
- 주 단위로 계산 (일~토)
