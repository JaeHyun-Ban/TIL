## 2차원 배열
- 배열안에 배열을 생성한다
```
int[] arr1 = {1,2,3};
int[] arr2 = {4,5,6};
int[] arr3 = {7,8,9}; //int 배열을 3개 생성한 뒤

int[][] arr3by3 = {arr1, arr2, arr3}; //새로운 int배열을 생성해 배열을 넣어준다


System.out.println(Arrays.toString(arr3by3)); 
//>2차원 배열 안에는 주소값이 들어있다.(그 주소값을 통해 배열속 배열을 꺼내온다)
//>Arrays.toString(arr3by3)을 통해 주소값을 확인 할 수 있다

System.out.println(Arrays.toString(arr3by3[0])); //배열속 배열의 번호를 통해 직접 깨내보는것이 가능하다
System.out.println(Arrays.deepToString(arr3by3)); 
//> 다차원 배열에서 Arrays.deepToString(arr3by3)을 통해 내부의 모든 값을 문자열 형태로 출력 가능하다.

System.out.println(arr3by3[1][2]);//1번 인덱스 안의 2번 인덱스를 출력


```
