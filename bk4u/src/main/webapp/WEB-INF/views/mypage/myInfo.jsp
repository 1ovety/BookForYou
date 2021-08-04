<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- alertify 관련 라이브러리 -->
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- menubar적용 라이브러리 -->
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        .wrap {
            width: 1200px;
            margin-top: 120px;
            margin-left: auto;
            margin-right: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 1100px;
            position: relative;
            display: inline-flex;
        }

        #main_content {
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 1000px;
            background-color: #FFF;
            box-shadow: 5px 5px 5px 5px #C6C6C6;
        }

        nav {
            width: fit-content;
            height: fit-content;
            display: inline-flex;
        }

        #head-of-main-content {
            margin-left: 30px;
            margin-top: 30px;
            margin-bottom: 20px;
            font-weight: 600;
            font-size: larger;
        }

        #table-box {
            margin-top: 50px;
            width: 90%;
            margin: auto;
        }

        #profile-img-box {
            margin: auto;
            width: 50%;
        }

        #profile-text-box {
            margin-top: 30px;
        }

        /*프로필 이미지 관련 css*/
        .box {
            width: 80px;
            height: 80px;
            border-radius: 70%;
            overflow: hidden;
        }

        .profile {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /*프로필 이미지 관련 css끝*/
        #update-profile-button {
            margin-bottom: 10px;
        }

        .th-content {
            width: 80px;
            vertical-align: center;
        }

        .bottom-td {
            vertical-align: bottom !important;
            width: 100px;
        }

        .profile-button-group-box {
            margin-bottom: 10px;
        }

        .td-content {
            width: 500px;
            vertical-align: center;
        }

        .input-middle {
            width: 50%;
        }

        #send-mail-box {
            display: inline-flex;
            width: 60%;
        }
        #radio-box{
            display: inline-flex;

        }
    </style>
    <script>
    	
    
        function profileTdShow() {
            if ($('#profile-box1').css('display') == 'block') {
                $('#profile-box1').css('display', 'none');
                $('#profile-box2').css('display', 'block');
                $('.wrap').css('height','+=50px');
                $("#content").css('height','+=50px');
                $('#main_content').css('height','+=50px');
            } else {
                $('#profile-box1').css('display', 'block');
                $('#profile-box2').css('display', 'none');
                $('.wrap').css('height','-=50px');
                $("#content").css('height','-=50px');
                $('#main_content').css('height','-=50px');
            }
        }

        function pwdTdShow() {
            if ($('#pwd-box1').css('display') == 'block') {
                $('#pwd-box1').css('display', 'none');
                $('#pwd-box2').css('display', 'block');
                $('.wrap').css('height','+=100px');
                $("#content").css('height','+=100px');
                $('#main_content').css('height','+=100px');
            } else {
                $('#pwd-box1').css('display', 'block');
                $('#pwd-box2').css('display', 'none');
                $('.wrap').css('height','-=100px');
                $("#content").css('height','-=100px');
                $('#main_content').css('height','-=100px');
            }
        }

        function nickTdShow() {
            if ($('#nick-box1').css('display') == 'block') {
                $('#nick-box1').css('display', 'none');
                $('#nick-box2').css('display', 'block');
                $('.wrap').css('height','+=30px');
                $("#content").css('height','+=30px');
                $('#main_content').css('height','+=30px');
            } else {
                $('#nick-box1').css('display', 'block');
                $('#nick-box2').css('display', 'none');
                $('.wrap').css('height','-=30px');
                $("#content").css('height','-=30px');
                $('#main_content').css('height','-=30px');
            }
        }

        function emailTdShow() {
            if ($('#email-box1').css('display') == 'block') {
                $('#email-box1').css('display', 'none');
                $('#email-box2').css('display', 'block');
                $('.wrap').css('height','+=120px');
                $("#content").css('height','+=120px');
                $('#main_content').css('height','+=120px');
            } else {
                $('#email-box1').css('display', 'block');
                $('#email-box2').css('display', 'none');
                $('.wrap').css('height','-=120px');
                $("#content").css('height','-=120px');
                $('#main_content').css('height','-=120px');
            }
        }
    </script>
</head>

