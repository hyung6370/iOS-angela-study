# iOS

### Q) Bounds와 Frame의 차이점을 설명하시오.
A) Bounds와 Frame 모두 View의 위치와 사이즈를 반환하는 CGRect 타입 변수이다. 차이점은 Frame은 해당 뷰가 상위 뷰의 좌표계를 기준으로 정해진 크기와 좌표라는 점이고, Bounds는 자기 자신의 좌표계를 기점으로 정해진 크기와 좌표라는 점이다.

### Q) 실제 디바이스가 없을 경우 개발 환경에서 할 수 있는 것과 없는 것을 설명하시오.
A) 할 수 있는 것은 앱을 테스트 하기 전 빠른 프로토타이핑 및 개발을 할 수 있다는 것이고, 할 수 없는 것은 맥에서 실행되는 앱이기 때문에 모바일 환경에서의 테스트, 사용자 경험을 얻지 못하고, 맥과 모바일 환경에서의 하드웨어와 API 차이가 있을 수 있다는 점이다.

### Q) 앱의 컨텐츠나 데이터 자체를 저장/보관하는 특별한 객체를 무엇이라고 하는가?
A) 데이터베이스 입니다. 로컬에 저장할 수 있는 것으로는 UserDefaults가 있고, 데이터베이스는 아니지만 Core Data 프레임워크도 있습니다. 외부 데이터베이스로는 Firebase, SQLite, Realm이 있습니다.

### Q) 앱 화면의 컨텐츠를 표시하는 로직과 관리를 담당하는 객체를 무엇이라고 하는가?
A) UIViewController 입니다. UIViewController는 UIKit으로 제작된 앱의 뷰 계층구조를 관리하는 객체이다. 그리고 UIKit으로 앱 개발을 하게 되면 가장 많이 마주하게 될 클래스이고, 화면 위에 보여지게 될 UIView들의 로직과 관리를 담당하게 된다.

### Q) App thinning에 대해서 설명하시오.
A) 앱 스토어와 운영체제가 사용자의 기기 환경에 맞게 앱의 설치를 최적화 하는 것을 App thinning 이라고 한다. App thinning을 통해 기기 대부분의 특성을 사용하고 최소한의 디스크 공간을 차지하며, Apple이 추후에 적용할 업데이트를 수용할 수 있는 앱을 생성할 수 있다.

### Q) 앱이 시작할 때 main.c에 있는 UIApplicationMain 함수에 의해서 생성되는 객체는 무엇인가?
A) UIApplication 인스턴스가 생성된다. 이때, UIApplication은 사용자로부터 발생하는 이벤트들을 AppDelegate로 전달하는 역할을 한다.

### Q) @Main에 대해서 설명하시오.
A) Swift 컴파일러가 @Main 어노테이션을 통해 AppDelegate에서 전역범위에 있는 코드를 자동으로 인식하게 하고 실행시킨다. 프로그램 실행을 시작하기 위한 진입점이다.
A2) @main은 어디서부터 이 앱이 최초 실행되고 시작될지를 명시해주는 키워드이다 (UIKit 프레임워크에 존재하는 main() 함수를 사용한다는 의미)

### Q) 앱이 foreground에 있을 때와 background에 있을 때 어떤 제약사항이 있나요?
A) Foreground mode는 메모리 및 기타 시스템 리소스에서 높은 우선순위를 가지며 시스템은 이러한 리소스를 사용할 수 있도록 필요에 따라 Background 앱을 종료한다. Background mode는 가능한 적은 메모리 공간을 사용해야한다.

### Q) 상태 변화에 따라 다른 동작을 처리하기 위한 앱델리게이트 메서드들을 설명하시오.
A)
- 어플리케이션이 Active -> InActive 상태로 전환되기 직전에 호출되는 applicationWillResignActive
- 애플리케이션이 InActive -> Background 상태로 전환된 뒤, 호출되는 applicationDidEnterBackground
- 애플리케이션이 Background -> Foreground 상태가 되기 전, 호출되는 applicationWillEnterForeground
- 애플리케이션이 InAction -> Active 상태로 전환된 후, 호출하는 applicationDidBecomeActive
- 애플리케이션이 종료되기 직전에 호출되는 applicationWillTerminate 메서드 등이 있다.

