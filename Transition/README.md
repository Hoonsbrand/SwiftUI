# SwiftUI_Transition

## 기대한 화면
![11](https://user-images.githubusercontent.com/63503972/230554102-ec900230-6666-4a8f-ae14-974e57962486.gif)
<br>
<br>
<br>

## 실제 결과
![22](https://user-images.githubusercontent.com/63503972/230554118-1819ef53-453e-45ca-94d9-0610c5f99d08.gif)

```swift
@State var showTransition: Bool = false

var body: some View {
    GeometryReader { geo in
        
        ZStack(alignment: .bottom) {
            VStack {
                Button {
                    withAnimation(.easeInOut) {
                        showTransition.toggle()
                    }
                } label: {
                    Text("Button")
                }
                
                Spacer()
            } // VStack
            
            if showTransition {
                RoundedRectangle(cornerRadius: 30)
                //  .frame(height: UIScreen.main.bounds.height * 0.5) // UIScreen.main deprecated -> geometry 사용
                    .frame(height: geo.size.height * 0.5)
                    .opacity(showTransition ? 1.0 : 0.0)
                    .transition(.asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .trailing)))
            }
        } // ZStack
        .ignoresSafeArea(edges: .bottom)
        
    } // GeometryReader
}
```
<br>

> 난 버튼에 대한 애니메이션을 적용한 적이 없는데... 왜 버튼이 하단 View와 함께 이동할까?
    <br> 이는 GeometryReader와 관련이 있다.
    <br> 강의에서는 **UIScreen.main.bounds.height**를 사용하여 스크린의 높이를 가져왔지만 UIScreen.main이 deprecated 될 예정이기에 GeometryReader를 사용했지만 깊은 이해가 없어서 일어난 상황이다. 

<br>
<br>
<br>

# GeometryReader?

> To provide relative size information of a parent view to its
    child views, you can use a GeometryReader.
    <br> 상위 뷰의 상대적 크기 정보를 하위 뷰에 제공하려면 GeometryReader 를 사용할 수 있다.
<br>

## 사용하는 이유

> VStack, HStack, ZStack 과 같은 View Builder 에 하위뷰들을 넣게되면 별도의 설정없이 화면에 자동으로 보여준다.
    <br> 이것은 Parent View 상위뷰가 Child View 하위뷰에게 위치와 크기를 제안해주기 때문이다.
    <br> 그리고, 맘에 들지 않을 때 하위 뷰는 상위 뷰의 제안을 무시하고 선언할 수 있다.
    <br> 이때 사용되는 것이 GeometryReader이다.
<br>
<br>
<br>

# 문제점 파악하기

![11](https://user-images.githubusercontent.com/63503972/230552052-1eb63ba7-0349-4037-a07f-b1a983e4e1af.gif)

```swift
GeometryReader { geo in
    
    ZStack(alignment: .bottom) { ... } // ZStack
    .background(Color.red)
    .ignoresSafeArea(edges: .bottom)
} // GeometryReader
.background(Color.blue)
```
<br>

ZStack과 GeometryReader의 영역을 보기 위해서 Color를 적용했다.
<br> 예상대로 ZStack은 가장 왼쪽 영역 Button 만큼의 width와 Spacer를 중간에 배치해 최대의 height를 가진 것을 볼 수 있다.
<br> GeometryReader는 화면의 전체를 차지한다. (ZStack의 Opacity를 낮춰서 확인해보았다.)
<br>
<br>
<br>
 
ZStack을 혼자 사용할 때는 중앙에 잘 위치 했지만 GeometryReader 내부에서는 가장 왼쪽 즉, x 좌표 0, y 좌표 0 에서 ZStack이 생성된 이유는 생각보다 간단했다.
<br>

ZStack을 홀로 사용할 때는 ViewBuilder에서 제안한대로 위치를 잡았지만, GeometryReader를 사용하면 ZStack 스스로 직접 자신의 위치를 설정할 수 있다.
<br> 그러므로 해당 코드에서는 ZStack의 width에 대한 어떠한 설정도 해주지 않았기 때문에 button의 초기 생성 위치는 (0,0)이 되고, 하단에 max width를 가진 RoundedRectangle이 나타났을 때 비로소 ZStack의 width가 변경되는 것이다.
<br>

1. 버튼을 가지고있는 VStack은 항상 ZStack의 중앙에 위치한다.
2. ZStack에 대한 정확한 사이즈를 설정해주지 않아 GeometryReader의 기본 좌표인 (0,0)에 생성된다.
3. 버튼을 누르면 최대 width를 갖는 RoundedRectangle이 등장해 ZStack의 width도 변경된다.
4. VStack은 항상 ZStack의 중앙에 있기에 버튼이 중앙으로 이동하는 것처럼 보인다.
<br>

> 이를 통해, 처음부터 ZStack의 사이즈를 설정해주면 된다는 해결 방법을 알아냈다!
<br>
<br>
<br>

# 해결하기

![11](https://user-images.githubusercontent.com/63503972/230554102-ec900230-6666-4a8f-ae14-974e57962486.gif)

```swift
GeometryReader { geo in
    ZStack(alignment: .bottom) { ... } // ZStack
    .frame(maxWidth: .infinity)
    .ignoresSafeArea(edges: .bottom)
} // GeometryReader
```
<br>

처음부터 ZStack의 width를 **.infinity**로 설정해주어 원했던 결과가 나왔다.
<br>
<br>
<br>

# Transition

> SwiftUI에서 애니메이션 효과를 부여하는 방법은 **Animation**과 **Transition**이 있다.
    <br> **Animation**은 View가 바뀔 때 애니메이션을 부드럽게 만들어주는데 사용되는 반면, **Transition**은 View가 **추가되거나 제거될 때** 애니메이션을 적용하는 데 사용된다.
    <br>
    **Transition**에는 **animation** 속성을 사용하여 어떤 애니메이션 효과를 사용할 것인지 지정할 수 있다.
<br>

### 사용한 효과
- **move(edge:)** : View가 지정한 방향에서 이동하는 애니메이션을 만들 수 있다.
- **opacity**: View가 나타났다가 사라지는 애니메이션을 만들 수 있다.
- **scale**: View가 커졌다가 작아지는 애니메이션을 만들 수 있다,
- **asymmetric**: transition 중 입체감을 더해주는데, 진행 중인 애니메이션의 시작점과 끝점에 서로 다른 transition 효과를 적용할 수 있도록 해준다.
<br>
<br>
<br>

## move transition

![11](https://user-images.githubusercontent.com/63503972/230560858-609da084-514e-4962-b677-a8688a15e335.gif)

```swift
.transition(.move(edge: .bottom))
```
<br>
<br>
<br>

## opacity transition

![22](https://user-images.githubusercontent.com/63503972/230560866-2955fa1e-498e-4be8-9064-ea0b2f8eb77b.gif)

```swift
.transition(.opacity)
```
<br>
<br>
<br>

## scale transition

![33](https://user-images.githubusercontent.com/63503972/230560872-817e3d84-fd48-4e11-af73-7fd7f6cfaaf9.gif)

```swift
.transition(.scale)
```
<br>
<br>
<br>

## asymetric transition

![44](https://user-images.githubusercontent.com/63503972/230560881-d9e9dea3-8033-4275-a4b8-696805e81e32.gif)


```swift
.transition(.asymmetric(
    insertion: .move(edge: .leading),
    removal: .move(edge: .trailing)))
```
<br>
<br>
<br>





