# SwiftUI_ExtractView

> 코드의 양이 많아지고 복잡해지면 body에 있는 부분이 길어져서 코드를 읽기에 어려움이 생긴다.
    <br>그래서 body에 있는 내용을 한번에 묶어 밑으로 내리거나 파일을 만듬으로 컴포넌트화 해서 사용할 수 있다.
    <br>이렇게 한다면 장점은 코드 가독성이 높아지고 컴포넌트를 사용해서 나중에 코드 작성자가 아닌 다른 사람이 코드를 수정할 때 훨씬 이해가 빠르고 유지보수 측면에도 도움이 된다.
<br>
<br>
<br>    

# body 밑 새로운 some View 만들기
    
![11](https://user-images.githubusercontent.com/63503972/230125569-0dd408ea-dd6e-4ce5-87c9-e982138e86c7.gif)

```swift
// properties
@State var backgroundColor: Color = .pink

var body: some View {
    ZStack {
        // background
        backgroundColor
            .ignoresSafeArea()
        
        // content
        contentLayer
        
    } // ZStack
}

// Content
var contentLayer: some View {
    VStack {
        Text("Extract View 연습")
            .font(.largeTitle)
        
        Button {
            // action도 함수로 따로 뺄 수 있다.
            buttonPressed()
        } label: {
            Text("바탕색 변경")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
        }
    }
}

// Function
func buttonPressed() {
    backgroundColor = .yellow
}
```
<br>

body 부분을 보면 ZStack에 contentLayer라는 변수가 하나 있을 뿐인데 화면이 완성된 모습을 볼 수 있다.
<br> 밑에 some View로 선언한 contentLayer에서 UI를 구성해주고 body에서 호출해준것이다.
<br> 이런식으로 body에 직접 View를 그리지 않고 따로 만든 변수에 UI를 만들어놓고 호출만 하면 body를 봤을 때 어떤식으로 UI가 구성되어있는지 쉽게 확인할 수 있다.
<br>
<br>
<br>

# 컴포넌트화

### 1. 컴포넌트 만들기

<img width="266" alt="image" src="https://user-images.githubusercontent.com/63503972/230128441-9b468e30-629a-49c1-9b60-2d0003f232c3.png">

```swift
struct ItemBasic: View {
    // MARK: - Properties
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct ItemBasic_Previews: PreviewProvider {
    static var previews: some View {
        ItemBasic(title: "사과", count: 1, color: .red)
            .previewLayout(.sizeThatFits)
    }
}
```
<br>

ItemBasic이라는 다른 View에서 사용하기 편하도록 만든 View가 있다.
<br> 이를 컴포넌트로 다른 View에서 사용한다면 해당 View의 코드가 줄어들 뿐 아니라 각 컴포넌트별로 관리가 쉬워질 것이다.
<br> 참고로 PreviewProvider에서 **.previewLayout(.sizeThatFits)**을 적용하면 위 사진처럼 컴포넌트에 딱 맞는 사이즈로 View를 볼 수 있다.
<br>
<br>
<Br>

### 2. 만든 컴포넌트 사용하기

<img width="406" alt="image" src="https://user-images.githubusercontent.com/63503972/230130199-d9e4ccd0-9067-49cd-86fb-aab4cf3884f1.png">

```swift
struct ExtractSubViewBasic: View {
    var body: some View {
        ZStack {
            // background
            Color.cyan
                .ignoresSafeArea()
            
            // content
            contentLayer
            
        }
    }
    
    var contentLayer: some View {
        HStack {
            ItemBasic(title: "사과", count: 1, color: .red)
            ItemBasic(title: "오렌지", count: 10, color: .orange)
            ItemBasic(title: "바나나", count: 34, color: .yellow)
        }
    }
}

struct ExtractSubViewBasic_Previews: PreviewProvider {
    static var previews: some View {
        ExtractSubViewBasic()
    }
```
<br>

contentLayer에서 ItemBasic 컴포넌트를 불러와 아주 적은 코드로 화면을 구성할 수 있다.
