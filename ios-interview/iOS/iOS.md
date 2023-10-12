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