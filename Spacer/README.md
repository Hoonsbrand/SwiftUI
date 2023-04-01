#  SwiftUI_Spacer

> Spacer는 View 간의 간격을 일정한 간격으로 띄우고 싶을 때 사용한다. 
<br>
<br>
<br>

# ✏️ 1. Spacer 예시 도형

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229276234-683f5d6a-8169-404b-af28-3e5726255049.png">

```swift
HStack(spacing: 0) {
    Spacer()
        .frame(height: 10)
        .background(Color.orange)
    
    Rectangle()
        .frame(width: 50, height: 50)
    
    Spacer()
        .frame(height: 10)
        .background(Color.orange)
    
    Rectangle()
        .fill(.red)
        .frame(width: 50, height: 50)
    
    Spacer()
        .frame(height: 10)
        .background(Color.orange)
    
    Rectangle()
        .fill(.green)
        .frame(width: 50, height: 50)
    
    Spacer()
        .frame(height: 10)
        .background(Color.orange)
}
.background(Color.yellow)
```
<br>

> 보이는것처럼 Spacer로 간격을 줌으로써 사이사이에 렉텡글 동일한 간격으로 위치시킬 수 있다. 
    <br> 아주 간단한 Spacer 예시지만 코드를 보면서 문득 하나의 Spacer의 frame만 제외하고 모두 주석처리를 하면 어떻게 될까 궁금해졌다.
<br>
<br>
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229276409-005d1acd-984d-4dbc-b53a-5f51d7301cc5.png">

```swift
Spacer()
//                .frame(height: 10)
    .background(Color.orange)

Rectangle()
    .frame(width: 50, height: 50)

Spacer()
//                .frame(height: 10)
    .background(Color.orange)

Rectangle()
    .fill(.red)
    .frame(width: 50, height: 50)

Spacer()
//                .frame(height: 10)
    .background(Color.orange)

Rectangle()
    .fill(.green)
    .frame(width: 50, height: 50)

Spacer()
    .frame(height: 10)
    .background(Color.orange)
```
<br>

> Spacer를 여러개 사용하면 동일한 간격을 생성해야하는데 왜 마지막 Spacer만 가장 큰 영역을 차지하는지 의문점이 생겼다. 
    <br> frame을 하나의 Spacer에만 적용함으로써 해당 현상은 frame에 관한것이라 생각하였고 바로 공식문서의 frame에 대한 설명을 보았다.
<br>

<img width="672" alt="image" src="https://user-images.githubusercontent.com/63503972/229276539-9d4377da-cbc9-46a6-9e27-202888fc76b1.png">
<br>

> 위 코드처럼 width에 대한 값이 nil일 경우 가능한 최대의 width를 가진 frame을 생성하는데, 이 때문에 마지막 Spacer만 가장 큰 영역을 차지하고 있는것이다! 
    <br> 그러면 다른 Spacer 중 하나에만 minLength를 주어서 해당 내용에 대한 실험을 해보았다.
<br>

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229276675-0576d6c7-e932-4e17-9f1c-c5525e26f4a8.png">

```swift
Spacer(minLength: 50)
```
<br>

> 첫번째 Spacer에 50만큼의 minLength를 주었더니 마지막 Spacer의 영역이 처음보다는 줄어들었다. 
    <br> 의도치않게 frame에 대해 더 알 수 있었던 시간이였다😄
<br>
<br>
<br>

# ✏️ 2. App 상단 설정 닫기 아이콘

<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229276776-102e1c55-1da3-4373-b4a0-b9a0c34bd26b.png">

```swift
VStack {
    HStack(spacing: 0) {
        Image(systemName: "xmark")
        
        Spacer()
        
        Image(systemName: "gear")
    }
    .font(.title)
    .padding(.horizontal)
    
    Spacer()
}
```
<br>

VStack안에 HStack이 있는 형태로 HStack에 두 개의 이미지가 있고 HStack 밖에서 Spacer를 주어 가장 상단까지 이미지를 올린 모습이다.
