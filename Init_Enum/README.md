#  SwiftUI_Init_Enum

**init()**
- View가 초기화 될때 실행되는 함수
<br>

**enum**
- 연관된 값들의 집합을 공통된 타입으로 정의하는 것

> init 함수는 View가 실행되었을 때 초기값을 설정해줄 수 있어 View를 호출할 때 유용하게 쓰인다.     <br> 또한 SwiftUI에서 변수로 여러 값을 선언할 때 enum을 사용하면 이러한 값들을 카테고리화 해서 마치 폴더에 값을 넣는것처럼 변수의 값을 사용할 수 있다. 
<br>
<br>
<br>


<img width="403" alt="image" src="https://user-images.githubusercontent.com/63503972/229340976-9176d9ea-4467-4192-8ed8-8cac9e49cecd.png">

```swift
struct InitEnumBasic: View {
    
    // 변수 선언
    let backgroundColor: Color
    let count: Int
    let title: String
    
    // enum 생성
    enum Fruit {
        case apple
        case orange
    }
    
    // init 함수 생성 -> View가 호출 될 때 실행되는 로직
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        switch fruit {
        case .apple:
            self.title = "사과"
            self.backgroundColor = .red
        case .orange:
            self.title = "오렌지"
            self.backgroundColor = .orange
        }
    }
    
    
    var body: some View {
        VStack (spacing: 20) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct InitEnumBasic_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitEnumBasic(count: 100, fruit: .apple)
            InitEnumBasic(count: 46, fruit: .orange)
        }
    }
}
```
<br>

**init & enum**
1. 사용할 변수와 enum을 생성한다.
2. init 함수는 파라미터로 count와 fruit을 받는다.
    - 받은 count를 멤버 변수에 할당해준다.
    - switch문을 통해 받은 fruit의 종류에 따라 title과 background를 알맞게 할당해준다.
3. 이번엔 좀 독특하게 preview에서 struct를 호출해줄 때 생성자를 사용해 값을 넣어주고 HStack으로 가로 Stack을 미리 만들어준다.
4. body에서 VStack으로 count와 title을 세로로 쌓아준다.
 - 이미 값들이 preview에서 할당된 상태이기 때문에 단순하게 변수를 호출하기만 하면 된다.
 - 또한 HStack으로 preview를 구성했기 때문에 한가지의 과일 정보를 보여주기 위한 View를 만들었다고 보여져도 각 생성자에 맞는 View 두개가 만들어진다.
 <br>
 <br>
 <br>
 
 > 간단한 예제이지만 이것만으로 init과 Enum이 SwiftUI에서 얼마나 유용하게 쓰일지 예상이 갔다.
    <br> 만약 같은 연관된 값들에 대한 여러 View를 만들어야할 때 preview, init, enum을  사용해 적은 코드로 화면을 구성할 수 있을 것 같다.

