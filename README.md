# 세미 프로젝트 - 영화관 웹 사이트 만들기

# TASK-FORCE

## 🦹‍ Team
|이진서|이재권|진현국|서준호|오민선|신하원|
|:---:|:---:|:---:|:---:|:---:|:---:|
|회원|스토어|극장|영화|고객센터|게시판|
|[jinseo](https://github.com/ljjs0121)|[ljg10sky](https://github.com/ljg10sky)|[hyungook](https://github.com/hyungook-jin)|[MooingcowJoon](https://github.com/MooingcowJoon)|[sunminohh](https://github.com/sunminohh)|[Ha!won](https://github.com/Shinhawo)|
|![](https://avatars.githubusercontent.com/u/94761254?v=4)|![](https://avatars.githubusercontent.com/u/130030785?v=4)|![](https://avatars.githubusercontent.com/u/130140565?v=4)|![](https://avatars.githubusercontent.com/u/130448178?v=4)|![](https://avatars.githubusercontent.com/u/130140763?v=4)|![](https://avatars.githubusercontent.com/u/122660720?v=4)|

## 📚 STACKS
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white"> <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">

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
- 사용자는 결제한 전체내역과 구매/취소 내역을 확인할 수 있고, 취소내역 삭제가 가능하다.

#### 영화


#### 극장
- 사용자는 지역별 극장 목록과 각 극장의 상세 정보를 확인할 수 있고, 자주가는 극장 등록, 삭제가 가능하다..
- 관리자는 극장 등록, 수정, 삭제를 할 수 있다.

#### 스토어
- 카테고리 별로 상품을 분류해 해당 카테고리를 클릭 시 카테고리에 맞는 상품목록이 출력된다.
- 원하는 상품을 클릭 시 해당 상품의 상세페이지를 출력하며 상품의 수량 및 결제금액을 확인할 수 있다.

#### 결제


#### 게시판
- 사용자는 새 게시글을 등록하거나, 댓글 달기, 댓글 삭제, 게시물 수정, 삭제, 신고등을 할 수 있다.
- 관리자는 게시물을 삭제하거나 복구시킬 수 있고, 신고된 게시물의 신고 정보를 확인하여 신고처리를 하거나, 복구할 수 있다.


#### 고객센터
  - 사용자는 분실물 문의, 1:1 문의글을 등록할 수 있고, 영화관에 등록 되어있는 자주 묻는 질문, 공지사항을 확인할 수 있다.
  - 관리자는 사용자가 등록한 분실물 문의, 1:1 문의글에 답변할 수 있고, 영화관 사이트에 자주 묻는 질문, 공지사항을 등록할 수 있다.

## 설계
- DB ERD : [Link](https://www.erdcloud.com/d/4nYKSKxkRtdsYwCgh)
