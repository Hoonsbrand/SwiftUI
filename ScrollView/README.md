#  SwiftUI_ScrollView

> ScrollView는 스크롤 가능한 컨텐츠 영역 내에 사용자가 스크롤 제스처를 할 시 추가적인 부분을 보게 해준다. 어떤 디바이스든 물리적인 구조상 화면의 크기가 제한적인데, 이를 ScrollView를 통해 보다 많은 내용을 한 개의 View에 담을 수 있다.  
<br>

```swift
init(
    _ axes: Axis.Set = .vertical,
    showsIndicators: Bool = true, @ViewBuilder content: () -> Content
)
```
<br>

**axes**
- 스크롤 방향을 설정하며, vertical이 기본값이다.
**showsIndicators
- 인디케이터의 유무를 설장하며 true가 기본값이다.
<br>
<br>
<br>

# 1. ✏️ 세로 스크롤

![11](https://user-images.githubusercontent.com/63503972/229339086-7f8eea7e-55d1-48f7-b833-731829264180.gif)

```swift
ScrollView(.vertical, showsIndicators: false) {
    VStack {
        ForEach(0..<50) { index in
            Rectangle()
                .fill(.blue)
                .frame(height: 300)
                .overlay(
                    Text("\(index) 번")
                        .font(.title)
                )
        }
    }
}
```
<br>
<br>
<br>

# 2. ✏️ 가로 스크롤

![22](https://user-images.githubusercontent.com/63503972/229339092-19b173db-e964-4080-ac6b-fdb9fcb040a7.gif)

```swift
ScrollView(.horizontal, showsIndicators: true) {
    HStack {
        ForEach(0..<50) { index in
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .overlay(
                    Text("\(index) 번")
                        .font(.title)
                )
        }
    }
}
```
<br>
<br>
<br>


# 3. ✏️ 혼합

![33](https://user-images.githubusercontent.com/63503972/229339098-ca54804b-d852-407d-9d38-ac972f334a8c.gif)

```swift
ScrollView() {
    LazyVStack {
        ForEach(0..<10) { _ in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<20) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .frame(width: 200, height: 150)
                            .shadow(radius: 10)
                            .padding()
                    }
                } // LazyHStack
            } // Horizontal ScrollView
        }
    } // LazyVStack
} // Vertical ScrollView
```
<br>

**LazyStack이란?**
- 데이터 양이 많아질 때 화면에 보여지는 부분만 로딩이 되고 스크롤을 할 때 정보를 업데이트하는 방식
<br>

1. Vertical ScrollView를 생성하며 한 개의 LazyVStack을 가지고있다.
2. 각 LazyVStack은 10개로 구성되어있다.
3. 각 행마다 Horizontal ScrollView가 있으며 20개씩의 Rectangle 도형이 있다. 
