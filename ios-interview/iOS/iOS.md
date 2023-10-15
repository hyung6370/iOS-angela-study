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