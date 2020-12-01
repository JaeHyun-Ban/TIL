출처
https://stackoverflow.com/questions/24391078/how-to-change-the-default-message-of-the-required-field-in-the-popover-of-form-c

# alert이벤트 발생 문구 변경하는법

## required의 메세지를 바꾸는법

---

**oninvalid="this.setCustomValidity('문구 작성')"**로 메시지 내용을 변경한 뒤
**oninput="setCustomValidity('')"**로 입력이 된 후에 메시지가 나오지 않도록 바꿔준다
