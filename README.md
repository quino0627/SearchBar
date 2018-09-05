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

## 브랜치 소개
이 repository는 사용자의 이해를 돕기 위한 몇 가지 브랜치를 생성하였습니다.
그에 따른 각각의 간략한 소개는 다음과 같습니다.
- master :핵심 구현사항이 모두 구현되어 있는 가지입니다. 
- ExtensionSample : Delegate의 추가적인 이해를 돕기 위한 가지로, delegate와 관련된 protocol을 extension을 통해서 구현하였습니다.
- starterpack :Search bar과 관련된 코드가 없는 가지입니다. dynamic table 과 안의 Model data가 구현되어 있습니다.

