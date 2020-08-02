<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:400,700);
* {
  margin: 0;
  padding: 0;
}

body {
  background: #cbd0d3;
  color: #1a1a1a;
  font-family: 'Roboto', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 13px;
  font-weight: 400;
}

input, textarea {
  border: none;
  outline: none;
  resize: none;
  width: 100%;
  -moz-appearance: none;
  -webkit-appearance: none;
}

#title:hover {
  cursor: text;
}

.credit {
  bottom: 40px;
  color: #949ea4;
  font-size: 12px;
  left: 0;
  position: absolute;
  right: 0;
  text-align: center;
  z-index: 99;
}
.credit a {
  color: #6c7880;
  text-decoration: none;
}
.credit a:hover {
  color: #1a1a1a;
}
.credit a:active {
  color: #343434;
}

.contact-form {
  background: #ffffff;
  height: auto;
  margin: 100px auto;
  max-width: 500px;
  overflow: hidden;
  width: 65%;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
  -moz-box-shadow: rgba(26, 26, 26, 0.1) 0 1px 3px 0;
  -webkit-box-shadow: rgba(26, 26, 26, 0.1) 0 1px 3px 0;
  box-shadow: rgba(26, 26, 26, 0.1) 0 1px 3px 0;
}
@media (max-width: 500px) {
  .contact-form {
    margin: 0 0 100px;
    width: 100%;
  }
}
.contact-form .email, .contact-form .message, .contact-form .name {
  position: relative;
}
.contact-form .email input:focus, .contact-form .email textarea:focus, .contact-form .message input:focus, .contact-form .message textarea:focus, .contact-form .name input:focus, .contact-form .name textarea:focus {
  background: #f4f5f6;
}
.contact-form .email #title, .contact-form .message #title, .contact-form .name #title {
  color: #cbd0d3;
  left: 23px;
  position: absolute;
  top: 23px;
  -moz-transition: all, 150ms;
  -o-transition: all, 150ms;
  -webkit-transition: all, 150ms;
  transition: all, 150ms;
  height: 100px;
}
.contact-form .email.typing #title, .contact-form .message.typing #title, .contact-form .name.typing #title {
	height: 200px;
  color: #3498db;
  font-size: 10px;
  top: 7px;
}
.contact-form .email, .contact-form .name {
  width: calc(50% - 1px);
}
@media (max-width: 500px) {
  .contact-form .email, .contact-form .name {
    width: 100%;
  }
}
.contact-form .email input, .contact-form .name input {
  padding: 23px 0 8px 23px;
}
.contact-form .email {
  border-left: 1px #e6e6e6 solid;
  float: right;
}
@media (max-width: 500px) {
  .contact-form .email {
    border-left: none;
    border-top: 1px #e6e6e6 solid;
  }
}
.contact-form .message {
  border-bottom: 1px #e6e6e6 solid;
  border-top: 1px #e6e6e6 solid;
  clear: both;
}
.contact-form .message textarea {
  height: 300px;
  padding: 23px;
}
.contact-form .name {
  float: left;
}
.contact-form .submit {
  background: #f4f5f6;
  display: block;
  overflow: hidden;
  padding: 23px;
}
.contact-form .submit .button {
  background: #3498db;
  border: 1px #3498db solid;
  color: #ffffff;
  float: right;
  padding: 9px 0;
  width: 100px;
  -moz-border-radius: 5px;
  -webkit-border-radius: 5px;
  border-radius: 5px;
}
@media (max-width: 500px) {
  .contact-form .submit .button {
    float: none;
  }
}
.contact-form .submit .button:hover {
  background: #4aa3df;
}
.contact-form .submit .button:active {
  background: #258cd1;
}
.contact-form .submit .button:focus {
  border-color: #b6daf2;
  -moz-box-shadow: #75b9e7 0 0 4px 1px, #75b9e7 0 0 4px 1px inset;
  -webkit-box-shadow: #75b9e7 0 0 4px 1px, #75b9e7 0 0 4px 1px inset;
  box-shadow: #75b9e7 0 0 4px 1px, #75b9e7 0 0 4px 1px inset;
}
.contact-form .submit .user-message {
  float: left;
  padding-top: 22px;
}
@media (max-width: 500px) {
  .contact-form .submit .user-message {
    float: none;
    padding: 0 0 10px;
  }
}

</style>
<script type ="text/javascript">
  $('#name').keyup(function(){
  $('.name').addClass('typing');
  if( $(this).val().length == 0 ) {
      $('.name').removeClass('typing');
  }
});
$('#email').keyup(function(){
  $('.email').addClass('typing');
  if( $(this).val().length == 0 ) {
      $('.email').removeClass('typing');
  }
});
$('#message').keyup(function(){
  $('.message').addClass('typing');
  if( $(this).val().length == 0 ) {
      $('.message').removeClass('typing');
  }
});
</script>
</head>
<body>
<form class="contact-form">
  <div class="name">
 	 <div id="title">
  		받는 사람<br>
     	모임명<br/>
    	쪽지제목<br/>
 	 </div>
    <input type="text" id="name" />
  </div>  
  <div class="email">
   <div id="title">
   Email
   </div>
    <input type="text" id="email" />
  </div>
  <div class="message">
    <label for="message">Message</label>
    <textarea name="message" id="message"></textarea>
  </div>
  <div class="submit">
    <p class="user-message">Message to the user.</p>
    <input type="submit" value="Send" class="button" />
  </div>
</form>
<p class="credit">Form interaction based off of Matt D Smith's idea: <a href="http://drbl.in/iVVR" target="_blank">http://drbl.in/iVVR</a></p>
</body>
</html>