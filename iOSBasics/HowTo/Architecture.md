#  iOS application architecture
## MVVM, MVC, VIPER 

## 좋은 아키텍쳐 
- 각각의 객체들이 구체적이고 명확한 역할을 가짐
- 단순한 데이터 흐름 : 이해하기쉽고, 디버그하기 쉬움
- Shrared resource 사용 : 여기저기서 변경하게되면 오류찾기 어려움
- 특정 프레임워크나 서비스에 종속되지 않게! 중간에 추상화 계층 사용
==> 특정서비스가 종료되거나 다른 서비스로 변경하기 쉽게 
- 이해하기 쉽고, 쉽게 바꿀수 있는 유연함 
- 테스트 용이
- 관심사 분리 Separation of concern "SRP(single responsibility principle)"

### Testing 
- 테스트 용이성 
- TDD : 테스트 코드를 먼저 작성 
==> 아키텍쳐, 클래스, 매니저등을 구현하기 전에 API 디자인을 하게됨 
==> API 사용자 관점에서 코드 작성 
- TDD "reg-green-refactor" :  우선 실패하는 테스트 코드를 작성하고 컴파일 => 코드수정, 리팩토링 


- 의존성 줄이기 : 3rd party 서비스는 중단될수 있음. 프로젝트와 3rd party 서비스 사이에 계층을 추가 

### 잘못된 아키텍쳐 체크 
- 소스코드 라인수 체크: 너무 긴 파일은 의심해보아야.
find . -type f -exec wc -l {} + | sort -n 

- global state 와 AppDelegate 를 프로젝트에 사용했는가 
==> 싱글톤을 사용해라
==> Denpendency visualizer 이용(클래스가 서로 연결된 내용을 보여줌)


### 디자인 패턴
- SOLID 
- Singleton 적절히 사용 : DB 접근, 하나의 인터페이스만 허락될때 사용 

### Composition 
- single responsibility 와 DRY(Don't repeat yourself)를 준수하는 코드를 얻게됨 
==> 재사용 가능한 코드, 중복되지 않는 코드 
- "SRP(single responsibility principle)" DRY(Don't repeat yourself)
- Unity 

### 의존성 주입
- 테스트에도 활용 
- 구현코드를 바꿀 수 있음
- 더 적은 테스트로도 같은 테스트 커버리지를 달성 

## iOS architecure patterns (by bogdan orlov)
- MVC, VIPER, MVVM 

### MVC 
- 웹에 더 적합
- 컨트롤러가 모델데이터를 가져와서 뷰에 표시
- 모델이 변경되면 컨트롤러가 새로운 뷰를 만듬
=> iOS 에서는 특정 프레임워크를 사용해야 하므로 고전적인 MVC 패턴 적용 어려움
==> 컨트롤러 비중이 매우 커짐. massive view controller 
===> view controller 가 view life cycle 과 강하게 연결되어있음. 분리, 재사용 불가 
====> 결국 모델만 재사용가능 

- composition, injection 없음. 테스트 어려움


### VIPER 
- biz logic 을 interator 가 담당. 
- Router 
- 코드가 많아짐 

### MVVM 
- UIViewController, UIView : VIEW 계층으로 분류 
- ViewModel 에는 UIKit 관련 코드가 없음 
=> 테스트 용이 

- 단점. 
=> 바인딩을 도와주는 라이브러리와 함께 사용해야. Reactiveocoa, RX 
=> 아니면, observable 클래스를 구현해야.

- 바인딩 
=> 

### MVVM + Flow Coordinators 


### ReSwift 
-  ReSwift는 백엔드나 웹 개발에서 사용되는 Redux를 iOS로 이식한 라이브러리이며 단방향 흐름(uni-directional flow) 아키텍처 
- libraries : Render


