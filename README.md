# 검색창 만들기
by. DongWook Song
## 시작하기에 앞서
이 Repository는 Coders High 기술 블로그 작성을 위한 검색창 만들기 예제입니다.

### 예제 애플리케이션 소개
이 애플리케이션은 동적 테이블 뷰의 데이터를 검색하는 것을 programmatically하게 작성하였습니다.
부가적으로 다음과 같은 특징을 가지고 있습니다.
- 검색할 데이터를 동적 테이블 뷰에 표시함.
- 검색어 입력을 시작하면 검색결과 화면으로 전환된다.
- 검색어 입력하는 중에 검색결과가 업데이트 (UISearchResultsUpdating)
- Scope 설정을 하여 그에 따른 값이 출력된다.
- SearchBar는 네비게이션 바와 통합되어 있다
- SearchBar는 숨겨져 있다 나타난다
- Delegate의 이해를 돕기 위하여 작성되었다
- Filter 을 사용한다.

## 브랜치 소개
이 repository는 사용자의 이해를 돕기 위한 몇 가지 브랜치를 생성하였습니다.
그에 따른 각각의 간략한 소개는 다음과 같습니다.
- master :핵심 구현사항이 모두 구현되어 있는 가지입니다. 
- ExtensionSample : Delegate의 추가적인 이해를 돕기 위한 가지로, delegate와 관련된 protocol을 extension을 통해서 구현하였습니다.
- starterpack :Search bar과 관련된 코드가 없는 가지입니다. dynamic table 과 안의 Model data가 구현되어 있습니다.

## 다루는 것


## 시작하기
### STEP 0. 스타터팩 다운로드
만약 자신이 다음과 같은 내용을 안다면 스타터 팩을 다운로드 받아 Search Bar 구현에 바로 들어갈 수 있습니다.
스타터 팩 다운로드 받기 -> [GitHub](https://github.com/quino0627/SearchBar/tree/starterpack)
- 동적 테이블을 Table View Controller가 아닌 Table View를 이용하여 구현할 수 있다.
- 동적 테이블에 사용되는 Delegate들을 이해하고 있다.
- 모델을 NSObject 파일을 통하여 작성할 수 있다.

### STEP 1. 검색에 사용 될 테이블 뷰, 모델 생성하기 Create a dynamic table view and model to be used for search
스타터 팩을 다운로드 받은 채로 시작한다면 STEP 1을 건너뛰고 바로 STEP 2 로 이동할 수 있습니다.
### STEP 2. 화면에 검색 바 띄우기  Search bar on the screen
### STEP 3. 실제로 검색을 작동하게 하는 방법 -  Delagate Letting search actually work - Delegate
### STEP 4. Delegate 이해하기  Understanding the Delegate
### STEP 5-0. 코드 작성하기
### STEP 5-1. delegate 관련 코드 작성
### STEP 5-2. filtering을 통한 체 함수 만들기 Creating a sieve function through filtering
### STEP 6. (선택) extension의 사용  (Optional) Using the extension
