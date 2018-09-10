# 검색창 만들기
by. DongWook Song
## 시작하기에 앞서

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
6. 스토리보드 작업
7. programmatic
    - set properties & Model Data
    - UITableViewDelegate, UITableViewDataSource
    - searchController & resultsContainer setUp
    - UISearchBarDelegate & UIResultsUpdating
    - filter function
    - showing results on screen
