<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	    #outer{
            display:inline-block;
            position:absolute;
            margin:50px 0 0 250px;
            width: 950px;
        }
        #main-title > p{
            display:inline-block;
            position: absolute;
            height:30px;
            line-height: 30px;
            margin:0 0 0 15px;
            font-size:18px;
            font-weight: 600;
        }
       

        /* 기본정보 구역 */
        #info-area{
            width:auto;
            border-top:1px solid black;
            border-bottom:1px solid black;
            padding:15px;
        }
        #book-img{float:left;}
        #book-info{
            display: inline-block;
            margin-left:60px;
        }
        
        #numberNo{
            display: inline-block;
            margin: 30px 0 10px 0;
            background-color: rgba(209, 213, 218, 0.466);
            padding:0 0.5em;
        }
        #numberNo p {margin:0px;}

        .book-info-content{margin: 5px 0;}
        .book-info-content div{display:inline-block;}
        .div-name{
            font-size:16px;
            font-weight: 600;
            width:100px;
        }
        
        /* 상태 체크 구역 */
		#status-area{float:right;}
        .book-status{margin:5px;}
        .book-status input[type="radio"], .recommended input[type="radio"]{display: none;}
        .book-status input[type="radio"] + label, .recommended input[type="radio"] + label{
            cursor: pointer;
            font-weight: bold;
            font-size: 13px;
            vertical-align: middle;
            text-align: center;
        }
        .book-status input[type="radio"] + label{
        	padding:0.1em 0.2em;
        	height: 25px;
            width: 70px;
            border:1px solid grey;
            background-color: #fff;
            color:#333;
        }
        .book-status input[type="radio"]:checked+label{
            background-color: #333;
            color:#fff;
        }
        .recommended input[type="radio"] + label{
        	padding: 0.1em 1em;
        	border:0.1em solid #EC573B;
            border-radius: 10px;
            width: auto;
        }
        .recommended input[type="radio"]:checked + label{
        	background-color: #EC573B;
            color:#fff;
        }

        /* 상세정보 구역 */

        /* 탭 */
        .nav{
            padding-left: 0px;
            padding-right: 0px;
            margin-left: 0px;
            margin-top:90px;
        }
        .tab-content{
            border:1px solid grey;
            border-radius: 5px;
            width:auto;
            height: auto;
            padding:20px;
        }

        /* 추천 키워드 */
        #keyword div{
            display: inline-block;
            width:100%;
        }
        #keyword ul{
            list-style: none;
            width: 80%;
            padding:0px;         
        }
        #keyword li{
            float: left;
            text-align: center;
            margin:7px;
        }

        .recommended{margin-bottom: 10px;}
        .recommended>div>p{
            font-size: 16px;
            
            margin:0 0 10px 0;
            height: 17px;
        }
        
        
        /* 저자소개 */
        
        #writer-profile{
            float:left;
            height: 150px;
            margin: 30px 30px 30px 0;
        }
        #writer-img{
            display: inline-block;
            width: 100px;
            height: 100px;
            border-radius: 70%;
            border:2px solid black;
            text-align: center;
            line-height: 90px;
        }
        #writer-img>img{
            width: 80%;
            height: 80%;
            object-fit: cover;
        }
        .writer-title{
            font-size: 18px;
        }
        .writer-name{
            
            text-align: center;
            font-weight: 600;
        }
        
        .textarea{
            display: inline-block;
            border:1px solid gray;
            border-radius: 10px;
            width: auto;
            height: auto; 
            text-align: center;
            padding:10px;
        }
        .textarea > textarea{width: 700px; height: 180px; border:none;}

        /* 저장 버튼 */
        #btn-submit{float:right;}
        #btn-submit > button{
            width:80px;
            height: 30px;
            font-size: 15px;
            font-weight: 600;
            border: 0.1em solid grey;
            border-radius: 5px;
            margin-left:20px;
            background-color: white;
            color:#EC573B;
        }
