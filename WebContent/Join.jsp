<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
     <title>LunaClass : 회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name ="google-signin-client_id" content="415182734149-jp3iu7cs3274anh0cqd2qln272ppuslv.apps.googleusercontent.com">

   <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="login/css/style.css">
    <link rel="stylesheet" href="css/style.css">
   </head>
   
   <body class="img js-fullheight" style="background-image: url(login/images/hero_1.jpg);">
   <section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-md-6 text-center mb-5">
               <h2 class="heading-section">Luna Class</h2>
            </div>
         </div>
         <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
               <div class="login-wrap p-0">
               <h3 class="mb-4 text-center">회원가입</h3>
               
               <form action="Join.do" class="signin-form" method="post">
                  <div class="form-group">
                     <input type="text" class="form-control" placeholder="ID" name="id" required>
                  </div>
               <div class="form-group">
                 <input id="password-field" type="password" class="form-control" placeholder="password" name="password" required>
                 <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
               </div>
               <div class="form-group">
                 <input id="password-field" type="password" class="form-control" placeholder="password" name="confirmPassword" required>
                 <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
               </div>
                <div class="form-group">
                     <input type="text" class="form-control" placeholder="Name" name="name" required>
                  </div>
               
                  <hr>
                   <div class="form-group">
                     <input type="text" class="form-control" placeholder="Tel" name="tel" required>
                  </div>
									<div class="col">
									<div class="row">
									<input type="text" id="sample4_postcode" class="form-control col-md-6" placeholder="우편번호" name="addr5"><br>
									<div  style="text-align: right" class="col-md-6">
									<button  class="form-control btn btn-primary submit px-3" type="button" onclick="sample4_execDaumPostcode()"
										value="우편번호 찾기">우편번호 찾기</button></div></div></div><br> <input type="text"
										id="sample4_roadAddress" class="form-control" placeholder="도로명주소" name="addr1"><br>
										<input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" name="addr2">
									<span id="guide" style="color: #999; display: none"></span> <br>
									<input type="text" id="sample4_extraAddress" class="form-control" placeholder="참고항목" name="addr3"><br>
									<input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소" name="addr4"><br>

									<script
										src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
										function sample4_execDaumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															var roadAddr = data.roadAddress;
															var extraRoadAddr = '';
															if (data.bname !== ''
																	&& /[동|로|가]$/g
																			.test(data.bname)) {
																extraRoadAddr += data.bname;
															}

															if (data.buildingName !== ''
																	&& data.apartment === 'Y') {
																extraRoadAddr += (extraRoadAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}

															if (extraRoadAddr !== '') {
																extraRoadAddr = ' ('
																		+ extraRoadAddr
																		+ ')';
															}

															document
																	.getElementById('sample4_postcode').value = data.zonecode;
															document
																	.getElementById('sample4_roadAddress').value = roadAddr;
															document
																	.getElementById("sample4_jibunAddress").value = data.jibunAddress;

															if (roadAddr !== '') {
																document
																		.getElementById("sample4_extraAddress").value = extraRoadAddr;
															} else {
																document
																		.getElementById("sample4_extraAddress").value = '';
															}

															var guideTextBox = document
																	.getElementById("guide");

															if (data.autoRoadAddress) {
																var expRoadAddr = data.autoRoadAddress
																		+ extraRoadAddr;
																guideTextBox.innerHTML = '(예상 도로명 주소 : '
																		+ expRoadAddr
																		+ ')';
																guideTextBox.style.display = 'block';

															} else if (data.autoJibunAddress) {
																var expJibunAddr = data.autoJibunAddress;
																guideTextBox.innerHTML = '(예상 지번 주소 : '
																		+ expJibunAddr
																		+ ')';
																
															} else {
																guideTextBox.innerHTML = '';
																guideTextBox.style.display = 'none';
															}
														}
													}).open();
										}
									</script>

               
               <div class="form-group">
                  <button type="submit" class="form-control btn btn-primary submit px-3" >SignIn</button>
               </div>
        
             </form>
             


   <script src="login/js/jquery.min.js"></script>
  <script src="login/js/popper.js"></script>
  <script src="login/js/bootstrap.min.js"></script>
  <script src="login/js/main.js"></script>

   </body>
</html>