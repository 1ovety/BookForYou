<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- fullcalendar -->
<link href="resources/fullcalendar/lib/main.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js"></script>

<!-- 부트스트랩  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<script>
	document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');

		  var calendar = new FullCalendar.Calendar(calendarEl, {
		    initialView: 'dayGridMonth',
		    
		    dateClick:function(info){
		  		var $date = info.dateStr.substring(8);
		    	console.log($date);
		    	
		    	/*
			    $.ajax({
					url: 'getSubscDeliveryList.su',
					data:{date: $date},
					type: 'GET',
					success: function(result) {
						
						console.log(result);
						
					},
					error:function(){
						console.log("ajax통신실패");
					}
				});
		    	*/
		    	
		    	location.href="adminSubscDeliveryList.su?date=" + $date;
				
		    	
		    },
		    events:function(info, successCallback, failureCallback){
		    	$.ajax({
		    		url:"getSubscDeliveryList.su",
		    		async:false,
		    		success:function(list){
		    			events = [];
		    			var d = "";
		    			var f = "";
		    			
		    			for(i=0; i<list.length; i++) {
		    				d='2021-08-' + list[i].subscDelDate
		    				var event = {
		    						title:list[i].memName,
		    						start:d,
		    						end:d,
		    						display:'block',
		    						allDay:false
		    				};
		    				events.push(event);
		    			}
		    			successCallback(events);
		    		},
		    		error:function(){
		    			console.log("ajax통신실패");
		    		}
		    	})
		    }
			
		  });

		  calendar.render();
	});
	
</script>


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
       	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
</style>

<script>

	$(function(){
	
		/* admin-memo 모달 보여주기 */
		$(".admin-memo button").click(function(){
			$(".admin-memo-content").toggleClass("hide");

			var tr = $(this).parent().parent().parent();
        	var td = tr.children();
        	var $memo = td.eq(10).text();
        	var $orderNo = td.eq(1).text();
        	$(".admin-memo-content .oNo").val($orderNo);
        	$(".admin-memo-content .memo-bottom input").val($memo);
        	
        	if($(this).parent().is(".no-exist")){
                $(".admin-memo-content .memo-delete-btn").hide();
            }else{
                $(".admin-memo-content .memo-delete-btn").show();
            }
        	
			const a = $(this).offset();
            $(".admin-memo-content").offset({top: a.top , left: a.left-320});
            
		})
		
		/* 관리자 메모 삭제 */
		$(".memo-delete-btn").click(function(){
			
			var $orderNo = $(".oNo").val();
			location.href="deleteAdminMemo.or?orderNo=" + $orderNo;
			
		})			

        /* user-memo 모달 보여주기 */
        $(".user-memo.exist button").click(function(){
        	
        	var tr = $(this).parent().parent().parent();
        	var td = tr.children();
        	var $memo = td.eq(9).text();
        	$(".user-memo-content .memo-bottom p").text($memo);
        	
            $(".user-memo-content").toggleClass("hide");
            const a = $(this).offset();
            $(".user-memo-content").offset({top: a.top-40 , left: a.left-320});
        })
	
	})