### Q) 앱이 In-Active 상태가 되는 시나리오를 설명하시오.
1. 사용자가 앱을 실행한다: Not Running -> In-Active -> Active
2. 앱 실행 도중 홈 버튼을 누른다: Active -> In-Active -> Background
3. 앱을 다시 켠다: Background -> In-Active -> Active
4. 앱이 백그라운드에 있다가 Suspended 상태로 전이: Active -> In-Active -> Background -> Suspended

### Q) Scene Delegate에 대해 설명하시오.
A) SceneDelegate는 UISceneSession의 scene 생성, 파괴 및 상태 복원과 같은 scene 라이프 사이클 이벤트를 담당한다.

### Q) UIApplication 객체의 건트롤러 역할은 어디에 구현해야 하는가?
A) UIApplication 객체는 `UIApplicationMain(_:_:_:_:)` 함수에서 Singleton 객체로 생성된다. 그리고 이 함수는 `@main`이 선언되어 있는 App Delegate에서 실행된다.

### Q) App의 Not Running, In-Active, Active, Background, Suspended에 대해 설명하시오.
- Not Running : 앱이 실행되지 않았거나 시스템에서 종료된 상태
- In-Active : Foreground의 한 상태로, 앱이 Foreground에서 실행 중이지만 이벤트를 받을 수 없는 상태, 그리고 다른 상태로 전이될 수 있는 상태
- Active : 앱이 화면에 떠 있을 때의 상태, 그리고 이벤트를 받을 수 있는 상태
- Background : 대부분의 앱이 일시중지인 상태, 그러나 추가 시간을 요청하는 앱은 일정기간 동안 이 상태로 남아 있을 수 있다
- Suspended : 앱이 백그라운드에 있지만 코드를 실행하지 않고 있는 상태

<br />
<hr />

### Q) iOS 앱을 만들고, User Interface를 구성하는 데 필수적인 프레임워크 이름은 무엇인가?
A) Cocoa Touch Framework와 UIKit이 있다.

### Q) Foundation Kit은 무엇이고, 포함되어 있는 클래스들은 어떤 것이 있는지 설명하시오.
A) Foundation Kit은 Cocoa Touch Framework에 포함되어 있는 프레임워크 중 하나로 String, Int 등의 원시 데이터 타입과 컬렉션 타입 및 운영체제 서비스를 사용해 앱의 기능을 관리하는 프레임워크 이다. 그리고 Iterator, jsonEncoder, jsonDecoder와 같은 데이터 관련 클래스가 정의되어 있다.

### Q) Delegate란 무엇인지 설명하고, retain이 되는지 안되는지 그 이유를 함께 설명하시오.
- Delegate란 하나의 객체가 모든 일을 처리하는 것이 아니라 처리해야 할 일 중 일부를 다른 객체에게 위임하는 것이다. 객체의 행동을 단순화시기고,객체의 결합성을 최소화하는 장점이 있다.
- Retain은 메모리가 해제되지 않고 유지되어 누수가 생기는 현상을 말한다. 두 객체간의 참조가 강한 순환참조가 생겨 메모리에서 해제되지 않는 현상이다.

A) Retain은 객체가 메모리에서 해제되지 않도록 호출되어 레퍼런스 카운트를 증가시키는데, Delegate는 객체끼리의 참조값을 사용하기 때문에 retain이 된다고 할 수 있다.

### Q) NotificationCenter 동작 방식과 활용 방안에 대해 설명하시오.
A) Notification이란 Observer(관찰자)에게 정보를 전달해주는 알림 발송 메커니즘이다. 그리고 이 Notification 센터는 앱 내에서 공식적인 연결이 없는 두 개 이상의 컴포넌트들이 상호작용이 필요할 때, 상호작용이 반복적으로 그리고 지속적으로 이루어져야 할 때, 일대다 또는 다대다 통신을 사용하는 경우 활용할 수 있다.

### Q) UIKit 클래스들을 다룰 때 꼭 처리해야하는 애플리케이션 쓰레드 이름은 무엇인가?
A) Main Thread

