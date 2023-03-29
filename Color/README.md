#  SwiftUI_Color

> SwiftUI가 제공하는 Color는 BasicColor, PrimaryColor, UIColor, CustomColor 총 4가지가 있다.
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228469705-656ac2f8-469f-4c1e-bb21-1066965fd7b4.png">

```swift
VStack(spacing: 20) {
    
    // Basic Color
    Text("Basic Color")
        .font(.title)
    RoundedRectangle(cornerRadius: 25)
        .fill(Color.purple)
        .frame(width: 300, height: 100)
    
    // Primary Color
    // 자동으로 다크모드 색 지원
    Text("Primary Color")
        .font(.title)
    RoundedRectangle(cornerRadius: 25)
        .fill(Color.primary)
        .frame(width: 300, height: 100)
    
    // UI Color
    // UIKit에서 사용되는 Color 값을 사용할 수 있다.
    Text("UI Color")
        .font(.title)
    RoundedRectangle(cornerRadius: 25)
        .fill(Color(UIColor.secondarySystemBackground))
        .frame(width: 300, height: 100)
    
    // Custom Color
    Text("Custom Color")
        .font(.title)
    RoundedRectangle(cornerRadius: 25)
        .fill(Color("CustomColor"))
        .frame(width: 300, height: 100)
    
}
```
<br>

**Basic Color**
- SwiftUI에서 제공하는 가장 기본적인 Color
- Color.purple과 같이 사용할 수 있다.
<br>

**Primary Color**
- 자동으로 다크모드를 지원하는 Color
<br>

**UI Color**
- UIKit에서 제공하는 Color 값을 사용할 수 있다.
<br>

**Custom Color**
- 말 그대로 커스텀 컬러로 앞서 이미 저장된 값의 Color가 아닌 좀 더 자세하게 지정이 가능한 Color이다.
    - 보통 디자이너가 만든 값을 사용한다.
- 위 프로젝트에서는 Assets에서 CustomColor를 만든 상태로, 라이트모드와 다크모드에 대한 색을 지정했다.
<br>
<br>
<br>

# 라이트모드, 다크모드 비교

![12](https://user-images.githubusercontent.com/63503972/228471411-6750b95c-532a-4998-84bd-70b0548c541a.gif)
