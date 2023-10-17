# Autolayout

### Q) 오토레이아웃을 코드로 작성하는 방법은 무엇인가?(3가지)
- NSAutoLayout
- Anchor
- VFL (Visual Format Language)
하지만 요새는 보통 SnapKit을 주로 사용한다.

### Q) hugging, resistance에 대해서 설명하시오.
- hugging : 우선순위가 높을수록 크기를 유지하려고 하고, 우선순위가 낮을수록 크기가 커지는 성질
- resistance : 우선순위가 높을수록 크기를 유지하려고 하고, 우선순위가 클수록 크기가 작아지는 성질

### Q) Intrinsic Size에 대해서 설명하시오.
A) Intrinsic Size는 컨텐츠의 본질적인 크기이다. 모든 View가 Intrinsic Size를 갖는 것은 아니고, 대표적인 예로는 UILabel, UIButton을 들 수 있다. 또한, 각각의 View 마다 Intrinsic Size가 적용되는 방식이 다르다.

### Q) 스토리보드를 이용했을 때의 장단점을 설명하시오.
A) 장점으로는 결과물을 예측하기가 쉽고, 소스를 일일히 확인하지 않아도 UI를 확인 가능하다는 것이다. 단점으로는 화면 로딩 시 앱이 무거워지고, 커지면 커질수록 가독성이 떨어진다는 점이다.

### Q) Safe Area에 대해서 설명하시오.
A) 아이폰 X가 출시 이후로 상단에 노치, 하단에 홈 인디케이터가 생겨 safeArea라는 영역이 생기게 되었다. 즉, 노치라인, 홈 인디케이터 라인을 포함하는 영역이 Safe Area 이다.

### Q) Left Constraint와 Leading Constraint의 차이점을 설명하시오.
A) Leading Constraint는 어떤 객체의 앞쪽 가장자리를 뜻하고, Left Constraint는 객체 왼쪽을 뜻한다.

### Q) Auto Layout과 Frame-based Layout의 차이점은 무엇인가요?
A) Auto Layout은 제약조건에 따라 뷰 계층 구조에 있는 모든 뷰의 크기와 위치를 동적으로 지정해주지만, Frame-based Layout은 기기가 변하여도 frame은 절대 변하지 않는 특징을 가지고 있고 이것이 결정적인 차이이다.

