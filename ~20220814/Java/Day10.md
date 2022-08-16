# 객체와 클래스
- 자바에서 클래스는 객체를 만들기위한 틀(설계도)이다.
- **클래스의 변수는 객체의 속성**이고, **클래스의 메서드는 객체의 기능**이다.
```
public class MainClass {

	static String name = "피자빵";
	static int price = 500;
	static void info() { ★피자빵 메서드 생성
		System.out.println("빵 이름: " + name);
		System.out.println("빵 가격: " + price);
	}
	
	static String name2 = "초코케이크";
	static int price2 = 1500;
	static void info2() { ★초코케이크 메서드 생성
		System.out.println("빵 이름: " + name2);
		System.out.println("빵 가격: " + price2);
	}
	
	
	public static void main(String[] args) { ★메인메서드
		/*
		 - 객체를 생성하지 않았을 때의 예시를 보고
		 빵 객체를 생성할 수 있는 클래스(설계도)를 작성해 보세요.
		 클래스 이름은 Bread로 통일 하겠습니다.
		 
		 - MainClass에서 똑같이 피자빵, 초코케이크의 정보를 호출해 보세요.
		 (생정자는 여러분 마음대로~)
		 */
		
		Bread p = new Bread(); ★Bread클래스를 이용한 객체 p를 생성
		p.name = "피자빵";
		p.price = 500;
		p.info();
		
		Bread c = new Bread("초코케이크", 1500); ★Bread클래스를 이용한 객체 c를 생성
		c.info();
	}

}
===================================================================================
public class Bread { ★빵의 정보를 담을 클래스 생성

	String name; ★이름을 담을 String 객체
	int price; ★가격을 담을 int객체
	
	//생성자 생성!!
	Bread(){}
	
	//기본 생성자 만드는 형태
	Bread(String bName, int bPrice){
		name = bName;
		price = bPrice;
	}
	
	void info() {
		System.out.println("빵 이름: " + name);
		System.out.println("빵 가격: " + price + "원");
		System.out.println("---------------------");
	}
	
}

```

