## 3. 서비스 계층 구현

실행되고 있는 servlet-context.xml에다가
서비스 객체를 bean으로 생성한다
그리고 @Autowired 어노테이션을 이용해 자동으로 주입한다

### 3. 어노테이션을 이용해서 서비스 객체 생성 및 의존 객체 자동 주입

```
@Repository("boardService")
public class BoardServiceImpl implements BoardService{

}
```

---

# memo
