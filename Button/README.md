#  SwiftUI_Button

> **Action** - 사용자가 버튼을 클릭할 경우 작업 수행 메서드
    <br> **Label** - 텍스트, 아이콘등 버튼을 라벨링
<br>
<br>
<br>

![11](https://user-images.githubusercontent.com/63503972/229470784-d3c865c6-fcc5-414c-b138-12cac4cd881b.gif)

```swift
struct ContentView: View {
    // property
    @State var mainTitle: String = "아직 버튼 안놀림"
    
    var body: some View {
        VStack(spacing: 20) {

            // 리셋 버튼
            Button {
                self.mainTitle = "아직 버튼 안놀림"
            } label: {
                Text("리셋 버튼")
            }
            
            Divider()
            
            // 라벨
            Text(mainTitle)
                .font(.title)
            
            Divider()
            
            // 1번 버튼
            // action -> button을 눌렀을 때 실행할 event
            // label -> button 모양 디자인
            Button {
                // action
                self.mainTitle = "기본 버튼 눌림"
            } label: {
                // label
                Text("기본 버튼")
            }
            .tint(.red)
            
            Divider()
            
            // 2번 버튼
            Button {
                self.mainTitle = "저장 버튼 눌림"
            } label: {
                Text("저장")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            
            Divider()
            
            // 3번 버튼
            Button {
                self.mainTitle = "하트 버튼 눌림"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    )
            }
            
            // Extra argument in call 에러
//            Divider()
            
            // 4번 버튼
            Button {
                self.mainTitle = "완료 버튼 눌림"
            } label: {
                Text("완료")
                    .font(.caption)
                    .bold()
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.5)
                    )
            }
        }
    }
}
```
<br>

```swift
Button(action: <#T##() -> Void#>, label: <#T##() -> Label#>)
```
> 버튼의 생성자는 action과 label로 구성되어있다.
    <br> action에는 button을 눌렀을 때 실행할 event를,
    <br> label에는 button 모양을 어떤식으로 디자인할 것인지 작성한다.
    <br> 위 코드의 5개의 버튼들은 label만 다르고 비슷한 기능들을 수행한다. 
    <br> 바로 mainTitle의 내용을 변경해주는 것인데, mainTitle 변수는 State 변수로 선언이 되어서 값의 변화를 감지하여 View를 새로 그려준다.
<br>

위 코드에서 Button을 만드는 방식은 매우 간단하여 이정도로만 정리를 해도 될것 같으나 영상과는 다르게 Divider를 매 Button 사이마다 넣어주면서 한가지 에러를 발견했다.
<br>

4번 버튼 바로 전에 Divider를 넣게되면 **"Extra argument in call"** 이라는 에러가 발생한다.
<br> 이를 해석해보면 **"호출에 추가 인수가 있다"** 를 의미하는데, SwiftUI에서 컨테이너 뷰의 자식은 총 10개 까지만 가능하다. 그래서 10개 이상의 자식을 추가 하면 Extra argument in call 를 error를 볼 수 있다.
<br>  

이런 현상을 해결하기 위해서는 Group으로 묶어서 View 작업을 수행하면 된다.
<br>
<br>
<br>

```swift
VStack(spacing: 20) {

    // 리셋버튼, Divider, Text, Divider, 1번 버튼, Divider, 2번 버튼, Divider
    Group { ... }
    
    // 3번 버튼
    Button {
        self.mainTitle = "하트 버튼 눌림"
    } label: {
        Circle()
            .fill(Color.white)
            .frame(width: 75, height: 75)
            .shadow(radius: 10)
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            )
    }
    
    Divider()
    
    // 4번 버튼
    Button {
        self.mainTitle = "완료 버튼 눌림"
    } label: {
        Text("완료")
            .font(.caption)
            .bold()
            .foregroundColor(.gray)
            .padding()
            .padding(.horizontal, 10)
            .background(
                Capsule()
                    .stroke(Color.gray, lineWidth: 2.5)
            )
    }
}
```
<br>

<img width="303" alt="image" src="https://user-images.githubusercontent.com/63503972/229475035-b71c4465-cd91-4c5a-99b6-2e9cb991a174.png">

<br>

**리셋버튼, Divider, Text, Divider, 1번 버튼, Divider, 2번 버튼, Divider** 총 8개의 자식들을 Group으로 묶어 SwiftUI의 컨테이너 뷰가 요구하는 10개 이하의 조건을 지켜 코드를 작성하여 원하는 결과물을 만들었다.
