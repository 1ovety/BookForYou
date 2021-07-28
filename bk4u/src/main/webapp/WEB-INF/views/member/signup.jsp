<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BK4U 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        body{
            background-color: #f6f4f4;
            width:1200px;
            height:1500px;
            margin:auto;
        }
        #content-box{
            width: 550px;
            height:100%;
            background-color: #FFFFFF;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0;
        }
        #blank-box{
            height:60px;
        }
        #logo-box{
            text-align: center;
        }
        #head-of-content-box{
            margin-top: 30px;
            text-align: center;
        }
        #sign-up-box{
            width: 80%;
            height: fit-content;
            margin-left: auto;
            margin-right: auto;
        }
        #divider-box{
            text-align: center;
        }
        #input-box{
            width: 480px;
            margin: auto;
        }
        .custom-input{
            font-size: 12px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }
        .custom-input{
            border-color: #bbb;
            color: #555;
        }
        .custom-input:focus{
            border-color: #555;
        }
        .custom-input-danger{
            border-color: red;
        }
        .black-button {
            font-size: 15px;
            box-sizing: border-box;
            display: inline-flex;
            width: fit-content;
            border-width: 1px;
            border-style: solid;
            padding: 5px;
            outline: 0;
            background: rgb(55, 56, 56);
            border: 1px solid rgb(55, 56, 56);
            color: #fff;
            cursor: pointer;
            text-align: center;
        }
        
        .black-button:hover{
            background: rgb(80, 82, 82);
            border: 1px solid rgb(80, 82, 82);
            color: #fff;
            cursor: pointer;
        }
        .green-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: rgb(64, 175, 142);
            border: 1px solid rgb(64, 175, 142);
            color: #fff;
            cursor: pointer;
        }
        
        .green-button:hover{
            background: rgb(48, 151, 120);
            border: 1px solid rgb(48, 151, 120);
            color: #fff;
            cursor: pointer;
        }
        .margin-top{
            margin-top: 20px;
        }
        .custom-input-post{
            font-size: 12px;
            box-sizing: border-box;
            display: inline;
            width: 73%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }
        .custom-input-post{
            border-color: #bbb;
            color: #555;
        }
        .custom-input-post:focus{
            border-color: #555;
        }
    </style>
</head>

<body>
    <div id="content-box">
        <header>
            <div id="logo-box">
                <div id="blank-box"></div>
                <img src="resources\member\images\bk4u_logo.png" width="200px">
            </div>
            <div id="head-of-content-box">
                <h5><b>회원가입</b></h5>
            </div>
        </header>
        <div id="divider-box">
            <hr width="480px" style="margin-top: 30px; margin-left: auto; margin-right: auto;"/>
        </div>
        <div id="sign-up-box">
            <br>
            <div class="mb-3">
                <label class="form-label"><b>아이디</b></label>
                <input type="text" class="custom-input custom-input-danger" placeholder="아이디(5자~11자)" required/>
                <div id="emailCheck" class="form-text" style="color: red;">아이디는 필수 정보입니다.</div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>비밀번호</b></label>
                <input type="password" class="custom-input" placeholder="숫자,영문,특수문자 조합 최소 8자" required/>
                <div id="emailCheck" class="form-text" style="color: red;">비밀번호는 필수 정보입니다.</div>
                <input type="password" class="custom-input" placeholder="비밀번호 확인" required/>
                <div id="emailCheck" class="form-text" style="color: red;">비밀번호가 일치하지 않습니다.</div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>닉네임</b></label>
                <input type="text" class="custom-input custom-input-danger" placeholder="닉네임(최대 8자)" required/>
                <div id="nickCheck" class="form-text" style="color: red;">닉네임은 필수 정보입니다.</div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>이메일</b></label>
                <input type="email" class="custom-input custom-input-danger" placeholder="이메일을 입력해주세요. 인증에 사용됩니다." required/>
                <div id="emailCheck" class="form-text" style="color: red;">이메일은 필수 정보입니다.</div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>실명</b></label>
                <input type="email" class="custom-input custom-input-danger" placeholder="실명" required/>
                <div id="emailCheck" class="form-text" style="color: red;">실명은 필수 정보입니다.</div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>주소</b></label>
                
                <div id="post-box"><input type="email" class="custom-input-post custom-input-danger" id="memPost" placeholder="우편번호" required/>
                <button type="button" class="black-button" onclick="sample6_execDaumPostcode();">우편번호 찾기</button></div>
                
                <input type="text" class="custom-input custom-input-danger margin-top" id="memBasicAddress" placeholder="기본 주소" required/>
                <input type="text" class="custom-input custom-input-danger margin-top" id="detailAddress" placeholder="상세 주소" required/>
                <input type="text" class="custom-input custom-input-danger margin-top" id="memAddressRefer" placeholder="참고"/>
                <div id="emailCheck" class="form-text" style="color: red;">주소는 필수 정보입니다.</div>
            </div>
            <!-- 다음 주소 api -->
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
    		function sample6_execDaumPostcode() {
        		new daum.Postcode({
            		oncomplete: function(data) {
                		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                		// 각 주소의 노출 규칙에 따라 주소를 조합한다.
               			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                		var addr = ''; // 주소 변수
                		var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("memAddressRefer").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('memPost').value = data.zonecode;
		                document.getElementById("memBasicAddress").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		 
		                self.close();
		            }
		        }).open();
		    }
		</script>
            
            
            <div class="mb-3">
                <label class="form-label"><b>연령대</b></label>
                <select class="custom-input" required>
                    <option value="10" selected>10대</option>
                    <option value="20">20대</option>
                    <option value="30">30대</option>
                    <option value="40">40대</option>
                    <option value="50">50대</option>
                    <option value="60">60대</option>
                    <option value="70">70대 이상</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>연락처</b></label>
                <input type="text" class="custom-input custom-input-danger" placeholder="연락처(-를 빼고 입력해주세요.)" required/>
                <div id="phoneCheck" class="form-text" style="color: red;">연락처는 필수정보입니다.</div>
            </div>
            <br>
            <p><input type="submit" value="다음 단계" class="green-button"/></p>
            
        </div>
    </div>
</body>

</html>