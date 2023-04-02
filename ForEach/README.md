#  SwiftUI_ForEach

**SwiftUI에서의 ForEach**
<br>

<img width="851" alt="image" src="https://user-images.githubusercontent.com/63503972/229341677-0ee80390-fa81-449c-a1da-b2122cbd1b6e.png">
<br>

> 공식문서에 나와있듯이 collection data값을 기반으로 View를 계산하는 구조이다. (Swift 시퀀스의 forEach()와는 다르다.)
    <br> ForEach를 사용하기 위해서는 data type이 RandomAccessCollection이어야하고 여기서 id값을 지정해주어야 ForEach가 정상적으로 작동된다.
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229343956-1b217a21-3862-4156-88a2-a012dffe1339.png">

```swift
// 변수 생성
var data: [String] = ["Hi", "Hello", "Hey everyone"]

var body: some View {
    // 1. index
    VStack {
        // ForEach를 돌면서 index값이 하나씩 증가
        ForEach(0..<10) { index in
            HStack {
                Circle()
                    .frame(width: 20, height: 20)
                
                Text("인덱스 번호: \(index)")
            } // HStack
        }
        
        Divider()
        
        // 2. 배열의 각 요소를 고유하게 식별
        // 각각 자신에게 id값을 자동으로 부여한다.
        ForEach(data, id: \.self) { item in
            Text(item)
        }
        
    } // VStack
    
}
```

**1. index**
- 0부터 10까지를 증가하며 반복을 한다.
- 결과로는 10개의 Circle과 각 index 번호가 표시된다.
<br>
<br>
<br>

**2. 배열의 각 요소를 고유하게 식별**
- **RandomAccessCollection** 프로토콜을 준수하는 데이터를 제공한다.
- 데이터의 각 요소들을 구분하고 식별할 수 있도록 위 코드처럼 id를 직접 전달하거나 데이터 타입 자체에 identifiable 프로토콜을 채택할 수 있다.
- 타입추론이 가능해서 위 코드처럼 **\   .self**로도 작성이 가능하다.
    - 위 코드의 데이터는 String 배열로 id의 원본은 String.self이다.
