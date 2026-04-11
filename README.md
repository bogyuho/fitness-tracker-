# 인증 트래커

운영 URL: https://fitness-tracker-phi-lac.vercel.app

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
5. 운영 URL `https://fitness-tracker-phi-lac.vercel.app`을 폰으로 접속

### 방법 B: 그냥 파일로 열기 (로컬 테스트용)

- `index.html`을 브라우저에서 바로 열면 됨
- 단, 같은 기기에서만 작동 (공유 링크 없음)
- Supabase 연결은 정상 작동하므로 데이터는 공유됨

## 사용법

1. 링크 접속 → 이름 선택 (보규 / 혜림)
2. 운동/아침 인증 → 사진 촬영 또는 선택 → 인증
3. To do 추가하기 → 날짜/반복/요일 선택 → 사진으로 완료 인증
4. 달력에서 날짜 클릭 → 그날 인증 사진과 To do 확인
5. 벌금은 자동 계산

## 규칙 정리

- 운동: 보규/혜림 주 4회
- 아침: 보규 평일 4회, 혜림 평2+주2 or 평4 대체
- To do: 자발적으로 추가하고 사진으로 인증
- 벌금: 미달 1개당 10만원
- 운동/아침 벌금: 일요일 밤 11시부터 계산
- To do 취소: 오늘 항목은 추가 후 5분 안에만 가능, 미래 항목은 그날이 오기 전까지 가능
- 반복 To do 취소: 이 날짜만 취소하거나 이 날짜부터 반복 끄기 선택 가능
