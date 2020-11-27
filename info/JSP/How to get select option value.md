# JSP - select의 option값 가져오는법

```
<select class="form-control input-sm sel">
	<option>naver.com</option>
	<option>gmail.com</option>
	<option>daum.net</option>
</select>
```

select 에 `name`값을 주고 `request.getParameter(name)`으로 값을 가져올 수 있다
