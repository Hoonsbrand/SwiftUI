# SwiftUI_TernaryOperators

![11](https://user-images.githubusercontent.com/63503972/230538501-b766a021-7014-4f6b-8bbe-a917b58a233f.gif)

```swift
@State private var isStartingState: Bool = false

var body: some View {
    VStack {
        // 1. if else 조건문
        Button {
            isStartingState.toggle()
        } label: {
            Text("if else 버튼: \(isStartingState.description)")
        }
        
        if isStartingState {
            RoundedRectangle(cornerRadius: 25)
                .fill(.red)
                .frame(width: 200, height: 100)
        } else {
            RoundedRectangle(cornerRadius: 25)
                .fill(.blue)
                .frame(width: 200, height: 100)
        }
        
        // 2. 삼항 연산자
        Button {
            isStartingState.toggle()
        } label: {
            Text("삼항연산자 버튼 : \(isStartingState.description)")
        }

        Text(isStartingState ? "빨강" : "파랑")
        
        RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
            .fill(isStartingState ? .red : .blue)
            .frame(
                width: isStartingState ? 200 : 50,
                height: isStartingState ? 400 : 100
            )
        
        Spacer()

    }
}
```
<br> 

> Conditional 파트에서 사용한 if-else 조건문을 보다 간결하게 작성할 수 있는 삼항연산자를 이용했다.
    <br> 두개의 버튼은 같은 State 변수를 가르키기 때문에 한개의 버튼만 눌러도 두개의 도형이 변화한다.