</style>
<script>
        $(function(){
        	
        	const $month = '${ month }'
        	$("select[name='month'] > option").each(function(){
        		if($(this).val() == $month){
        			$(this).attr("selected", true);
        		}
        	})
        	
        	const $bkStatus = `${ book.bkStatus }`
        	$("input[name='bkStatus']").each(function(){
        		if($(this).val() === $bkStatus){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	const $selStatus = `${ book.bkSelStatus }`
        	
        	$("input[name='selStatus']").each(function(){
	        	if($(this).val() === $selStatus){
	        		$(this).attr("checked", true);
	        	}
        	})
        	
        	const $bkAge = `${ book.bkAge }`
        	$("input[name='bkAge']").each(function(){
        		if($(this).val() === $bkAge){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	const $bkGender = `${ book.bkGender }`
        	$("input[name='bkGender']").each(function(){
        		if($(this).val() === $bkGender){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	const $bkWork = `${ book.bkWork }`
        	$("input[name='bkWork']").each(function(){
        		if($(this).val() === $bkWork){
        			$(this).attr("checked", true);
        		}
        	})
        	
        	const $bkLevel = `${ book.bkLevel }`
        	$("input[name='bkLevel']").each(function(){
        		if($(this).val() === $bkLevel){
        			$(this).attr("checked", true);
        		}
        	})
        	
        })
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>

	<div id="outer">
        
        <div id="main-title">
            <img src="resources/adminCommon/images/next.png" alt="메뉴아이콘" width="20px" height="20px">
            <p>도서상세</p>
        </div>

		<div id="numberNo">
            <p>[${ book.bkNo }]</p>
        </div>
        
        <div>
            <form action="">
                
                 <div id="info-area">
                    <div id="book-img">
                        <img src="" alt="" width="150px;" height="180px;">
                    </div>
                    <div id="book-info">
                        <div class="book-info-content">
                            <div class="div-name">제목</div>
                            <div>
                                <input type="text" style="width:400px;" name="bkTitle" value="${ book.bkTitle }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">저자</div>
                            <div>
                                <input type="text" name="writerName" value="${ book.writerName }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">출판사</div>
                            <div>
                                <input type="text" name="bkPublish" value="${ book.bkPublish }">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">출판일</div>
                            <div>
                                <input type="text" id="year" name="year" value="${ year }" placeholder="년(4자리)" style="width: 80px;">
                                <span style="margin-left:5px;">
                                    <select name="month" id="month" style="height:30px; width:70px;">
                                        <option>월</option>
                                        <option value="01">1</option>
                                        <option value="02">2</option>
                                        <option value="03">3</option>
                                        <option value="04">4</option>
                                        <option value="05">5</option>
                                        <option value="06">6</option>
                                        <option value="07">7</option>
                                        <option value="08">8</option>
                                        <option value="09">9</option>
                                        <option value="10">10</option>
                                        <option value="11">11</option>
                                        <option value="12">12</option>
                                    </select>
                                </span>
                                <input type="text" id="day" name="day" value="${ day }" placeholder="일" style="margin-left:5px; width: 70px;">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">정가</div>
                            <div>
                                <input type="text" name="bkPrice" value="${ book.bkPrice }" style="width:100px;">
                            </div>
                        </div>
                        <div class="book-info-content">
                            <div class="div-name">재고</div>
                            <div>
                                <input type="text" name="bkStock" value="${ book.bkStock }" style="width:100px;">
                            </div>
                        </div>
                    </div>   
                    <div id="status-area">
                        <div class="book-status a">
                            <input type="radio" id="bkStatusY" name="bkStatus" value="판매중"><label for="bkStatusY">판매중</label>
                            <input type="radio" id="bkStatusN" name="bkStatus" value="품절"><label for="bkStatusN">품절</label>
                        </div>
                        <div class="book-status b">
                            <input type="radio" id="selStatusY" name="selStatus" value="Y"><label for="selStatusY">게시함</label>
                            <input type="radio" id="selStatusN" name="selStatus" value="N"><label for="selStatusN">게시안함</label>
                        </div>
    
                    </div>
                </div>

                <div id="book-content">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <a class="nav-link active" data-bs-toggle="tab" href="#keyword">추천키워드</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#writerInfo">저자소개</a>
                        </li>
                        <li class="nav-item" role="presentation">
                            <a class="nav-link" data-bs-toggle="tab" href="#bookInfo">책소개</a>
                        </li>
                    </ul>
        
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="keyword" class="container tab-pane active"><br>
                            <div class="recommended age">
                                <div><p>나이</p></div>
                                <div>
                                    <ul>
                                        <li><div class="book-age"><input type="radio" id="bkAge10" name="bkAge" value="10"><label for="bkAge10">10대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge20" name="bkAge" value="20"><label for="bkAge20">20대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge30" name="bkAge" value="30"><label for="bkAge30">30대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge40" name="bkAge" value="40"><label for="bkAge40">40대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge50" name="bkAge" value="50"><label for="bkAge50">50대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge60" name="bkAge" value="60"><label for="bkAge60">60대</label></div></li>
                                        <li><div class="book-age"><input type="radio" id="bkAge70" name="bkAge" value="70"><label for="bkAge70">70대</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended gender">
                                <div><p>성별</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkGenF" name="bkGender" value="F"><label for="bkGenF">여성</label></div></li>
                                        <li><div><input type="radio" id="bkGenM" name="bkGender" value="M"><label for="bkGenM">남성</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended interest">
                                <div><p>관심사 (중복가능)</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkInt1" value="여행"><label for="bkInt1">여행</label></div></li>
                                        <li><div><input type="radio" id="bkInt2" value="진로"><label for="bkInt2">진로</label></div></li>
                                        <li><div><input type="radio" id="bkInt3" value="기획/마케팅"><label for="bkInt3">기획/마케팅</label></div></li>
                                        <li><div><input type="radio" id="bkInt4" value="리더십"><label for="bkInt4">리더십</label></div></li>
                                        <li><div><input type="radio" id="bkInt5" value="자녀교육"><label for="bkInt5">자녀교육</label></div></li>
                                        <li><div><input type="radio" id="bkInt6" value="지식/상식"><label for="bkInt6">지식/상식</label></div></li>
                                        <li><div><input type="radio" id="bkInt7" value="시간관리"><label for="bkInt7">시간관리</label></div></li>
                                        <li><div><input type="radio" id="bkInt8" value="심리"><label for="bkInt8">심리</label></div></li>
                                        <li><div><input type="radio" id="bkInt9" value="경제"><label for="bkInt9">경제</label></div></li>
                                        <li><div><input type="radio" id="bkInt10" value="재테크"><label for="bkInt10">재테크</label></div></li>
                                        <li><div><input type="radio" id="bkInt11" value="정치/사회"><label for="bkInt11">정치/사회</label></div></li>
                                        <li><div><input type="radio" id="bkInt12" value="과학"><label for="bkInt12">과학</label></div></li>
                                        
                                        <li><div><input type="radio" id="bkInt13" value="미술"><label for="bkInt13">미술</label></div></li>
                                        <li><div><input type="radio" id="bkInt14" value="철학"><label for="bkInt14">철학</label></div></li>
                                        <li><div><input type="radio" id="bkInt15" value="음악"><label for="bkInt15">음악</label></div></li>
                                        <li><div><input type="radio" id="bkInt16" value="외국어"><label for="bkInt16">외국어</label></div></li>
                                        <li><div><input type="radio" id="bkInt17" value="예술"><label for="bkInt17">예술</label></div></li>
                                        <li><div><input type="radio" id="bkInt18" value="신앙"><label for="bkInt18">신앙</label></div></li>
                                        <li><div><input type="radio" id="bkInt19" value="문학"><label for="bkInt19">문학</label></div></li>
                                        <li><div><input type="radio" id="bkInt20" value="역사"><label for="bkInt20">역사</label></div></li>
                                        <li><div><input type="radio" id="bkInt21" value="환경"><label for="bkInt21">환경</label></div></li>
                                        <li><div><input type="radio" id="bkInt22" value="프로그래밍"><label for="bkInt22">프로그래밍</label></div></li>
                                        <li><div><input type="radio" id="bkInt23" value="공부"><label for="bkInt23">공부</label></div></li>
                                        <li><div><input type="radio" id="bkInt24" value="요리"><label for="bkInt24">요리</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended ganre">
                                <div><p>장르</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkSubCate1" value="소설"><label for="bkSubCate1">소설</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate2" value="진로"><label for="bkSubCate2">시/에세이</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate3" value="기획/마케팅"><label for="bkSubCate3">경제/경영</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate4" value="리더십"><label for="bkSubCate4">자기계발</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate5" value="자녀교육"><label for="bkSubCate5">요리</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate6" value="지식/상식"><label for="bkSubCate6">역사/문화</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate7" value="시간관리"><label for="bkSubCate7">종교</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate8" value="심리"><label for="bkSubCate8">정치/사회</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate9" value="경제"><label for="bkSubCate9">예술</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate10" value="재테크"><label for="bkSubCate10">유아</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate11" value="정치/사회"><label for="bkSubCate11">기술/공학</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate12" value="과학"><label for="bkSubCate12">컴퓨터/IT</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate13" value="여행"><label for="bkSubCate13">문학/소설</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate14" value="진로"><label for="bkSubCate14">어학/사전</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate15" value="기획/마케팅"><label for="bkSubCate15">생활/요리</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate16" value="리더십"><label for="bkSubCate16">예술/건축</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate17" value="자녀교육"><label for="bkSubCate17">경제/경영</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate18" value="지식/상식"><label for="bkSubCate18">인문/사회</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate19" value="시간관리"><label for="bkSubCate19">일본도서</label></div></li>
                                        <li><div><input type="radio" id="bkSubCate20" value="심리"><label for="bkSubCate20">중국도서</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended job">
                                <div><p>직업</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkWorkStudent" name="bkWork" value="학생"><label for="bkWorkStudent">학생</label></div></li>
                                        <li><div><input type="radio" id="bkWorkPo" name="bkWork" value="공무원"><label for="bkWorkPo">공무원</label></div></li>
                                        <li><div><input type="radio" id="bkWorkMk" name="bkWork" value="마케터"><label for="bkWorkMk">마케터</label></div></li>
                                        <li><div><input type="radio" id="bkWorkPl" name="bkWork" value="기획자"><label for="bkWorkPl">기획자</label></div></li>
                                        <li><div><input type="radio" id="bkWorkDoc" name="bkWork" value="의사"><label for="bkWorkDoc">의사</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSe" name="bkWork" value="자영업"><label for="bkWorkSe">자영업</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSv" name="bkWork" value="서비스"><label for="bkWorkSv">서비스</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkIT" name="bkWork" value="IT"><label for="bkWorkIt">IT</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkN" name="bkWork" value="무직"><label for="bkWorkN">무직</label></div></li>
                                    	<li><div><input type="radio" id="bkWorkSt" name="bkWork" value="취업준비생"><label for="bkWorkSt">취업준비생</label></div></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="recommended level">
                                <div><p>난이도</p></div>
                                <div>
                                    <ul>
                                        <li><div><input type="radio" id="bkLevelE" name="bkLevel" value="쉬움"><label for="bkLevelE">쉬움</label></div></li>
                                        <li><div><input type="radio" id="bkLevelM" name="bkLevel" value="보통"><label for="bkLevelM">보통</label></div></li>
                                        <li><div><input type="radio" id="bkLevelH" name="bkLevel" value="어려움"><label for="bkLevelH">어려움</label></div></li>
                                        <li><div><input type="radio" id="bkLevelA" name="bkLevel" value="무관"><label for="bkLevelA">무관</label></div></li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div id="writerInfo" class="container tab-pane fade"><br>
                            <div id="writer-profile">
                                <div id="writer-img">
                                    <img src="resources/adminCommon/images/person.png" alt="">
                                </div>
                                <div class="writer-title writer-name"><span>${ book.writerName }</span></div>
                            </div>
                            <div class="textarea info">
                                <textarea name="writerIntro" style="resize: none;">${ book.writerIntro }</textarea>
                            </div>
                        </div>

                        <div id="bookInfo" class="container tab-pane fade"><br>
                            <div>
                                <p>출판사 서평 / 목차</p>
                            </div>

                            <div id="summernote"></div>

                        </div>
                    </div>
                    <br>
                    <div id="btn-submit">
                        <button type="submit">저장</button>
                    </div>
                </div>
            </form>
        </div>

        <br><br><br>
    </div>
    
    
</body>
</html>