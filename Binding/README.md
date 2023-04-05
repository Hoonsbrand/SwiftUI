# SwiftUI_Binding

> SwiftUI에서 자신 View의 상태값을 저장하기 위해서는 State wrapper를 사용한다.
    <br> 하지만 이 상태값을 자신의 Subview(하위 뷰)에도 적용시킬 경우도 존재한다.
    <br> 이럴때 사용하는 것이 binding wrapper 이다.
<br>

# ContentView - 상위 View

![11](https://user-images.githubusercontent.com/63503972/230134583-e63d7b16-8438-4ce8-8a42-a0791d25bf55.gif)

```swift
// MARK: - Properties
@State private var backgroundColor: Color = .green
@State private var title: String = "Binding Basic View"

var body: some View {
    ZStack {
        // background
        backgroundColor
            .ignoresSafeArea()
        
        // content
        VStack {
            Text(title)
            
            // button
            // parameter로 @State의 값에 $를 붙여준다.
            BindingChild(backgroundColor: $backgroundColor, title: $title)
        }
    }
}
```
<br>

ContentView에서 State 변수로 선언된 backgroundColor, title에 초기값 이후 값을 할당하는 코드가 보이지 않는데 어떻게 UI가 업데이트 되는 것일까?
<br> 이는 바로 버튼을 담당하는 BindingChild를 호출 할 때 State 변수를 파라미터로 넣어주었기 때문이다.
<br> 값을 감지하는 State 변수를 Binding으로 받는 View에 넘겨주기 위해서는 $ 기호를 앞에 붙여 State 변수임을 명시해주어야 한다.
<br>
<br>
<br>

# BindingChild - 하위 View

<img width="277" alt="image" src="https://user-images.githubusercontent.com/63503972/230135391-ce3a6d17-158a-4854-839b-f0b1ace8b1d4.png">

```swift
struct BindingChild: View {
    // MARK: - Properties
    @State private var buttonColor: Color = .blue
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    var body: some View {
        Button {
            // action
            backgroundColor = .orange
            buttonColor = .pink
            title = "Binding Child View"
        } label: {
            Text("Child View 이동")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }

    }
}

struct BindingChild_Previews: PreviewProvider {
    static var previews: some View {
        BindingChild(backgroundColor: .constant(.orange), title: .constant("Binding Child"))
            .previewLayout(.sizeThatFits)
    }
}
```
<br>

BindingChild 안에서만 사용하는 State 변수 buttonColor 하나와 상위 View에서 사용했던 이름과 같은 두개의 Binding 변수가 있다.
<br> 아무 이유 없이 이름을 동일하게 만든 것이 아닌, 상위 View의 State 변수를 Binding 받기 위해서는 무조건 같은 이름으로 선언해야한다.
<br>

버튼의 동작을 담당하는 action 부분에서 상위 View에서 의문이였던 View의 업데이트가 이루어진다.
<br> 버튼을 누르면 backgroudColor와 title을 변경해주며 이를 상위 View의 State 변수가 감지해 업데이트가 되는 것이다.
<br> 즉, 자식 View에서 값을 수정하려면, 부모에서 자식으로 Binding을 전달하여 자식 View에서 값을 수정할 수 있고, 
<br> Binding을 이용하여 자식 View에서 값이 변경되면 부모 View에도 값이 변경되도록 처리된다. 
<br>
<br>
<br>

### constant
PreviewProvider는 다양한 상황에서의 View를 미리 보여주는 것이기 때문에, 다른 View에서 값이 변화하는 것에 따라 Preview를 새로 그리는 데에는 무리가 있다.
<br> 그렇기 때문에 PreviewProvider에서는 constant(_:)라는 Binding의 타입 메서드를 통해서 각 Binding 변수의 특정 값을 고정 값으로 제공하여, 해당 값에 따른 Preview를 확인할 수 있다.
<br> 공식문서에서 확인할 수 있듯, constant는 원하는 값을 인자로 넘겨주기만 하면 해당 값을 Binding 타입으로 return한다.
