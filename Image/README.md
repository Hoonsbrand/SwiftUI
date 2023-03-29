#  SwiftUI_Image

> 이미지를 불러와 원형으로 만드는 방법 두가지
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228502078-1e2ddae7-5a70-4bbb-983d-1ad6b9556129.png">

```swift
VStack(spacing: 20) {
    Image("mountain")
        .resizable()
        .scaledToFill()
        .frame(width: 300, height: 300)
        .cornerRadius(150)
    
    Divider()
    
    Image("mountain")
        .resizable()
        .scaledToFill()
        .frame(width: 300, height: 300)
        .clipShape(Circle())
}
```
