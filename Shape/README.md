#  SwiftUI_Shape

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228464057-46916ae2-7c83-45ac-9099-76957afd6b79.png">

```swift
VStack {
    
    Spacer()
    
    // Circle 원형
    Text("원형")
        .font(.title)
    Circle()
//                .fill(Color.blue)
//                .foregroundColor(.pink)
//                .stroke(Color.red, lineWidth: 20)
//                .stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .butt, dash: [30]))
        .trim(from: 0.2, to: 1.0)
        .stroke(Color.purple, lineWidth: 50)
        .frame(width: 200, height: 100, alignment: .center) // alignment는 center가 기본값
        .padding() // Text와 Circle간의 간격
    
    Spacer()
    
    // Ellipse 타원형
    Text("타원형")
        .font(.title)
    Ellipse()
        .fill(Color.green)
        .frame(width: 200, height: 100)
    
    Spacer()
    
    // Capsule 캡슐형
    Text("캡슐형")
        .font(.title)
    Capsule(style: .circular)
        .stroke(Color.blue, lineWidth: 30)
        .frame(width: 200, height: 100)
    
    Spacer()
}
```
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228464630-9cab9cfd-d5d7-47fb-abb3-68d8a2c6a22f.png">

```swift
VStack(spacing: 20) {
    
    Spacer()
    
    // Rectangle 직사각형
    Text("직사각형")
        .font(.title)
    Rectangle()
        .fill(Color.red)
        .frame(width: 200, height: 100)
    
    Spacer()
    
    // RoundedRectangle 둥근직사각형
    Text("둥근직사각형")
        .font(.title)
    RoundedRectangle(cornerRadius: 20)
        .trim(from: 0.4, to: 1.0)
        .frame(width: 300, height: 200, alignment: .center)
    
    Spacer()
}
```
<br>

SwiftUI에는 사각형, 원, 캡슐등과 같은 여러가지 기본 제공 모양들이 있고, 각 모양에 색상을 지정하고 배치할 수 있다.
