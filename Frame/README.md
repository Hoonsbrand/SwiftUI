#  SwiftUI_Frame

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228522084-b9c48583-3f01-472f-88e7-d4a049c63fc6.png">

```swift
VStack(spacing: 20) {
    Text("Hello, SwiftUI!")
        .font(.title)
        .background(Color.green)
        .frame(width: 200, height: 200)
        .background(Color.red)
        
    Divider()
    
        Text("Hello, SwiftUI!")
        .font(.title)
        .background(Color.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
}
```
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228521828-b4f2a35e-3fb3-4ca9-8f5d-772c4407e848.png">

```swift
VStack(spacing: 20) {
    Text("Hello, SwiftUI!")
        .font(.title)
        .background(Color.red)
        .frame(height: 100, alignment: .top)
        .background(Color.orange)
        .frame(width: 200)
        .background(Color.purple)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.pink)
        .frame(height: 400)
        .background(Color.green)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.yellow)
}
```
<br>

> frame을 연속적으로 사용하면서 어떻게 동작하는지 알 수 있었다.

