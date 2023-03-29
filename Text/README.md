#  SwiftUI_Text

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228459398-026800d9-771f-4cb4-9405-f5adfa313d02.png">

```swift
Text("Hello SwiftUI!")
    .font(.title)
    .fontWeight(.semibold)
    .bold() // == .fontWeight(.bold)
    .underline(true, color: .red) // 밑줄, bool 타입으로 설정 가능
    .italic() // 글자를 기울릴 수 있다.
    .strikethrough(true, color: .green) // 취소선, bool 타입으로 설정 가능
```
- Font 사이즈를 title, body, footnote 등으로 정하면 기기 사이즈에 따라 reponsive하게 변화한다.
- underline, strikethrough등은 bool 타입으로 설정이 가능하다.
<br>
<br>
<br>

```swift
Text("Hello UIKit!".uppercased())
    .font(.system(size: 25, weight: .semibold, design: .serif))
```
- 이 방법으로 Text를 만들면 사이즈를 명시할 수 있다.
    - 단점은 기기 사이즈에 상관없이 고정이 되기 때문에 이것을 고려해서 사용해야한다.
<br>
<br>
<br>

```swift
Text("멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다.")
    .multilineTextAlignment(.leading)
    .foregroundColor(.red)
```
- 두 줄 이상의 멀티라인 텍스트를 정렬해줄 수 있다.
- 옵션은 leading, trailing, center가 있다.
