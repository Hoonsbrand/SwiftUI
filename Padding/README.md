#  SwiftUI_Padding

> Padding은 각 요소간에 간격을 설정함으로써 좀 더 디테일하게 내가 원하는 위치에 놓을 수 있도록 해준다. <br> padding의 기본값은 (.all, 15)이다.
<br>
<br>
<br>

# ✏️ 1. Padding 기본

<img width="185" alt="image" src="https://user-images.githubusercontent.com/63503972/229274299-e3befbeb-65cb-430d-861e-20e19b51d92d.png">
<br>

1. Text 생성
2. 노란색 배경 설정
3. 배경에 대한 padding 설정
4. leading에 20만큼의 padding 추가
5. padding에 대해 파란색 배경 설정
6. bottom에 20만큼의 패딩 설정
<br>
<br>
<br>

# ✏️ 2. Padding 응용

<img width="338" alt="image" src="https://user-images.githubusercontent.com/63503972/229274547-f287ee21-2444-4b44-9861-f1e0083fba1f.png">
<br>

1. Text 생성 & 각종 수식어로 Text에 대한 설정
2. bottom에만 20만큼의 padding 설정
3. Text 추가 생성
<br>
<br>
<br>

# ✏️ 3. VStack 범위 밖에서 padding 설정

<img width="414" alt="image" src="https://user-images.githubusercontent.com/63503972/229274635-e4993858-7e50-4ab5-8900-bba9df591694.png">
<br>

1. VStack에 대한 padding 설정
    - VStack 내부 요소들이 VStack으로부터 padding을 가져 간격이 생김, vertical 방향으로 30만큼 추가로 설정
2. background 설정
    - 배경색, cornerRadius, shadow
3. background에 대한 padding 설정
    - View로 부터 간격을 만들어서 보다 더 보기 좋게 만듦.
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229274050-83b9c3fe-f3aa-4403-81b2-7a135f4abc54.png">

```swift
VStack(alignment: .leading, spacing: 20) {
    // 1. Padding 기본
    Text("Hello, SwiftUI!")
        .background(Color.yellow)
        .padding()  // 기본값 -> .padding(.all, 15)
        .padding(.leading, 20) // CSS 기준 padding
        .background(Color.blue)
        .padding(.bottom, 20) // CSS 기준 margin
    
    Divider()
    
    // 2. Padding 응용
    Text("Hello, SwiftUI!")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 20)
    
    Text("안녕하세요! SwiftUI에 오신 여러분 환영합니다. 안녕하세요! SwiftUI에 오신 여러분 환영합니다.안녕하세요! SwiftUI에 오신 여러분 환영합니다.안녕하세요! SwiftUI에 오신 여러분 환영합니다.")
}
// 3. VStack 범위 밖에서 padding 설정
.padding()
.padding(.vertical, 30)
.background(
    Color.white
        .cornerRadius(10)
        .shadow(
            color: .black.opacity(0.3),
            radius: 10,
            x: 10, y: 10)
)
.padding()
```
