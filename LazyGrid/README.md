#  SwiftUI_LazyGrid

![image](https://user-images.githubusercontent.com/63503972/229349977-4556436e-3967-49e8-85e0-c42267ebbdc5.png)
<br>

> SwiftUI 앱 레이아웃은 크게 두 종류의 View 방식으로 나타낼 수 있다.
    <br> **List** - 일반적 목록 배열 방식
        <br> **Grid- 박스 형태로 나타내는 배열 방식 ex) 인스타그램, 넷플릭스의 레이아웃
<br>

**그럼 LazyGrid는 언제 사용할까?**
> Grid 형태의 레이아웃을 구성할 때 화면에 보이는 것만 로드해서 보여줌으로써 메모리를 효율적으로 관리할 수 있다. 
<br>
<br>
<br>

# ✏️ 1. LazyVGrid

![11](https://user-images.githubusercontent.com/63503972/229352741-6fe2bf46-8059-4ae7-b443-d69dfdd3453e.gif)

```swift
let colums: [GridItem] = [
//  GridItem(<#T##size: GridItem.Size##GridItem.Size#>, spacing: <#T##CGFloat?#>, alignment: <#T##Alignment?#>)
    GridItem(.flexible(), spacing: 6),
    GridItem(.flexible(), spacing: 6),
    GridItem(.flexible(), spacing: 6)
]
```
<br>

> LazyVGrid를 생성하기 위해서는 columns라는 매개변수가 필요한데, 이는 GridItem 배열 타입으로 되어있다.
    <br> Grid를 생성할 때 매개변수에 바로 넣어줄 수는 있지만 보통 변수로 만들어 할당을 한다.
    <br> 위 코드에서는 columns(열)의 개수를 3개로 설정해주었다.
    <br> GridItem의 Size로는 adaptive, fixed, flexible 3가지 옵션이 있다.
<br>
<br>
<br>

```swift
// 1. LazyVGrid
ScrollView {
 
    Rectangle()
        .fill(.orange)
        .frame(height: 400)
    
    LazyVGrid(
        columns: colums,
        alignment: .center,
        spacing: 6,
        pinnedViews: [.sectionHeaders]) {
            
            // Section 1
            Section {
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 150)
                        .overlay(
                            Text("\(index) 번")
                        )
                }
            } header: {
                Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue)
                    .padding()
            } // Section 1
            
            // Section 2
            Section {
                ForEach(0..<20) { index in
                    Rectangle()
                        .fill(.green)
                        .frame(height: 150)
                        .overlay(
                            Text("\(index) 번")
                        )
                }
            } header: {
                Text("Section 2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.red)
                    .padding()
            } // Section 2
        }
}
```
<br>

1. ScrollView 가장 상단에 주황색 Rectangle을 생성한다. 
    - 넷플릭스 앱처럼 가장 인기있는 비디오등을 표시할 수 있는 역할을 하며 이런 View를 Hero라고 한다.
<br>

2. LazyVGrid를 생성한다.
    - 이때 앞서만든 columns를 매개변수로 할당해준다.
    - pinnedView는 말 그대로 고정된 View이며 위 코드에서는 header가 고정이 된다.
<br>

3. Grid에 담을 컨텐츠를 작성해준다.
    - 위 코드에서는 두개의 섹션으로 만들었다.
    - 각 섹션의 헤더가 상단에 고정되며 섹션이 바뀔때 고정된 헤더도 바뀌는 것을 볼 수 있다.
<br>
<br>
<br>


# ✏️ 2. LazyHGrid

![11](https://user-images.githubusercontent.com/63503972/229354404-5307c2d6-565f-4fe3-a834-bab933bf8b23.gif)

```swift
let title: [String] = Array(1...1000).map { "목록 \($0)" }

let rows: [GridItem] = [
    GridItem(.flexible(maximum: 80)),
    GridItem(.flexible(maximum: 80))
]
```
<br>

> LazyVGrid에서는 columns(열)을 설정해주었다면, LazyHGrid에서는 반대로 rows(행)을 설정해주어야한다.
    <br> 목록 1 부터 목록 1000 까지의 String이 담긴 배열과 두개의 row가 있는 변수를 만들어주었다.
    <br> flexible 속성에 최대 80이라는 크기 제한을 두었다.
<br>

```swift
ScrollView(.horizontal) {
    LazyHGrid(rows: rows, spacing: 20) {
        ForEach(title, id: \.self) { item in
            VStack {
                Capsule()
                    .fill(.yellow)
                    .frame(height: 30)
                
                Text(item)
                    .foregroundColor(.blue)
            }
        }
    }
}
```
<br>

위에서 만든 변수 rows는 LazyHGrid의 파라미터로, title은 ForEach의 데이터로 사용하였다.