</script>

		 
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
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
                    	<c:choose>
                    		<c:when test = "${ s.size() != 0}"> 
		                    	<c:forEach var="s" items="${ s }" varStatus="no">
			                        <tr>
			                            <td>${ no.count }</td>
			                            <td>${ s.subscNo }</td>
			                            <td>${ s.subscSdate } <br> ${ s.subscEndDate }</td>
			                            <td>${ s.memName } <br> (${ s.memId })</td>
			                            <td>${ s.subscName }</td>
			                            <td>${ s.subscPeriod }</td>
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
			                            <td style="display:none">${ s.deliveryRequest }</td>
			                            <td style="display:none">${ s.adminMemo }</td>
					                    <td>
				                            <c:choose>
				                            	<c:when test="${ empty s.deliveryRequest }">
						                             	<!-- 사용자 배송메세지(DELIVERY_MSG)가 존재하지 않을(NULL) 경우 -->
						                                <div class="user-memo no-exist">
						                                    <button type="button">user</button>
						                                </div>
					                            </c:when>
					                            <c:otherwise>
						                         	 <!-- 사용자 배송메세지(DELIVERY_MSG)가 존재할 (not NULL) 경우 -->
							                                <div class="user-memo exist">
							                                    <button type="button">user</button>
							                                </div>
							                                <div class="user-memo-content hide">
																<div class="memo-top">
																	<p>구매자 배송메세지</p>
																</div>
																<div class="memo-bottom">
																	<p></p>
																</div>
															</div>      
					                            </c:otherwise>
					                        </c:choose>
					                        <c:choose>
					                        	<c:when test="${ empty s.adminMemo }">
						                                <!-- 관리자 메모(ADMIN_MEMO)가 존재하지 않을(NULL) 경우 -->
						                                <div class="admin-memo no-exist">
						                                    <button type="button">admin</button>
						                                </div>
						                                
						                                <div class="admin-memo-content hide">
															<div class="memo-top">
																<p>관리자 메모</p>
															</div>
															<form action="updateAdminMemo.or">
																<input type="hidden" name="orderNo" class="oNo"/>
																<div class="memo-bottom">
																	<p><input type="text" name="adminMemoContent"></p>
																</div>
																<div class="memo-btn-area">
																	<!-- 관리자 메모가 존재하지 않을 때는 삭제 버튼이 없음!! 저장버튼만 있음  -->
																	<button type="button" class="memo-delete-btn">삭제</button>
																	<button type="submit" class="memo-upgrade-btn">저장</button>
																</div>
															</form>
														</div>				
					                        	</c:when>
					                        	<c:otherwise>
						                                <!-- 관리자 메모(ADMIN_MEMO)가 존재할 (not NULL) 경우 -->
						                                <div class="admin-memo exist">
						                                    <button type="button">admin</button>
						                                </div>
						                                
						                                <div class="admin-memo-content hide">
															<div class="memo-top">
																<p>관리자 메모</p>
															</div>
															<form action="updateAdminMemo.or">
																<input type="hidden" name="orderNo" class="oNo"/>
																<div class="memo-bottom">
																	<p><input type="text" name="adminMemoContent"></p>
																</div>
																<div class="memo-btn-area">
																	<!-- 관리자 메모가 존재하지 않을 때는 삭제 버튼이 없음!! 저장버튼만 있음  -->
																	<button type="button" class="memo-delete-btn">삭제</button>
																	<button type="submit" class="memo-upgrade-btn">저장</button>
																</div>
															</form>
														</div>					
					                        	</c:otherwise>
					                        </c:choose>
					                        
					                    </td>
			                        </tr>
		                        </c:forEach>
		                	</c:when>
		                	<c:otherwise>
		                		<tr>
		                			<td colspan="12">오늘 보낼 정기구독 주문이 존재하지 않습니다.</td>
		                		</tr>
		                	</c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
            
            <br>
            <div id="paging-wrap">
	            <ul class="pagination">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq 1 }">
	                		<li class="page-item disabled"><a class="page-link">이전</a></li>
	                	</c:when>
	                	<c:otherwise>
			                <li class="page-item"><a class="page-link" href="adminOrderList.or?orStatus=${ orStatus }&array=${ ar }&currentPage=${ pi.currentPage-1 }">이전</a></li>
	    				</c:otherwise>
	    			</c:choose>            	
	                
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		                <li class="page-item"><a class="page-link" href="adminOrderList.or?orStatus=${ orStatus }&array=${ ar }&currentPage=${ p }">${ p }</a></li>
	                </c:forEach>
	                
	                
	                <c:choose>
	                	<c:when test="${ pi.currentPage ge pi.maxPage }">
			                <li class="page-item disabled"><a class="page-link">다음</a></li>            	
	                	</c:when>
	                	<c:otherwise>
	                		<li class="page-item"><a class="page-link" href="adminOrderList.or?orStatus=${ orStatus }&array=${ ar }&currentPage=${ pi.currentPage+1 }">다음</a></li>
	                	</c:otherwise>
	                </c:choose>
	            </ul>
	        </div>
        </div>
    </div>
</body>
</html>