<body>
	<!-- 메뉴바-->
    <jsp:include page="../common/menubar.jsp"/>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="">
                                <i class="fa fa-shopping-cart"></i>
                                <strong>주문내역</strong>
                                <small>주문 및 배송 현황을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-credit-card"></i>
                                <strong>정기구독 관리</strong>
                                <small>정기구독 플랜을 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-qrcode"></i>
                                <strong>대여 내역 조회</strong>
                                <small>대여 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-archive"></i>
                                <strong>보관함</strong>
                                <small>찜한 내역을 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-home"></i>
                                <strong>주소록 관리</strong>
                                <small>주소록을 관리합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-check-square-o"></i>
                                <strong>추천 설정</strong>
                                <small>도서 추천 정보를 조회/수정합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-book"></i>
                                <strong>독서록 관리</strong>
                                <small>내 독서록과 스크랩한 독서록을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-book"></i>내 독서록</a></li>
                                <li><a href="#"><i class="fa fa-bookmark"></i>스크랩한 독서록</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-comments-o"></i>
                                <strong>활동한 내역</strong>
                                <small>활동 내역을 조회합니다.</small>
                            </a>
                            <ul>
                                <li><a href="#"><i class="fa fa-users"></i>나의 독서모임</a></li>
                                <li><a href="#"><i class="fa fa-question-circle"></i>내 문의내역</a></li>
                                <li><a href="#"><i class="fa fa-pencil-square-o"></i>내가 쓴 글</a></li>
                                <li><a href="#"><i class="fa fa-comment"></i>댓글</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="">
                                <i class="fa fa-ticket"></i>
                                <strong>쿠폰/포인트</strong>
                                <small>내 쿠폰과 포인트를 조회합니다.</small>
                            </a>
                        </li>
                        <li>
                            <a href="" class="active">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <c:if test="${ !empty mpAlertMsg }">
				<script>
					alertify.alert("${mpAlertMsg}");
				</script>
				<c:remove var="mpAlertMsg" scope="session"/>
			</c:if>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    개인정보 수정
                </div>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <br>
                <div id="table-box">
                <input type="hidden" name="memNo" id="memNo" value="${loginUser.memNo }"/>	
                    <table class="table">
                        <tr id="profile-box1" style="display: block;">
                            <th class="th-content">사진</th>
                            <td class="td-content">
                                <div id="profile-img-box">
                                    <div class="box" style="background: #BDBDBD;">
                                        <img class="profile" src="${loginUser.changeImgName }" onerror="this.src='resources/member/images/blank-profile.png'">
                                    </div>
                                </div>
                                <div id="profile-text-box">
                                    <p style="color: gray;">* 회원님의 프로필 사진을 등록해주세요
                                        <br>
                                        * 등록된 프로필 사진은 회원님의 게시글 혹은 댓글에 쓰입니다.
                                    </p>
                                </div>
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="profileTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="profile-box2" style="display: none;">
                            <th class="th-content">사진</th>
                            
                            <td class="td-content">
                                <div id="profile-img-box">
                                    <div class="box" style="background: #BDBDBD;">
                                        <img class="profile" id="profile-img" src="${loginUser.changeImgName }" onerror="this.src='resources/member/images/blank-profile.png'">
                                    </div>
                                </div>
                                <div id="profile-text-box">
                                    <p style="color: gray;">* 회원님의 프로필 사진을 등록해주세요
                                        <br>
                                        * 등록된 프로필 사진은 회원님의 게시글 혹은 댓글에 쓰입니다.
                                    </p>
                                </div>
                               
                                
                                <div class="profile-button-group-box">
                                	<input type="file" id="img-file" style="display:none;" name="originImgName" onchange="loadImg(this);"/> 
                                    <button type="button" class="btn btn-outline-dark btn-sm" onclick="imgFileClick();">사진 선택</button>
                                </div>
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="profileTdShow();">취소</button>
                                    <button type="button" class="btn btn-dark btn-sm" onclick="updateProfile();">수정</button>
                                </div>   
                            </td>
                            
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">아이디</th>
                            <td class="td-content">
                                ${loginUser.memId }
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="location.href='delete-account-form.mp'">탈퇴</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="pwd-box1" style="display: block;">
                            <th class="th-content">비밀번호</th>
                            <td class="td-content">
                                <strong>******</strong>

                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="pwdTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="pwd-box2" style="display: none;">
                            <th class="th-content">비밀번호</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" id="lastPwd" placeholder="기존 비밀번호">
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" name="memPwd" placeholder="신규 비밀번호(영어,숫자,특수문자 포함 최소 8글자 이상)">
                                	
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="password" class="form-control" id="pwdCheckInput" placeholder="신규 비밀번호 확인">
                                    
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="pwdTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm" onclick="pwdSubmit();">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="nick-box1" style="display: block;">
                            <th class="th-content">닉네임</th>
                            <td class="td-content">
                                ${loginUser.memName }
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="nickTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="nick-box2" style="display: none;">
                            <th class="th-content">닉네임</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="text" class="form-control" placeholder="변경할 닉네임을 입력해주세요.">
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="nickTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="email-box1" style="display: block;">
                            <th class="th-content">이메일</th>
                            <td class="td-content">
                                 ${loginUser.memEmail }
                            </td>
                            <td class="bottom-td">
                                <div class="profile-button-group-box">
                                    <button type="button" class="btn btn-secondary btn-sm"
                                        onclick="emailTdShow();">변경</button>
                                </div>
                            </td>
                        </tr>
                        <tr id="email-box2" style="display: none;">
                            <th class="th-content">이메일</th>
                            <td class="td-content">
                                <div>
                                    <p style="color: gray; font-size: small;">
                                        * 메일 번호를 입력후 완료 버튼을 누르시면 인증이 완료됩니다. <br>
                                        * 해당 인증 번호를 아래에 입력하시면 인증이 완료되고 메일이 변경됩니다.
                                    </p>
                                </div>
                                <div class="input-group input-group-sm mb-3" style="width: 59%;">
                                    <input type="email" class="form-control" placeholder="변경할 이메일 주소">
                                    <button class="btn btn-secondary" type="button" id="button-addon2">전송</button>
                                </div>
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="email" class="form-control" placeholder="인증번호 입력">
                                </div>
                                <button type="button" class="btn btn-secondary btn-sm" style="margin-right: 10px;"
                                    onclick="emailTdShow();">취소</button>
                                <button type="button" class="btn btn-dark btn-sm">완료</button>
                            </td>
                            <td class="bottom-td">
                            </td>
                        </tr>
                        <tr id="address-box" style="display: block;">
                            <th class="th-content">주소</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3" style="width: 50%;">
                                    <input type="text" class="form-control" placeholder="우편번호" value="${loginUser.memPost}" readonly>
                                    <button class="btn btn-secondary" type="button" id="button-addon2">우편번호 찾기</button>
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <input type="text" class="form-control" placeholder="기본주소" value="${loginUser.memBasicAddress}" readonly/>
                                </div>
                                <div class="input-group input-group-sm mb-3">
                                    <input type="text" class="form-control" placeholder="상세주소" style="width: 60%;" value="${loginUser.memDetailAddress }">
                                    <input type="text" class="form-control" placeholder="참고사항" value="${loginUser.memAddressRefer }"
                                        style="width: 30%; margin-left: 10px;">
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">실명</th>
                            <td class="td-content">
                                <div class="input-group input-group-sm mb-3 input-middle">
                                    <input type="text" class="form-control" placeholder="실명" value="${loginUser.memName }">
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">성별</th>
                            <td class="td-content">
                                <div id="radio-box">
                                    <div class="form-check" style="margin-right: 10px;">
                                        <input class="form-check-input" type="radio"
                                            id="memGender" name="memGender" value="M" <c:if test="${loginUser.memGender == 'M'}">checked</c:if>>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            남
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" 
                                            id="memGender" name="memGender" value="F" <c:if test="${loginUser.memGender == 'F'}">checked</c:if>>
                                        <label class="form-check-label" for="flexRadioDefault1">
                                            여
                                        </label>
                                    </div>
                                </div>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                        <tr style="display: block;">
                            <th class="th-content">연령대</th>
                            <td class="td-content">
                                <select class="form-select form-select-sm" style="width: 40%;"
                                    aria-label="Default select example">
                                    <option value="10" <c:if test="${loginUser.memAge == 10}">selected</c:if>>10대</option>
                                    <option value="20" <c:if test="${loginUser.memAge == 20}">selected</c:if>>20대</option>
                                    <option value="30" <c:if test="${loginUser.memAge == 30}">selected</c:if>>30대</option>
                                    <option value="40" <c:if test="${loginUser.memAge == 40}">selected</c:if>>40대</option>
                                    <option value="50" <c:if test="${loginUser.memAge == 50}">selected</c:if>>50대</option>
                                    <option value="60" <c:if test="${loginUser.memAge == 60}">selected</c:if>>60대</option>
                                    <option value="70" <c:if test="${loginUser.memAge == 70}">selected</c:if>>70대 이상</option>
                                </select>
                            </td>
                            <td class="bottom-td">

                            </td>
                        </tr>
                    </table>
                     <script>
                                	var $lastPwdInput = $("#pwd-box2 input[id=lastPwd]");
                                	var $pwdInput = $("#pwd-box2 input[name=memPwd]");
                        			var $pwdCheckInput = $("#pwd-box2 input[id=pwdCheckInput]");
                        			
                                	function imgFileClick(){
                                		$("#img-file").click();
                                	}
                                	
                                	function loadImg(inputFile){
                                        // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                                        // num : 몇번째 input요소인지 확인 후 해당 그영역에 미리보기하기위해서
                                    	// 확장자 체크
                                        if(!/\.(gif|jpg|jpeg|png)$/i.test(inputFile.files[0].name)){
                                        	alert('gif, jpg, png와 확장자명이 같은 이미지 파일만 선택해 주세요.\n\n현재 파일 : ' + inputFile.files[0].name);
                                        	return;
                                        }

                                        
                                    
                                        if(inputFile.files.length == 1){ 
                                            // 선택된 파일이 존재할 경우 
                                            // => 선택된 파일을 읽어들여서 그 영역에 맞는 곳에 미리보기
                                            
                                            // 파일을 읽어들일 FileReader 객체 생성
                                            var reader = new FileReader();
                                            
                                            // 파일을 읽어들이는 메소드 => 해당 파일을 읽어들이는 순간 해당 그 파일만의 고유한 url 부여됨
                                            reader.readAsDataURL(inputFile.files[0]);
                                            
                                            // 파일 읽기가 다 완료되었을 때 실행할 함수를 정의
                                            reader.onload = function(e){
                                                // 각 영역에 맞춰서 이미지 미리보기
                                                $("#profile-img").attr("src", e.target.result); 
                                            }
                                            
                                        }
                                        
                                    }
                                	
                                	function updateProfile(){
                                		
                                		
                                		var formData = new FormData();
                                		
                                		var file = $("#img-file")[0].files[0];
                                		
                                		formData.append("file",file);
                                		
                                		if(file != undefined){
                                			$.ajax({
                                				type: "post",
                        						url: "update-my-profile-img.mp",
                        						enctype: 'multipart/form-data',
                        						data: formData,
                        						processData: false,
                        						contentType: false,
                        						success: function(data){
                        							alert("프로필 수정에 성공했습니다.");
													document.location.href = document.location.href;
												
                        						},error:function(){
                        							console.log("ajax통신 실패");
                        						}
                        					});
                                		}else{
                                			alert('이미지를 선택해주세요');
                                		}
                                	}
                                	
                                	let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; 
                                	
                               
                                	function pwdSubmit(){
										var lastDecodePwd;
										
										var matchLastPwdResult;
										
                                		$.ajax({
                        					url: "get-pwd.mp",
                        					data: {memNum : $("#memNo").val()},
                        					async: false,
                        					success: function(pwd){
                        						
												lastDecodePwd = pwd;
                        						
                        					},error:function(){
                        						console.log("ajax통신 실패");
                        					}
                        				});
                                		
                                		
                                		
                                		// 1. 셋 다 입력되었는지 확인
                                		if($lastPwdInput.val().length == 0 || $pwdInput.val().length == 0 || $pwdCheckInput.val().length == 0){
                                			alert('기존 비밀번호, 새로운 비밀번호, 비밀번호 확인을 모두 입력해주세요');
                                			return false;
                                		}
                                		
                                		$.ajax({
                        					url: "match-last-pwd.mp",
                        					data: {memNum : $("#memNo").val(), inputLastPwd : $lastPwdInput.val()},
                        					async: false,
                        					success: function(result){
                        						
                        						matchLastPwdResult = result;
                        						
                        					},error:function(){
                        						console.log("ajax통신 실패");
                        					}
                        				});
                                		
                                		//2. 기존 비밀번호가 일치하는지 확인
                                		if(matchLastPwdResult == 'fail'){
                                			alert('기존 비밀번호가 일치하지 않습니다.');
                                			return false;
                                		}
                                		// 3. 만약 기존 비밀번호가 맞다면, 비밀번호와 비밀번호 확인값이 일치하는지 확인
                                		if($pwdCheckInput.val() != $pwdInput.val()){
                                			alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
                                			return false;
                                		}
                                		// 4. 일치한다면,  신규비밀번호 형식 테스트
                                		if(!check.test($pwdInput.val())){
                                			alert('신규비밀번호가 형식과 일치하지 않습니다.비밀번호는 영어,숫자,특수문자 포함 최소 8글자 이상입니다.');
                                			return false;
                                		}
                                		// 5. 기존비밀번호와 신규 비밀번호가 같은지 테스트
                                		if($lastPwdInput.val() == $pwdInput.val()){
                                			alert('기존 비밀번호와 신규 비밀번호가 같습니다.')
                                			return false;
                                		}else{
                                			//비밀번호 변경하는 ajax호출
                                			$.ajax({
                                				type: "post",
                            					url: "update-pwd.mp",
                            					data: {memNum : $("#memNo").val(), memPwd : $pwdInput.val()},
                            					success: function(result){
    												alert('패스워드가 성공적으로 변경되었습니다.');
    												document.location.href = document.location.href;
                            						
                            					},error:function(){
                            						console.log("ajax통신 실패");
                            					}
                            				});
                                		}
                                		
                                		
                                	}
                                	
                                	
                                </script>
                </div>
                <div>
                    <div class="d-grid gap-2 col-6 mx-auto" style="margin-top: 40px;">
                        <button class="btn btn-dark" type="button">수정사항 반영</button>
                      </div>
                </div>
            </div>

        </div>
    </div>
     <jsp:include page="../common/footer.jsp"/>
</body>

</html>