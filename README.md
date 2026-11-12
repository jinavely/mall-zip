# mall-zip
react mall

React(Vite) + Spring Boot 쇼핑몰 교재 실습 환경을 **오프라인 PC에서 바로 쓸 수 있도록** 묶은 압축본입니다.
인터넷 없이 압축만 풀면 DB · 백엔드 · 프론트를 실행할 수 있습니다.

## 파일 구성

| 파일 | 내용 |
|---|---|
| `frontend.zip` (46MB) | React 프로젝트 + `node_modules` (npm install 불필요) |
| `backend.zip.001` ~ `.013` (각 100MB) | 백엔드 전체를 100MB씩 나눈 것: 포터블 Cursor, Spring Boot 프로젝트, Gradle 오프라인 캐시, 포터블 MariaDB, 교재 PDF/소스 |
| `backend-join.bat` | 조각을 `backend.zip`으로 합치고 SHA-256으로 검증 (Windows 기본 명령만 사용) |

## 설치 (회사 PC)

1. 이 저장소의 파일을 **전부** 내려받아 한 폴더에 둡니다. (`backend.zip.001` ~ `.013` 13개 모두 필요)
2. `backend-join.bat` 더블클릭 → `[OK] backend.zip is ready and verified.` 확인
   - `[X] HASH MISMATCH` 가 나오면 조각이 빠졌거나 손상된 것이니 다시 내려받으세요.
3. `C:\workspace\react\mall` 폴더를 만들고, 그 안에 `backend.zip`과 `frontend.zip`을 각각 압축 해제합니다.
   ```
   C:\workspace\react\mall\
   ├─ backend\
   └─ frontend\
   ```
   - 경로에 **한글과 공백이 없어야** 합니다.

### 필요한 것 (회사 PC에 설치되어 있어야 함)
- Windows 64비트
- **JDK 21**
- **Node.js 20.19 이상 또는 22.12 이상**

## 실행 (Cursor 터미널 = Git Bash 기준)

```bash
# 터미널 1 : DB (MariaDB, 포트 3307) - 이 창은 켜둔 채로
cd /c/workspace/react/mall/backend
./start-mariadb.bat

# 터미널 2 : 백엔드 (Spring Boot, 포트 8080)
cd /c/workspace/react/mall/backend
./start-backend.bat

# 터미널 3 : 프론트 (Vite, 포트 5173)
cd /c/workspace/react/mall/frontend
npm run dev
```

순서는 **DB → 백엔드 → 프론트**입니다. 자세한 사용법은 `backend/README.txt`, `backend/docs/오프라인개발환경_사용가이드.html`을 보세요.

## 교재 따라하기

| 장 | 무엇을 보고 하나 |
|---|---|
| 1~3장 | 적용 완료. 참고: `backend/docs/vite/` 의 2·3장 수정판 가이드(HTML/PDF), 소스 txt |
| 4~12장 | **설명은 PDF, 코드는 `backend/docs/<장>/` 의 txt** (TypeScript · Spring Boot 4 · 포트 3307에 맞게 수정됨, 원본은 `backend/docs/_원본txt/`) |

- PDF의 `npm install`, `build.gradle` 라이브러리 추가 단계는 **건너뜁니다** (이미 설치/캐시되어 있음).
- **7장 시작 시** `backend/workspace/mallapi/build.gradle` 의 Security 두 줄 주석을 해제합니다.
- `application.properties` 는 txt로 통째로 덮어쓰지 말고 새로 생긴 줄만 추가합니다.
- 9장 카카오 로그인은 카카오 서버 접속이 필요해 오프라인에서는 실제 로그인이 되지 않습니다(코드 작성·빌드는 가능).

## 검증 내역
- 모든 장의 txt 소스(React 2·4·6·8·9·11·12장, Java 3·5·7·9·10장)가 오프라인으로 빌드됨
- 10장 최종본을 오프라인으로 실행: 로그인/JWT/권한/상품 이미지 업로드·썸네일/장바구니 API 정상
- `backend.zip.*` 를 합친 결과가 원본과 동일 (SHA-256 `f510c1cae8314ab6580373b7d4a99733634cf215d9f9cec0153816cb1d9f48c6`)
