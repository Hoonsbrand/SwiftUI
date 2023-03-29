#  SwiftUI_Stack

> **VStack**: Vertical Stack (세로로 나열) <br>
    **HStack**: Horizontal Stack (가로로 나열) <br>
        **ZStack**: Z-index Stack (겹쳐서 나열) <br>
            총 5개의 예제로 진행이 되었는데, 모두 정리할 필요는 없다고 느껴서 마지막 2개만 정리하려고 한다.
<br>
<br>
<br>

# ✏️ Stack 응용

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228543078-9da734f8-b763-4146-9d9c-2502f947e1c2.png">

```swift
ZStack(alignment: .top) {
    Rectangle()
        .fill(.yellow)
        .frame(width: 350, height: 500)
    
    VStack(alignment: .leading, spacing: 30) {
        Rectangle()
            .fill(.red)
            .frame(width: 150, height: 150)
        
        Rectangle()
            .fill(.green)
            .frame(width: 100, height: 100)
        
        HStack(alignment: .bottom, spacing: 10) {
            Rectangle()
                .fill(.purple)
                .frame(width: 50, height: 50)
            
            Rectangle()
                .fill(.pink)
                .frame(width: 75, height: 75)
            
            Rectangle()
                .fill(.blue)
                .frame(width: 25, height: 25)
        }
        .background(Color.white)
    }
    .padding()
    .background(Color.black)
}

```
<br>

**ZStack(노란색)**
- 가장 최상위 View
- 위에 겹겹이 쌓이는 구조로 ZStack안에는 한 개의 VStack이 존재한다.
- alignment가 top으로, top 정렬로 설정했다.
<br>

**VStack(검정색)**
- ZStack 위에 쌓인 View로 한 개의 HStack이 존재한다.
- alignment가 leading으로, leading 정렬로 설정했다.
    - 가장 큰 View를 기준으로 leading으로 정렬된다.
- 3개의 View를 가지고 있으며 세로로 정렬된다.
<br>

**HStack(흰색)**
- VStack 안에 가장 밑 View로 존재하며 3개의 View를 가지고있다.
- alignment가 bottom으로, bottom 정렬로 설정했다.
<br>
<br>
<br>

# ✏️ ZStack vs Background

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/228544832-323aaf13-2420-41b4-ae4a-0afc358b502c.png">

```swift
VStack(spacing: 50) {
    // 첫번째 1
    ZStack {
        Circle()
            .frame(width: 100, height: 100)
        
        Text("1")
            .font(.title)
            .foregroundColor(.white)
    }
    
    // 두번째 1
    Text("1")
        .font(.title)
        .foregroundColor(.white)
        .background(
            Circle()
                .frame(width: 100, height: 100)
        )
}
```
<br>
첫번째와 두번째 1은 같은 모습으로 나오지만 서로 다른 코드를 가지고 있다. <br>

**첫번째**
- ZStack을 사용해서 Circle에 1을 표현
    - layer가 복잡할 때 ZStack을 사용하면 좋다.
<br>

**두번째**
- Background를 사용해서 Circle에 1을 동일하게 표현
    - layer가 단순할 때 추천한다.
