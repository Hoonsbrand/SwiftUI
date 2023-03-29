#  SwiftUI_Icon

> Apple에서 제공하는 SFSymbols를 SwiftUI에서 이용해보자
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228495115-ed6fcc0f-e8d1-4681-8682-015b9d063e3a.png">

```swift
VStack(spacing: 20) {
    Image(systemName: "person.fill.badge.plus")
        .resizable() // 크기를 화면사이즈내 최대로 키운다.
    
    // renderingMode에서 original로 하게되면 실제 color에서 multi color로 변경된다.
    // 즉, 고유 값 color로 변경되어서 color를 변경하더라도 변경되지 않는 color 값이 된다.
        .renderingMode(.original)
        .scaledToFill()
        .foregroundColor(.red)
        .frame(width: 300, height: 300)
}
```
