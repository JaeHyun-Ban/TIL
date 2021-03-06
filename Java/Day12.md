## this
- **자기 자신의 객체를 지정할 때 사용**하는 키워드이다.
- this. 을 사용하면 동일 클래스 내의 멤버(멤버변수, 메서드)를 참조할 수 있습니다.
- this()를 사용하면 생성자 내부에서 자신의 다른 생성자를 호출할 수 있습니다.

## super
- **한단계 위 부모클래스의 객체를 지정할 때 사용**하는 키워드 입니다.
- super.을 사용하면 부모클래스의 멤버(멤버변수, 메서드)를 참조할 수 있습니다.
- super()는 생성자 내부에서만 사용 가능하고,   
부모 클래스의 생성자를 호출하는데 사용한다.
```
## 특징 ##
- 생성자의 첫 라인에는 반드시 this(), super()가 있어야 하는데    
  이를 기술하지 않으면 묵시적으로 super()가 삽입되어 
  부모클래스의 기본 생성자를 자동으로 호출한다.

- 생성자 내부에서 또다른 생성자를 호출할 때는 
  반드시 생성자 블록 내부의 첫 라인에 기술해야 한다.
```

## 접근 제한자(Access Modifier)
- 클래스와 멤버변수, 메서드, 생성자의 접근을 제어할 수 있는 제한자 입니다.
- **main()메서드가 없는 클래스**는 **외부 클래스에서 이용할 목적**으로 설계된 **라이브러리 클래스**입니다.
- 라이브러리 클래스를 설계할 때는 **외부 클래스에서 접근할 수 있는 멤버**와   
**접근할 수 없는 멤버로 구분**해서 변수, 생성자, 메서드를 **설계하는것이 바람직하다.**
- **외부**에서 객체 생성을 막기 위해 생성자를 호출하지 못하게 하거나   
객체의 특정 데이터를 보호하기 위해 해당 멤버변수에 접근하지 못하도록    
막는 것이 접근 제한자의 역할이다.(외부에서 함부로 못하게 막을 필요가 잇는것들을 보호)

### 접근 제한자의 종류
- **public**: 같은 클래스, 같은 패키지, 다른 패키지를 막론하고 전부 접근 가능
- **protected**: 같은 클래스, 같은 패키지는 접근이 가능하지만 다른 패키지에    
속해있는 클래스인 경우 상속관계가 없다면 접근이 불가능함.
- **package friendly(접근 제한자를 붙이지 않은 형태)**:    
  - 같은 클래스, 패키지에서만 접근이 가능하고 패키지가 다를 경우 접근 불가능
- **private**: 같은 클래스 내부가 아니면 접근이 불가능.


## 은닉(Encapsulation)
- 은닉은 사용자에게 상세한 내부 구현을 숨기고 필요한 부분만 보이게 하는것    
**보여주고 싶은것만 보여주고 상세정보는 가린다**
- 은닉을 사용하기 위해서는 클래스의 멤버변수의 접근제한자를 privae으로 설정합니다.
  ```
  ex)
  private String members;
  ```
- 은닉된 멤버변수에 접근하기 위해서는 공개된(public)메서드를 통해서 접근할 수 있는데,    
**변수의 값을 변경**시키는데 사용되는 메서드를 **setter메서드**,    
**변수의 값을 얻어오는데** 사용하는 메서드를 **getter메서드** 라고 한다.
  ```
  ex)
  private String members;
  
  // 보통 단축키로 자동생성해준다
  public String getMembers(){
    return members;
  }
  
  public String setMembers(String members){
    this.members = members;
  }
  ```










