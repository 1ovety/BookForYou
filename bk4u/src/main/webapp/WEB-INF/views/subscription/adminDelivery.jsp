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

<style>
		#outer{
            display:inline-block;
            position:absolute;
            margin-top:50px;
            margin-left:250px;
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
        
        a{text-decoration: none;}

        /* 캘린더 */
        #calendar-area{
            display: inline-block;
            width:100%;
            height: 450px;
            border:0.01em solid grey;
            padding:10px;
        }
        #calendar-area > div{
            width:100%;
            height: 100%;
            font-size:1em;
        }

        /* 타이틀 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:18px;
            font-weight: 600;
        }

        /* 목록 정렬 */
        #array-div{float:right; margin:15px 0 15px 0;}
        #array-condition{
            width:140px;
            height: 25px;
        }

        /* 테이블 */
        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

        /* 처리 버튼 */
        .select-book, .delivery{
            width:100px;
            margin:auto;
            border:0.1em solid #307451;
            border-radius: 5px;
        } 
        .select-book>a, .delivery>a{
            color:#307451;
            font-weight: 600;
        }

        /* 메모 컬럼 */
        .user-memo-content.hide, .admin-memo-content.hide{display: none;}
        .user-memo{margin-bottom: 5px;}
        .user-memo button, .admin-memo button{
            border:0.1em solid grey;
            border-radius: 5px;
            width:55px;
            background-color: white;
        }

        .user-memo.no-exist>button{color:grey;}
        .admin-memo.no-exist>button{color: rgb(255, 150, 59);}


        .user-memo.exist button,.admin-memo.exist button{border:none;}
        .user-memo.exist button{background-color: rgb(252, 190, 52);}
        .admin-memo.exist button{background-color: rgb(255, 150, 59);}
        .user-memo.exist>button, .admin-memo.exist>button{color:rgb(64, 64, 64);}

        /* 메모 모달 */
        .user-memo-content, .admin-memo-content{
            position:absolute;
            border:0.05em solid black;
            box-shadow: 0px 0px 15px #000;
            display: inline-block;
            background-color: white;
        }
        .user-memo-content{
            width:300px;
        }
        .user-memo-content > .memo-top{
            background-color: rgb(252, 190, 52);
        }
        .memo-top{
            font-size:14px;
            font-weight: 600;
            padding: 0.1em 0.7em;
        }
        .memo-top p, .memo-bottom p{margin:0px;}
        .memo-bottom{
            font-size:14px;
            padding:0.5em 0.7em;
        }

        .admin-memo-content{
            width:300px;
        }
        .admin-memo-content > .memo-top{background-color: rgb(255, 150, 59);}
        .admin-memo-content input{width:100%;}
        .memo-btn-area{
            float:right;
            margin: 0 5px 5px 0;
        }
        .memo-btn-area button{
            border:0.1em solid grey;
            font-size:12px;
            background-color: white;
        }
        .memo-delete-btn{color:rgb(255, 150, 59);}
        .memo-upgrade-btn{color:black;}

        
        
        /* 페이징 */
        #paging-area{
            width:fit-content;
            margin:auto;
        }
        #pagination{
            padding:0;
            list-style: none;
        }
        #pagination li{
            display:inline-block;
            width:35px;
            height: 30px;
            text-align: center;
            line-height: 18px;
            font-size:16px;
            padding:5px;
            border: 1px solid black;
            border-radius: 5px;
        }
        #pagination li:hover{
            cursor: pointer;
            font-weight: 600;
            color: #EC573B;
        }
</style>

<script>
	$(function(){
	
	    $(".admin-memo button").click(function(){
	        $(".admin-memo-content").toggleClass("hide");
	
	        if($(this).parent().is(".no-exist")){
	            $(".admin-memo-content .memo-delete-btn").hide();
	        }else{
	            $(".admin-memo-content .memo-delete-btn").show();
	        }
	
	        const a = $(this).offset();
	        $(".admin-memo-content").offset({top: a.top , left: a.left-320});
	    })
	
	    $(".user-memo.exist button").click(function(){
	        $(".user-memo-content").toggleClass("hide");
	        const a = $(this).offset();
	        $(".user-memo-content").offset({top: a.top-40 , left: a.left-320});
	    })
	
	})
</script>

<!-- fullcalendar -->
<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView: 'dayGridMonth'
	    });
	    calendar.render();
	});
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="../resources/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>정기배송 보내기</p>
        </div> 
        <br>

        <div id="calendar-area">
            <div id="calendar"></div>
        </div>

        <div id="result-area">
            <div id="result-title">
                <p>조회결과</p>
                <span>[총 10개]</span>
            </div>
    
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="">신청일순</option>
                    <option value="">신청일 역순 </option>
                </select>
            </div>

            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>구독번호</th>
                            <th>신청일/종료일</th>
                            <th>구독자</th>
                            <th>구독이름</th>
                            <th>구독기간</th>
                            <th>도서</th>
                            <th>배송코드/배송상태</th>
                            <th width="70px">메모</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>rd0001</td>
                            <td>2021-07-01<br>2021-10-01</td>
                            <td>최하늘<br>(on001)</td>
                            <td>베이직</td>
                            <td>3개월권</td>
                            <td>
                                <div class="select-book">
                                    <a href="">선택하기</a>
                                </div>
                            </td>
                            <td>
                                <div class="delivery">
                                    <a href="subscriptionDeliveryDetail.html">보내기</a>
                                </div>
                            </td>
                            <td>
                                <!-- 사용자 배송메세지(DELIVERY_MSG)가 존재하지 않을(NULL) 경우 -->
                                <div class="user-memo no-exist">
                                    <button type="button">user</button>
                                </div>
                                <!-- 관리자 메모(ADMIN_MEMO)가 존재하지 않을(NULL) 경우 -->
                                <div class="admin-memo no-exist">
                                    <button type="button">admin</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="user-memo-content hide">
                <div class="memo-top">
                    <p>구매자 배송메세지</p>
                </div>
                <div class="memo-bottom">
                    <p>경비실에 맡겨주세요.</p>
                </div>
            </div>
    
            <div class="admin-memo-content hide">
                <div class="memo-top">
                    <p>관리자 메모</p>
                </div>
                <div class="memo-bottom">
                    <p><input type="text" value="엄청 빠른 배송"></p>
                </div>
                <div class="memo-btn-area">
                    <!-- 관리자 메모가 존재하지 않을 때는 삭제 버튼이 없음!! 저장버튼만 있음  -->
                    <button type="button" class="memo-delete-btn">삭제</button>
                    <button type="button" class="memo-upgrade-btn">저장</button>
                </div>
            </div>
            <br>
            <div id="paging-area">
                <ul id="pagination">
                    <li><a>&lt;</a></li>
                    <li><a>1</a></li>
                    <li><a>2</a></li>
                    <li><a>3</a></li>
                    <li><a>4</a></li>
                    <li><a>5</a></li>
                    <li><a>&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>