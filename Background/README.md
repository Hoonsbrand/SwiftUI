#  SwiftUI_Background

> **.background**: 대상의 뒷배경 설정
    **.overlay**: 대상의 앞배경 설정
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228527577-158396af-1044-443e-8e58-90afc43b77e1.png">

```swift
VStack(spacing: 20) {
   // 1.Background
    Text("Hello, SwiftUI!")
        .frame(width: 100, height: 100)
        .background(
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue]),
                        startPoint: .leading,
                        endPoint: .trailing)
                )
        )
        .frame(width: 120, height: 120)
        .background(
            Circle()
                .fill(.yellow)
        )
    
    Divider()
    
    // 2.Overlay
    Circle()
        .fill(.pink)
        .frame(width: 100, height: 100)
        .overlay(
            Text("1")
                .font(.title)
                .foregroundColor(.white)
        )
        .background(
            Circle()
                .fill(.purple)
                .frame(width: 120, height: 120)
        )
    
    Divider()
    
    
    // 3. Background and overlay
    Rectangle()
        .frame(width: 200, height: 200)
        .overlay(
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100)
            , alignment: .leading
        )
        .background(
            Rectangle()
                .fill(.red)
                .frame(width: 250, height: 250)
        )
        .padding()
    
    Divider()
    
    // 4
    Image(systemName: "heart.fill")
        .font(.system(size: 40))
        .foregroundColor(.white)
        .background(
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.cyan, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                )
                .frame(width: 100, height: 100)
                .shadow(color: .blue, radius: 10, x: 0, y: 10)
                .overlay(
                    Circle()
                        .fill(.red)
                        .frame(width: 35, height: 35)
                        .overlay(
                            Text("7")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                        .shadow(color: .red, radius: 10, x: 5, y: 5)
                    , alignment: .bottomTrailing // 위치 변경
                )
        )
        .padding()
}

```
<br>

# 1
1. Text 생성 
2. Text의 background 설정
    - LinearGradient가 적용된 Circle 모양의 background
3. background에 또 다른 frame을 설정
    - Text의 frame보다 크게 생성
<br>

**-> 큰 프레임에서 작은 프레임의 크기를 뺀 정도의 영역만 남았으며 테두리처럼 만들어짐.**
<br>
<br>
<br>

# 2
1. Circle 생성
2. Circle에 Text overlay
3. Circle의 크기보다 큰 background Circle을 만들어 테두리처럼 만듬
<br>
<br>
<br>

# 3
1. 검정색 Rectangle 생성
2. 검정색보다 작은 파란색 Rectangle overlay
3. 검정색보다 큰 빨간색 Rectangle background로 설정
<br>

**모든 View가 다 보이면서 작은 View를 추가로 보이게 하고 싶다 -> overlay <br> 더 큰 View를 보이게 하고 싶다 -> background**
<br>
<br>
<br>

# 4
1. Image 생성
2. Image의 background 설정
    - frame으로 사이즈 설정
3. shadow로 그림자 효과
4. Image위에 빨간색 Circle overlay
    - 크기는 Image의 background 보다 훨씬 작게
5. 빨간색 Circle에 Text overlay
6. 빨간색 Circle에 shadow로 그림자 효과
7. 빨간색 Circle의 alignment로 bottomTrailing을 설정하여 위치 변경
