#  SwiftUI_IgnoreSafeArea

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229399518-e067e0bb-ee69-4d76-be16-0515d0b802dd.png">

```swift
ZStack {
    // background
    Color.blue
        .ignoresSafeArea()
    
    // content
    VStack {
        Text("Hello, SwiftUI!")
            .font(.largeTitle)
    }
}
```
<br>

**.ignoreSafeArea**를 사용해 safeArea를 무시할 수 있다.
<br> 옵션으로는 top, leading, trailing, bottom, horizontal, vertical, all이 있으며, all이 기본값이다.
<br>
<br>
<br>


<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229399437-44d33575-7c38-4663-a591-af6c7c180009.png">

```swift
ScrollView {
    VStack {
        Text("박스형 리스트")
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
        
        ForEach(1..<11) { index in
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .frame(height: 150)
                .shadow(radius: 10)
                .padding()
                .overlay(
                    Text("\(index) 번 리스트")
                )
        }
    }
}
.background(
    Color.blue
//        .ignoresSafeArea()
)
```
<br>

마찬가지로 ScrollView background에 ignoresSafeArea를 해주었는데, 주석처리를 해도 같은 결과가 나온다. 즉, ignoresSafeArea를 적용시키는 것과는 무관하게 ScrollView는 기본으로 safeArea를 무시한다.
