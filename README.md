# 세미 프로젝트 - 영화관 웹 사이트 만들기

# TASK-FORCE

## 🦹‍ Team
|이진서|이재권|진현국|서준호|오민선|신하원|
|:---:|:---:|:---:|:---:|:---:|:---:|
|회원|스토어|극장|영화|고객센터|게시판|
|[jinseo](https://github.com/ljjs0121)|[ljg10sky](https://github.com/ljg10sky)|[hyungook](https://github.com/hyungook-jin)|[MooingcowJoon](https://github.com/MooingcowJoon)|[sunminohh](https://github.com/sunminohh)|[Ha!won](https://github.com/Shinhawo)|
|![](https://avatars.githubusercontent.com/u/94761254?v=4)|![](https://avatars.githubusercontent.com/u/130030785?v=4)|![](https://avatars.githubusercontent.com/u/130140565?v=4)|![](https://avatars.githubusercontent.com/u/130448178?v=4)|![](https://avatars.githubusercontent.com/u/130140763?v=4)|![](https://avatars.githubusercontent.com/u/122660720?v=4)|

## 📚 STACKS
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"><br/>
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">

## 🛠Tools 
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/sourcetree-0052CC?style=for-the-badge&logo=sourcetree&logoColor=white">

## Collaborations
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/slack-4A154B?style=for-the-badge&logo=slack&logoColor=white"> <img src="https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white">

## 📝 Ground Rule
- 회의는 매일 오전 10시 OR 필요시 회의 요청, 회의시간은 1시간 이내로!
- 매 회의때 자신의 진행중인 기능 진척도 말하기
- 정해진 목표까지 진행하고 시간이 남을 때 간략하게 회의하고 진행하기
- 서로 존중해주기
- 팀원의 의견을 들을 때 가능한 방향으로 먼저 생각하기
- 오류나 해결되지 않는 문제는 강사님에게 질문하기

## 👥 Git & Github rule

### `Branch rule`
**main**
- 조장 외 건드리지 말 것!
- 필요한 상황에서는 꼭 말하고 작업하기

**develop**
- main이라고 생각하고 개발하기
- main브랜치보다 앞서야 한다.
- 팀에서 유지하는 최신 코드다.

**feature**
- develop브랜치에서 분기하여 만든다.
- 각자 이름으로 feature브랜치를 만들며, 브랜치명은 `'feature/이름'`으로 한다.
  + ex) feature/minsu

### `Commit rule`

- `Feat`: 기능 추가, 삭제, 변경(or ✨ emoji) - 제품 코드 수정 발생
- `Fix`: 버그 수정(or 🚑 emoji) - 제품 코드 수정 발생
- `Doc`: 문서 추가, 삭제, 변경(or 📚 emoji) - 코드 수정 없음
- `Style`: 코드 형식, 정렬, 주석 등의 변경, eg; 세미콜론 추가(or 🎨 emoji) - 제품 코드 수정 발생, 하지만 동작에 영향을 주는 변경은 없음
- `Refactor`: 코드 리펙토링, eg. renaming a variable(or 🚜 emoji) - 제품코드 수정 발생
- `Test`: 테스트 코드 추가, 삭제, 변경 등(or 🔬 emoji) - 제품 코드 수정 없음. 테스트 코드에 관련된 모든 변경에 해당
- `Etc`: 위에 해당하지 않는 모든 변경, eg. 빌드 스크립트 수정, 패키지 배포 설정 변경 - 코드 수정 없음
- `Init`: 첫 프로젝트 커밋

---

# 주제
## MGV
### 서비스 설명
영화관 플랫폼

### 기간
23.06.07 ~ 23.06.20 (2주)

### 서비스 핵심 기능

#### 회원가입 / 로그인
- 사용자는 회원으로 로그인 할 수 있다.
- 관리자는 DB에 등록되어있는 계정만 로그인 할 수 있다.

#### 결제내역

#### 영화

#### 극장

#### 스토어 / 결제

#### 게시판
- 사용자 관점에서의 게시판
- 게시판 메뉴를 눌러 영화/극장/스토어 게시판 목록을 확인할 수 있다.
- 영화 게시판은 검색창이 존재하고, 영화제목/게시물 작성자/게시물 제목 등을 선택후 검색 가능하다.
- 극장/스토어는 각각 지역/극장, 품목/상품명의 다중셀렉트박스로 게시물을 검색할 수 있다.
- 로그인을 하고 게시물 리스트의 '새 게시글 등록' 버튼을 눌러 새 게시글을 등록할 수 있다. 
- 제목을 눌러 게시물 상세화면을 확인할 수 있다.
- 로그인을 한 상태에서 게시물에 댓글을 달거나, 자신의 댓글을 삭제할 수 있다.
- 게시물 작성자의 경우 게시물 상세페이지에 있는 수정, 삭제 버튼을 눌러 게시물을 수정하거나 삭제할 수 있다.
- 타인의 게시물을 신고할 수 있으며, 신고된 게시물은 더이상 게시물 리스트에 보이지 않는다.
- 관리자 관점에서의 게시판
- 메뉴탭에서 게시판관리를 누르면 ‘게시판 홈’으로 이동한다. 게시판 홈에는 영화, 극장, 스토어 게시판 관리 메뉴가 이미지로 구분되어 있다.
- 각각의 게시판관리 메뉴는 일반게시물관리, 신고된 게시물 관리, 삭제된 게시물 관리 총 세개로 나누어진다.
- 일반 게시물관리에서는 삭제되거나 신고되지 않은 일반 게시물들이 있으며 게시물의 제목을 눌러 상세페이지로 들어가면 그 게시물을 삭제할 수 있다.
- 신고된 게시물 관리에서는 신고된 게시물들을 확인할 수 있으며,  상세정보 하단의 신고정보에서 게시물이 신고된 이유를 확인 할 수 있다. 우측 하단에 있는 삭제 버튼을 누를 시 해당 게시물은 삭제 게시판으로 이동한다. 신고 취소 버튼을 누를 시 해당 게시물은 일반게시물로 이동하며, 그 게시물의 신고정보가 자동으로 삭제된다.
- 삭제된 게시물 관리에서는 삭제된 게시물들을 확인할 수 있으며, 제목을 클릭하면 해당 게시글의 상세정보를 확인 할 수 있다. 신고된 게시물이 관리자에 의해 삭제되었을 경우, 해당 게시물의 상세정보에서 신고정보도 함께 확인할 수 있다. 하단의 복구 버튼을 눌러 게시물을 일반게시물로 복구할 수 있다. 이때 복구되는 게시물이 신고된 게시물일 경우 해당 게시물의 신고정보가 자동으로 삭제된다.


#### 고객센터
  - 사용자는 분실물 문의, 1:1 문의글을 등록할 수 있고, 영화관에 등록 되어있는 자주 묻는 질문, 공지사항을 확인할 수 있다.
  - 관리자는 사용자가 등록한 분실물 문의, 1:1 문의글에 답변할 수 있고, 영화관 사이트에 자주 묻는 질문, 공지사항을 등록할 수 있다.

## 설계
- DB ERD : [Link](https://www.erdcloud.com/d/4nYKSKxkRtdsYwCgh)
