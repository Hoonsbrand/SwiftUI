#  SwiftUI_Sheet

> **sheet**: 현재 View에서 약 90% 부분 정도 overlay 되는 View
    <br>**fullScreenCover**: 현재 View에서 전체 부분 overlay 되는 View


# ✏️ ContentView

![11](https://user-images.githubusercontent.com/63503972/230632586-72b05a7c-a54c-4035-8b3f-f06158fb9288.gif)

```swift
@State private var isShownSheet: Bool = false
@State private var isShownFullscreen: Bool = false

var body: some View {
    ZStack {
        // MARK: - Background
        Color.green.ignoresSafeArea()
        
        // MARK: - Content
        VStack(spacing: 20) {
            
            // sheet 버튼
            Button {
                isShownSheet.toggle()
            } label: {
                Text("Sheet Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isShownSheet) {
                SheetBasic()
            }
            
            // fullscreen 버튼
            Button {
                isShownFullscreen.toggle()
            } label: {
                Text("FullScreen Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .fullScreenCover(isPresented: $isShownFullscreen) {
                SheetBasic()
            }
            
        }
    }
}
```
<br>

State 변수인 isShownSheet와 isShownFullscreen은 버튼을 클릭할 때마다 toggle이 된다.
<br> 버튼을 눌러 sheet이나 fullscreen이 나타나면 true로, 다시 없애면 false로 바뀐다.
<br> .sheet이나 .fullScreenCover의 파라미터인 isPresented로 sheet나 fullscreen을 표시할지 여부를 제어할 수 있다.
<br> 이 과정을 순서대로 한번 정리해볼까 한다! (isShownSheet를 예시로 사용한다.)
<br>
    
1. 초기에 **isShownSheet** 변수는 false로 설정된다.
<br>

2. 사용자가 Button을 누르면, **isShownSheet** 변수의 값을 toggle() 함수를 사용하여 반전시킨다.
<br>

3. **isShownSheet** 변수가 변경되면 SwiftUI가 이를 감지하여 **isPresented** 매개 변수와 바인딩된 **isShownSheet** 변수의 값을 확인한다.
<br>

4. **isShownSheet** 변수의 값이 true로 변경되었으므로, SwiftUI가 SheetBasic 뷰를 포함한 시트를 화면에 표시한다.
<br>

5. 사용자가 시트를 닫으면 SwiftUI가 **isShownSheet** 변수의 값을 자동으로 false로 변경하여 시트를 닫는다.
<br>
<br>
<br>

> **fullScreenCover**는 보다시피 Sheet과 다르게 화면을 모두 다 채우기 때문에 왼쪽 상단에 있는 버튼을 이용해 이전 View로 돌아간다.
    <br> **fullScreenCover**는 모달 뷰 내부에서 닫을 수 있는 버튼을 제공하지 않기 때문에 사용자 지정 버튼을 만들어서 모달 뷰를 닫을 수 있도록 해야한다.
    <br> **SheetBasic()**에서 이전 View로 돌아가는 동작을 구현해보자.
<br>
<br>
<br>

# ✏️ SheetBasic

<img width="402" alt="image" src="https://user-images.githubusercontent.com/63503972/230635462-ba5563ae-779e-4ca4-b396-542494df29d1.png">

```swift
@Environment(\.dismiss) var dismiss

var body: some View {
    ZStack(alignment: .topLeading) {
        
        // background
        Color.red.ignoresSafeArea()
        
        // contents
        Button {
            // Sheet 닫기 action
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding()
        }

    }
}
```
<br>

### State와 Binding을 열심히 이해하려고 하고 있는데 Environment는 또 무엇인가!!
>  SwiftUI에서 @Environment(.dismiss)는 시트(sheet), 풀스크린(fullScreenCover)와 같은 모달(modal) 뷰에서 닫기(dismiss) 동작을 수행할 수 있는 환경 변수다. 이 변수는 환경 변수의 key-path를 사용하여 정의된다.
    <br> 모달 뷰는 다른 뷰의 상위 뷰에서 표시되며, 모달이 닫히면 다시 상위 뷰로 되돌아간다. 이때 @Environment(.dismiss)를 사용하면 모달 뷰 내부에서 닫기(dismiss) 동작을 수행할 수 있다.
<br>
<br>
<br>

### SwiftUI의 환경변수(@Environment)란?
> SwiftUI의 환경변수는 앱에서 공유되는 데이터를 저장하고 사용하는 속성이다. 예를 들어, .colorScheme은 현재 앱의 테마를 가져오거나 변경할 수 있는 값을 가지며, 다른 예로는 디바이스의 화면 크기나 언어 설정 등이 있다.
    <br> @Environment 속성을 사용하여 환경변수에 접근할 수 있으며, 시스템에서 제공하는 것만 사용할 수 있는게 아닌 사용자가 직접 앱에 필요한 변수를 추가하고 활용할 수 있다.
    <br> @Environment 속성은 key-path를 사용하여 값을 읽거나 설정하며, key-path는 환경변수의 이름을 나타낸다. 이를 사용하면 간단하게 환경변수에 접근하고 값을 변경할 수 있다.
