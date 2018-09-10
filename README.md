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

1. Search Bar on HIG
2. Search Bar on Developer Guidance
3. Search와 관련한 클래스, 프로토콜
4. SearchBar를 구현하는 방법(UISearchBar로 직접 작업하기와 UISearchController를 사용하기)
5. UISearchController를 사용하는 이유
    - ios8+부터 지원하는 기능
    - 


## 시작하기
### STEP 0. 스타터팩 다운로드
만약 자신이 다음과 같은 내용을 안다면 스타터 팩을 다운로드 받아 Search Bar 구현에 바로 들어갈 수 있습니다.
스타터 팩 다운로드 받기 -> [GitHub](https://github.com/quino0627/SearchBar/tree/starterpack)
- 동적 테이블을 Table View Controller가 아닌 Table View를 이용하여 구현할 수 있다.
- 동적 테이블에 사용되는 Delegate들을 이해하고 있다.
- 모델을 NSObject 파일을 통하여 작성할 수 있다.

### STEP 1. 검색에 사용 될**테이블 뷰, 모델** 생성하기 Create a dynamic table view and model to be used for search
스타터 팩을 다운로드 받은 채로 시작한다면 STEP 1을 건너뛰고 바로 STEP 2 로 이동할 수 있습니다.
검색은 대부분의 경우에서 테이블에 있는 항목들을 검색하기 위해 사용됩니다. 즉, 검색을 구현하기 위해 선행되어야 하는 작업으로 테이블을 만들어야 합니다. 우리는 **동적 테이블 뷰**를 사용할 것입니다.
1. 스토리 보드 작업
    - 뷰 컨트롤러에 테이블 뷰 추가
    - 테이블 뷰에 Table View Cell 추가
    - Table View Cell Height, identifier, 셀 형태 설정
    - Table View에 constrain주기
2. 코드 작업 - 모델
    - Model 이라는 명의 Group 생성하기
    - NSObject 를 superclass로 하는 class 파일 생성하여 테이블에 표시할 모델 작성하기
    - NSObject instance를 ViewController에 배열로 생성하기
3. 코드 작업 - 테이블
    - View Controller 에 table 관련 protocol 채택
    - 핵심인 두 가지의 함수의 역할 설명하기
    - UITableViewCell을 super class 로 하는 class 파일 생성하여 IBOutlet 연결하기
    - Delegate 함수를 모델 배열을 이용하여 작성하기
    

### STEP 2. 화면에 검색 바 띄우기  Search bar on the screen
우리는 search bar를 Table 내부가 아닌 Navigation bar에 합쳐진 형태로 구현할 것입니다.
구현한 후 실행시키면 스크린 상에 정상적으로 나타나지만, 실질적으로 검색이 동작하지 않습니다. 

### STEP 3. 실제로 검색을 작동하게 하는 방법 -  Delegate 이해하기 Letting search actually work - Understanding the Delegate
설명
### STEP 4-0. 코드 작성하기 Writing a little bit of code
#### STEP 4-1. delegate 관련 코드 작성 Writing delagate related code
1. 프로토콜 채택 작업
2. 관련 함수에 대한 설명,작성
#### STEP 4-2. filtering을 통한 체 함수 만들기 Creating a sieve function through filtering
1. filter을 이용하여 검색어에 따른 결과값을 걸러 주는 함수를 작성한다.
### STEP 5. (선택) extension의 사용  (Optional) Using the extension
1. extension의 사용법을 배운다.