### Q) App Bundle의 구조와 역할에 대해 설명하시오.
A) 앱을 성공적으로 빌드하기 위한 자료들의 집합이다. 실행파일, 리소스파일, Info.plist 등등
- Info.plist : 어플리케이션에 대한 구성 정보가 들어있는 구조화된 파일로, 시스템은 이 파일에 의존하여 어플리케이션 및 파일에 대한 관련 정보를 식별한다.
- 실행 파일 : 모든 응용 프로그램에 존재하는 실행 파일로 어플리케이션의 메인 entry point와 어플리케이션 타켓에 정적으로 연결된 모든 코드가 포함되어 있다.
- 리소스 파일 : 리소스는 일반적으로 이미지, 아이콘, 소리, nib 파일, 문자열 파일, 설정 파일 및 데이터 파일 등으로 구성된다.

### Q) 모든 View Controller 객체의 상위 클래스는 무엇이고 그 역할은 무엇인가?
A) 모든 View Controller는 UIViewController를 상속한다. UIViewController는 모든 View Controller에 공통으로 작동하는 행동들이 정의 되어 있고, 이를 상속 받아 메서드를 추가하거나 override 할 수 있다.

### Q) 자신만의 Custom View를 만들려면 어떻게 해야하는지 설명하시오.
A) Xib(nib)을 이용해서 Storyboard처럼 커스텀 뷰를 생성할 수 있고, UIView를 상속받아 코드로 작성하여 구현할 수 있다.

### Q) View 객체에 대해 설명하시오.
A) View는 사용자 인터페이스의 기본 구성 요소이며 모든 조작은 main thread에서 진행된다.
또한, 화면에 content 표시, 그리기 및 애니메이션, 오토레이아웃, 제스처 인식 등 화면에 관한 것들을 담당하는 객체이다.

### Q) UIView에서 Layer 객체는 무엇이고 어떤 역할을 담당하는지 설명하시오.
A) UIView에 CALayer 타입인 layer를 가지고 있다. 이 Layer 객체는 UIView의 작업 중에서 화면에 그리는 작업들을 받아 수행하는 역할을 하는 객체이다.

### Q) iOS에서 뷰와 레이어의 개념과 차이점에 대해 설명해보세요.
- UIView
    - CALayer를 사용하는 wrapper, 실제 드로잉과 렌더링은 Core Animation에게 위임한다.
    - CPU의 메인 스레드에서 동작한다.
    - 하나의 뷰 컴포넌트로서, 화면 위의 레이아웃, 계층 구조를 설정하기 위한 API를 제공한다. (오토레이아웃, anchor 등)
    - UIResponder의 서브 클래스, Responder Chain에 속하므로 사용자 이벤트 핸들링을 지원한다.

- CALayer
    - 실제 GPU에서 렌더링 되는 컨텐츠를 관리하는 역할
    - 높은 frame rate를 유지하며, drawing, animation을 효율적으로 할 수 있다 (UIView 보다 가볍고 성능이 좋다)
    - 복잡한 애니메이션이나 퍼포먼스가 요구되는 작업에 효율적이다.
    - 저수준 프레임워크이므로, UIView에서 제공하지 않는 세밀한 컨텐츠 컨트롤이 가능하다.

-> UIView는 컨텐츠를 보여주고, 사용자와 인터랙션 할 수 있는 사각형틀을 제공하는 기본 UI Component이다. CALayer는 UIView의 기반을 제공한다. 하지만 CALayer만 사용해서 UI를 구현할 수 없다.
-> UIView에서 할 수 없는 이미지간 합성, 복잡한 애니메이션, 최적화가 필요하다면, CALayer로 드로잉, 애니메이션을 구현하면 된다.

### Q) UIWindow 객체의 역할은 무엇인가?
A) UIWindow는 UIView의 하위 클래스로 앱의 배경과 이벤트를 View로 전달하는 객체이다. 눈에 보이는 내용은 없지만 앱의 View에 기본 컨테이너를 제공하여 rootViewController에서 관리하는 하나 이상의 View를 보여주는 역할을 한다.

### Q) UINavigationController의 역할이 무엇인지 설명하시오.
A) UINavigationController는 하나의 뷰 컨트롤러가 아닌 여러 개의 뷰 컨트롤러의 계층을 만들고 관리 해주는 컨트롤러이다. 사용자가 상세화면이나 상위에 있는 화면이라고 생각하게 만들어준다.

### Q) TableView를 동작 방식과 화면에 Cell을 출력하기 위해 최소한 구현해야 하는 DataSource 메서드를 설명하시오.
A) 섹션에 표시할 행의 개수를 구현하는 numberOfRowInSection 메서드와 특정 위치에 표시할 셀을 요청하는 cellForRowAt 메서드가 있다.

