#  SwiftUI_State

![](https://velog.velcdn.com/images%2Fnnnyeong%2Fpost%2F7331afe2-a106-42c0-9503-24fad538fed0%2Fimage.png)
<br>

UIKit을 통해 개발을 할때는 어떤 변수에 변화가 생기면 해당 변화를 직접 관촬하고 새로운 UI를 위해 반영을 해주었어야 했는데 SwiftUI에서는 **property wrapper**를 활용해 이러한 작업을 자동화 할 수 있도록 하였다.
<br>

- **property wrapper**: 변화가 생기면 해당 변수의 값을 읽거나 새로 쓸 수 있음을 의미
- SwiftUI는 @State로 선언된 property들의 저장소를 관리한다.
- **State value**값이 변경되면 View는 해당 value의 appearance를 무효화하고 다시 body 값을 계산한다.
- **@State** 변수값이 변경되면 View를 다시 렌더링 하기 때문에 항상 최신값을 가진다.
- **@State** 인스턴스는 그 자체로 값이 아닌, 값을 읽고 쓰는 것을 의미한다.
- 현재 View UI의 특정 상태를 저장하기 위해 만들어진 것이기 때문에 보통 private으로 선언한다.
- **@State** 속성으로 어떤 프로퍼티의 초기값을 지정했다면, 다른 값으로 재할당이 불가하나 **@Binding** 변수를 통해서만 가능하다.
<br>
<br>
<br>

![11](https://user-images.githubusercontent.com/63503972/230119299-fe9d4524-740f-49d2-a082-221e80527a5d.gif)


```swift
// property
@State private var backgroundColor: Color = Color.green
@State private var myTitle: String = "아직 버튼 안눌림"
@State private var count: Int = 0

var body: some View {
    ZStack {
        // background
        backgroundColor
            .ignoresSafeArea()
        
        // content
        VStack(spacing: 20) {
            Text(myTitle)
                .font(.title)
            Text("카운트: \(count)")
            
            HStack(spacing: 20) {
                Button {
                    // action
                    self.backgroundColor = .red
                    self.myTitle = "1번 버튼 눌림"
                    self.count += 1
                } label: {
                    Text("1번 버튼")
                }
                
                Button {
                    // action
                    backgroundColor = .purple
                    myTitle = "2번 버튼 눌림"
                    count -= 1
                } label: {
                    Text("2번 버튼")
                }


            }
        } // VStack
        .foregroundColor(.white)
    }
}
```
<br>

1번 버튼, 2번 버튼 이 두가지 버튼은 action으로 background, myTitle, count의 값을 바꾸는 행위를 한다.
<br> 값을 바꾸는 동시에 바로 UI에 적용되는 모습을 볼 수 있는데, 어떻게 값을 할당만 했는데 UI까지 업데이트가 되었을까?
<br> 바로 이 세가지 변수가 State로 선언이 되었기 때문이다.
