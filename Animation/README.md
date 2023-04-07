# SwiftUI_Animation

> **Animation**: 시작, 상태변화, 도착 3가지 단계로 어떠한 로직이 실행될 때 object의 동적인 움직임을 설정할 수 있다.
    <br> **시작**: View의 최초 상태
    <br> **상태변화**: View가 최초상태에서 멈추는 진행과정 상태
    <br> **도착**: View가 도달하려는 목표 지점이고, 도착하면 멈추는 상태
<br>
<br>

```swift
withAnimation(animation: Animation?, body: () throws -> Result)

.animation(animation: Animation?, value: Equatable)
```
<br>

### animation: Animation? 
**withAnimation**과 **.animation**의 animation 파라미터는 애니메이션의 타이밍 함수를 지정하는데 사용된다. 
<br> **Animation**은 애니메이션의 속성을 지정하는 열거형으로 여러 가지 유형의 애니메이션을 나타내는 케이스가 포함되어 있다.
<br>

### 주요 Animation 케이스
- **linear**: 애니메이션 효과가 처음부터 끝까지 일정한 속도로 진행된다.
- **easeIn**: 애니메이션 효과가 시작할 때 느리게 시작되며, 점점 빨라지는 속도로 진행된다.
- **easeOut**: 애니메이션 효과가 처음에는 빠르게 시작되며, 끝에 가까울수록 점점 느려지는 속도로 진행된다.
- **easeInOut**: 애니메이션 효과가 시작과 끝에서 느리게 진행되고, 중간에는 빠르게 진행된다.
- **spring**: 스프링 애니메이션 효과로, 초기에는 빠르게 시작되며, 마지막에는 스프링 효과로 완료된다.
- **interpolatingSpring**: 보간 스프링 애니메이션 효과로, 시작과 끝에서는 스프링 애니메이션을 사용하고 중간에서는 보간 애니메이션을 사용한다.
<br>

이 외에도 Animation 열거형에는 애니메이션 효과의 시간 간격, 반복 횟수, 지연 시간 등을 설정하는 다양한 메서드와 프로퍼티가 있다. 예를 들어, .delay 메서드는 애니메이션 효과의 시작을 지연시키는 데 사용된다. .repeatCount 메서드는 애니메이션 효과의 반복 횟수를 설정한다.
<br>
<br>

### withAnimation 클로저
<br> **withAnimation**은 클로저 형태로 사용되며, 클로저 안에서 애니메이션을 적용하려는 코드를 작성한다.
<br> **withAnimation** 함수를 사용하여 상태(State) 속성을 업데이트 할 때, SwiftUI는 자동으로 애니메이션 효과를 적용한다.
<br> 따라서, **isAnimated** 변수가 변경될 때마다, 해당 View의 상태가 변경되므로 해당 View의 애니메이션 효과가 자동으로 업데이트 된다.
<br>
<br>
<br>

## properties 
```swift
@State private var isAnimated: Bool = false

private let timing: Double = 5.0
```
<br>
<br>
<br>

## 1번 View

