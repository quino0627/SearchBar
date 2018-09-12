# 검색창 만들기
by 송 동욱
## 시작하기에 앞서

- 검색할 데이터를 동적 테이블 뷰에 표시함.
- 검색어 입력을 시작하면 검색결과 화면으로 전환된다.
- 검색어 입력하는 중에 검색결과가 업데이트 (UISearchResultsUpdating)
- Scope 설정을 하여 그에 따른 값이 출력된다.
- SearchBar는 네비게이션 바와 통합되어 있다
- SearchBar는 숨겨져 있다 나타난다

## 예제 어플리케이션


1. Search Bar on HIG

- Search Bar는 값들의 모음에서 검색을 하기 위해 사용됩니다.
- Search Bar는 단독, navigation bar 혹은 content view에 나타날 수 있습니다.
- "search 기능을 추가할 때 text field 대신에 search bar를 사용하여야 합니다."
- "Clear button을 사용 가능하게 해야 합니다."
- "Cancel button을 적절한 때에 사용 가능하게 해야 합니다."
- "필요하다면, 검색창에 힌트와 맥락을 제공해야 합니다."
- "검색 창 아래에 유용한 바로 가기와 같은 컨텐츠 제공을 고려해야 합니다." 
- Scope Bars - 이것을 이용하여 검색 결과를 개선하는 것이 좋습니다.

2. SearchBar를 구현하는 방법
    - 직접적으로 <span style = "color : red" >UISearchBar</span>를 이용하는 방법
    
    UISearchBar를 직접 이용하는 방법으로 search bar를 구현할 수 있습니다. 이것은 텍스트 입력을 위한 텍스트 필드, 검색 버튼, 북마크 버튼, 취소 버튼, 이 개체는 실제로 검색을 수행하지 않기 때문에, 대리자를 이용하여 이를 구현해야 합니다. 텍스트가 입력되고 버튼이 클릭되는 이벤트를 다루기 위해 "UISearchBarDelegate" delegate를 채택하여 사용합니다.
    이 방법은 검색 바를 커스터마이즈하여 사용하는 데 좋습니다. 하지만 여러 built in 기능을 제공하지 않습니다.
    
    - <span style = "color : red">UISearchController</span>를 이용하여 구현하는 방법
    
    이 방법은  ios8 이상에서 지원하는 방법으로 , 새로운 컨트롤러인  UISearchController를 사용합니다 이 방법은 검색 결과를 다른 어떤 뷰에든지 표시하여 검색 인터페이스를 표시할 수 있습니다.
    
    이 블로그에서는 UISearchController를 이용하여 search bar를 구현하는 방법에 대해 서술할 것입니다.
    UISearchController는  검색 결과가 표시되는 방법을 지정할 수 있습니다. 또한 검색에 필요한 인터페이스를 제공하며 그 과정의 몇 애니메이션과 논리를 제공합니다.
    
3. 구현 전에 
이 방법은 스토리보드에서 작업하는 방법을 제공하지 않습니다. 우리는 코드를 작성함으로써 search bar를 구현합니다. UISearchBar을 만들고 search controller의 속성들을 UISearchBar에 전달합니다. 그리고 이 search Bar를 view에 추가할 수 있습니다. 이 과정은 모두 programmatically 하게 진행됩니다.
    
4. 스토리보드 작업
5. programmatic
    - setUp & Model Data
    ```{.swift}
    import UIKit
    
    class DeviceModel: NSObject {
    var deviceName:String
    var companyName:companyType
    
    
    init(deviceName: String, companyName: companyType) {
    self.deviceName = deviceName
    self.companyName = companyName
    }
    }
    
    enum companyType:String {
    case Samsung = "Samsung"
    case Apple = "Apple"
    case LG = "LG"
    }

    ```
    ```{.swift}
    setUpDeviceInfo()
    setUpResultsController()
    setUpSearchController()
    ```
    
    ResultView와 SearchBar SetUp을 구현합니다.
    검색에 사용될 데이터를 제작합니다.
    
    - UITableViewDelegate, UITableViewDataSource
    
    제작한 모델을 테이블에 뿌리는 작업을 합니다.
    
    - searchController & resultsContainer setUp
    
    검색이 실질적으로 
    
    - UISearchBarDelegate & UIResultsUpdating
    - filter function
    - showing results on screen
