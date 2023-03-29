#  SwiftUI_Gradient

> 흔히 말하는 그라데이션처럼 단 색이 아닌 두 가지 이상의 색을 한 도형에 표현함으로써 사용자로 하여금 더 멋진 디자인의 앱을 만들 수 있다.
    Linear, Radial, Angular Gradient가 있다.   
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228491531-7b5a7550-9444-4c20-ab01-41813e5981a1.png">

```swift
VStack(spacing: 20) {
    
    // Linear Gradient 선형 그라디언트
    Text("Linear Gradient")
        .font(.title2)
    RoundedRectangle(cornerRadius: 25)
        .fill(
            LinearGradient(
                gradient: Gradient(colors: [.red, .blue]),
                startPoint: .topLeading,
                endPoint: .bottom)
        )
        .frame(width: 300, height: 200)
    
    // Radial Gradient 원형 그라디언트
    Text("Radial Gradient")
        .font(.title2)
    RoundedRectangle(cornerRadius: 25)
        .fill(
            RadialGradient(
                gradient: Gradient(colors: [.yellow, .purple]),
                center: .center,
                startRadius: 20,
                endRadius: 200)
            // center -> 시작지점
        )
        .frame(width: 300, height: 200)
    
    // Angular Gradient 특정각도 그라디언트
    Text("Angular Gradient")
        .font(.title2)
    RoundedRectangle(cornerRadius: 25)
        .fill(
            AngularGradient(
                gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]),
                center: .center)
        )
        .frame(width: 300, height: 200)
}
```

**Linear Gradient**
- **colors**: 색상 입력
- **startPoint**: 시작 지점
- **endPoint**: 종료 지점
<br>

**Radial Gradient**
- **colors**: 색상 입력
- **center**: 중앙 지점
- **startRadius**: 시작 각도
- **endRadius**: 종료 각도
<br>

**Angular Gradient**
- **colors**: 색상 입력
- **center**: 중앙 지점
- **angle**을 통해 직접 각도를 줄 수도 있음