### Q) 하나의 View Controller 코드에서 여러 TableView Controller 역할을 해야 할 경우 어떻게 구분해서 구현해야 하는지 설명하시오.
1. tableView마다 tag를 설정해 cellForRowAt에서 분기를 나누어 구현
2. tableView 별도의 delegate 객체를 만들어 주입해주는 방법으로 구현

### Q) setNeedsLayout와 setNeedsDisplay의 차이에 대해 설명하시오.
- setNeedsLayout
    - 뷰의 하위 뷰들의 레이아웃을 조정하고 싶을 때, 메인 스레드에서 이 메서드를 호출한다. 그리고 이 메서드를 호출한 view는 재계산이 필요한 view라고 시스템에게 알려준다.
- setNeedsDisplay
    - 이 메서드를 사용하여 view의 컨텐츠를 다시 그려야한다고 시스템에게 알려줄 수 있다. 이 메서드가 호출된 후 draw 메서드가 호출된다.

### Q) StackView의 장점과 단점에 대해서 설명하시오.
- 장점 : 복잡한 Constraint 없이 구현이 쉽고, 빠르고 편리하다.
- 단점 : 

### Q)  NSCache와 딕셔너리로 캐시를 구성했을 때의 차이를 설명하시오.
1. NSCache는 메모리 관리가 기본적으로 제공된다.
- 다른 앱에서 메모리를 더 사용하려고 하면 캐시되어 있던 데이터를 지우고 메모리를 해제한다.

2. NSCache는 Thread-safe 하다.
- 캐시 데이터를 읽고 쓰고 지울 때마다 따로 lock을 해줄 필요가 없다.
반면 딕셔너리는 Thread-safe 하지 않기 때문에 데이터 접근할 때 따로 처리해줘야 한다.

3. 딕셔너리는 key값을 copy하지만 NSCache는 retain 카운트만 증가 시킨다.
- 복사를 지원하지 않는 객체까지 포용한다.

### Q) URLSession에 대해서 설명하시오.
A) 네트워크 데이터 전달 작업에 연관된 일련의 일을 처리하는 그룹 오브젝트. 또한 URLSession을 통해 iOS 앱이 실행중이지 않을 때에도 백그라운드에서 데이터를 다운로드 할 수 있다.

### Q) prepareForReuse에 대해서 설명하시오.
A) 셀 재사용과 관련된 함수, 재사용 되는 셀을 초기화하는 목적으로 사용된다.

### Q) 다크모드를 지원하는 방법에 대해 설명하시오.
1. Assets를 이용해서 다크모드 지원하기
2. 모드 별로 다른 이미지를 정의하기

### Q) ViewController의 생명주기를 설명하시오.

loadView : 뷰를 만드는 역할, 이 메서드는 직접 호출하면 안된다.

1. init(coder:) : ViewController 객체가 생성될 때 호출한다. 이 메서드는 Interface Builder에서 ViewController 객체를 로드하는 경우에 호출된다. ViewController 객체를 초기화하는데 사용한다.

2. loadView() : ViewController의 View가 처음 생성될 때 호출된다. 이 메서드는 View를 직접 구성하여 할당하고 초기화 한다. 만약 View를 코드로 구성하는 경우, 이 메서드를 구현하여 View를 로드한다.

3. viewDidLoad() : ViewController의 View가 메모리에 로드된 직후 호출된다. 이 메서드는 View가 초기화 되었으며 ViewController가 인터페이스 객테와 상호작용하기 전에 수행해야할 작업을 수행한다. 이 메서드는 ViewController에 필요한 초기화 작업을 수행하는데 사용한다.

4. viewWillAppear(_:) : viewController의 View가 화면에 표시되기 전에 호출된다. 이 메서드는 View가 등장하기 전에 ViewController가 수행해야 하는 모든 작업을 수행한다. 예를들어, 화면이 전환될 때 뷰를 업데이트 하는 작업을 수행할 수 있다.

5. viewDidAppear(_:) : ViewController의 View가 화면에 표시된 직후 호출된다. 이 메서드는 ViewController가 사용자 인터페이스와 상호작용하기 시작할 때 수행하는 작업을 수행한다. 예를들어, 애니메이션 효과를 추가할 수 있다.