![11](https://user-images.githubusercontent.com/63503972/230539244-5a6e6d49-0d41-4a6e-b275-3cef1bad3a8d.gif)

```swift
VStack {
    Button {
        withAnimation(
            .default
//                        .repeatCount(5)       // 반복 횟수 지정
//                        .repeatForever()      // 계속 반복
//                        .delay(1.0)           // 딜레이
        ) {
            isAnimated.toggle()
        }
    } label: {
        Text("Button")
    }
    
    Spacer()
    
    RoundedRectangle(cornerRadius: isAnimated ? 50: 0)
        .fill(isAnimated ? .red : .green)
        .frame(
            width: isAnimated ? 100 : 300,
            height: isAnimated ? 100 : 300
        )
        .rotationEffect(Angle(degrees: isAnimated ? 360 : 0)) // 도형을 특정 각도로 돌릴 수 있음
        .offset(y: isAnimated ? 300 : 0) // View가 horizontal, vertical 방향으로 할당한 값만큼 이동
    
    Spacer()

} // VStack
```
<br>


### isAnimated 변수를 withAnimation 안에서 toggle 했을 뿐인데?
애니메이션 효과는 **isAnimated** 변수가 **true**에서 **false**로, 또는 **false**에서 **true**로 전환될 때 발생한다.
<br> 이는 **RoundedRectangle**의 속성 중 **cornerRadius**, **fill**, **frame**, **rotationEffect**, **offset** 등이 변경되는 데 사용된다.
<br> 이러한 속성 변경에 따라 SwiftUI는 자동으로 애니메이션을 적용한다.
<br> **따라서!!!** 클로저 내에서 **isAnimated**변수를 업데이트하면 해당 View의 애니메이션 효과가 자동으로 적용된다.
<br>
<br>
<br>






## 2번 View - Speed에 따른 animation

![22](https://user-images.githubusercontent.com/63503972/230539250-ad17b85f-af8e-4500-a54e-ea714f1c81a3.gif)

```swift
VStack {
    Button {
        isAnimated.toggle()
    } label: {
        Text("Button")
    }
    
    // linear animation: 처음부터 끝까지 속도가 일정
    RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.linear(duration: timing), value: isAnimated)
    
    // easeIn animation: 처음에 느렸다가 끝에 빨라지는 효과
    RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeIn(duration: timing), value: isAnimated)
    
    // easeOut animation: 처음엔 빨랐다가 끝에 느려지는 효과
    RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeOut(duration: timing), value: isAnimated)
    
    // easeInOut animation: 처음과 끝에 느려지고, 중간부분이 빨라지는 효과
    RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeInOut(duration: timing), value: isAnimated)

} // VStack
```
<br>

2번 View에서는 1번 View와 달리 버튼을 눌렀을 때 isAnimated를 사용하는 View에 전체적으로 애니메이션 효과를 적용시킨 것이 아닌 각 View마다 애니메이션 효과를 부여했다. 
<br> 그렇다면 .animation은 withAnimation과 어떻게 다를까?
<br>

### .animation
> **.animation**과 **withAnimation**은 모두 SwiftUI에서 애니메이션 효과를 적용하는 데 사용되지만, 사용 방법과 적용 대상이 약간 다르다.
<br>

- **.animation**
    - 특정 View의 상태 변경 시 애니메이션 효과를 적용하도록 설정하는 데 사용된다.
    - 이 메서드는 View에 직접 적용되며, View의 일부분이 변경될 때 해당 View에 적용된 애니메이션 효과가 적용된다.
    - 또한, **.animation** 메서드는 해당 View에서만 적용되며, 하위 View에는 적용되지 않는다.
<br>

> 따라서 **.animation** 메서드는 특정 View에서 애니메이션 효과를, **withAnimation** 메서드는 모든 View에서 애니메이션 효과를 적용한다.
<br>






## 3번 View - Spring animation

![33](https://user-images.githubusercontent.com/63503972/230539264-a7d230b0-c359-4a48-bb00-4fb01fdee291.gif)

```swift
VStack {
    Button {
        withAnimation(.spring(
            response: 0.5,
            dampingFraction: 0.5,
            blendDuration: 0)) {
                isAnimated.toggle()
            }
    } label: {
        Text("Button")
    }
    
    RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)

} // VStack
```
<br>

맨위에서 언급한 것 처럼 스프링 애니메이션 효과는 초기에는 빠르게 시작되며, 마지막에는 스프링 효과로 완료되는 애니메이션 효과이다.
<br> 말 그대로 View가 스프링처럼 튕겨진다.
<br>

- **response**
    - 애니메이션의 진행 속도를 결정한다.
    - 값이 낮을수록 빠르게 진행되며, 값이 높을수록 천천히 진행된다.
<br>

- **damping**
    - 애니메이션의 진동 강도를 결정한다.
    - 갚이 높을수록 진동이 약해지고, 갚이 낮을수록 진동이 강해진다.
<br>

- **blendDuration**
    - 애니메이션의 시작과 끝을 부드럽게 연결하는데 사용된다.
    - 값이 낮을수록 부드러운 전환 효과가 발생한다.
<br>

이러한 값을 조정하여 다양한 종류의 spring 애니메이션 효과를 만들 수 있다. 
<br>예를 들어, 값이 높은 damping 값을 사용하면 탄성이 감소하여 애니메이션이 빨리 끝난다.
<br> 반면에, 값이 높은 response 값을 사용하면 빠르게 진행되는 자연스러운 애니메이션 효과를 만들 수 있다.
<br> blendDuration 값을 적절히 조절하면 애니메이션의 시작과 끝이 부드럽게 연결된다.