6. viewWillDisappear(_:) : ViewController의 View가 화면에서 사라지기 전에 호출된다. 이 메서드는 View가 사라지기 전에 ViewController가 수행해야 하는 작업을 수행한다. 예를들어, 변경된 데이터를 저장하는 작업을 수행할 수 있다.

7. viewDidDisappear(_:) : ViewController의 View가 화면에서 사라진 직후 호출된다. 이 메서드는 View가 사라진 후에 ViewController가 수행해야하는 작업을 수행한다. 예를들어, 메모리 관리를 위한 작업을 수행할 수 있다.

8. viewDidUnload() (Deprecated) : 이전에는 ViewController의 View가 메모리에서 해제될 때 호출되었다. 그러나 iOS6에서 이 메서드는 더 이상 사용되지 않았다. 대신 viewDidDisappear(_:) 메서드에서 해당 작업을 수행해야한다.

9. deinit() : ViewController 객체가 메모리에서 해제될 때 호출된다. 이 메서드는 객체가 메모리에서 해제될 때 필요한 모든 작업을 수행한다.

### Q) TableView와 CollectionView의 차이점을 설명하시오.
A) Cell의 차이가 크다. TableView는 하나의 열에 여러 행의 Cell을 표현하는 방식이고, CollectionView는 행과 열을 모두 만들 수 있다. 즉, Cell의 모양을 자유롭게 디자인이 가능하다.

### Q) Dynamic Library와 Static Library의 차이점에 대해 설명하시오.
A) 가장 큰 차이는 프로그램과의 연결 시점(컴파일 시 or 런타임 시)과 공유 가능 여부라고 할 수 있다.

### Q) XCTest가 무엇인가요?
XCTest는 Apple의 소프트웨어 개발 툴셋인 Xcode에 포함된 프레임워크 중 하나로, 개발자들이 iOS, macOS, watchOS, 그리고 tvOS를 위한 앱으로 유닛 테스트(Unit Tests), 퍼포먼스 테스트(Performance Tests), 그리고 UI 테스트(User Interface Tests)를 수행할 수 있도록 돕는 프레임워크이다.

1. 유닛 테스트
- XCTest를 사용하여 코드의 특정 부분이나 함수 단위의 작은 코드 블록을 테스트한다. 이를 통해 개별 컴포넌트가 예상대로 동작하는지 확인할 수 있다. 이 과정에서는 함수나 메서드가 주어진 입력에 대해 예상된 출력을 반환하는지 검증한다.

2. UI 테스트
- 어플리케이션의 사용자 인터페이스를 자동화된 방식으로 테스트한다. 사용자의 상호작용을 모방하여 앱이 사용자 입력과 상호작용에 올바르게 반응하는지 확인할 수 있다.

3. 퍼포먼스 테스트
- 어플리케이션의 특정 영역이 성능 기준을 충족하는지 확인한다. 예를들어, 알고리즘이나 함수가 정해진 시간 내에 실행을 완료하는지 테스트할 수 있다.

4. 테스트 케이스 작성
- XCTestCase 클래스를 상속받아 테스트 케이스를 작성한다. 각 테스트 메서드는 특정 조건 하에서 코드의 작은 부분을 실행하고 예상 결과와 비교한다.

5. 테스트 실행 및 결과 확인
- Xcode의 테스트 네비게이터나 테스트 실행 단추를 사용하여 테스트를 실행한다. 테스트가 실행된 후, 성공, 실패 또는 에러와 같은 결과를 확인할 수 있다.

6. 테스트 커버리지
- XCTest는 코드의 어떤 부분이 테스트 되었는지를 나타내는 테스트 커버리지도 제공한다. 이는 미테스트된 영역을 식별하고 총 테스트 커버리지를 높이는 데 도움이 된다.

7. 지속적 통합과의 연계
- XCTest는 지속적 통합(CI) 시스템과 결합할 수 있어, 코드 변경 사항이 통합될 때마다 테스트가 자동으로 실행되도록 설정할 수 있다. 이로인해 새로운 코드 변경이 기존 기능이나 새로운 기능에 영향을 미치지 않는지 확인할 수 있다.

요약 : XCTest 프레임워크를 사용하여 효과적인 테스트 케이스를 설계하고, 구현 오류를 빠르게 식별하고, 코드 품질을 향상시키는 것은 애플 플랫폼에서 소프트웨어를 개발하는 데 중요한 과정이다.