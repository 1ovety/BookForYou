<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        a{text-decoration: none;}

         /* 절차 */
        .processing-outer{display:inline-block;}
        .processing-box{
            border:1px solid grey;
            width:170px;
            height: 80px;
            border-radius: 10px;
            padding:11px;
            margin: auto;
        }
        .processing-box.selected{border:1px solid rgb(255, 150, 59);}
        .img-area{
            display: inline-block;
            width:55px;
            height: 100%;
            border-radius: 70%;
            text-align: center;
            vertical-align: middle;
            background-color:rgb(224, 224, 224);
        }
        .selected.img-area{background-color: rgb(255, 150, 59);}
        .img-content{
            width: 40px;
            height: 40px;
            object-fit: cover;
            margin:9px 0 9px 0;
            vertical-align: middle;
        }
        .text-area, .number-area{
            display: inline-block;
            position:absolute;
        }
        .text-area{
            font-size:18px;
            height: 22px;
            width: 100px;
            text-align: center;
        }
        .text-area > p, .number-area > p{margin:auto;}
        .selected.text-area > p{color: rgb(255, 150, 59);}
        .number-area{
            margin: 30px 0 0 0;
            font-size:20px;
            font-weight: 700;
            height: 25px;
            width: 100px;
            text-align: center;
        }
        .processing-next{
            display: inline-block;
            width:13px; height: 13px;
        }
        .processing-next > img{
            width:100%; height: 100%; 
        }
        
        .processing-box:hover{
        	cursor:pointer;
			box-shadow: 0px 0px 10px grey;
        }

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

        /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
        }
        /* 검색 바 */
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
            margin:auto;
            vertical-align: middle;
        }

        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width: 25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 14px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{outline:none;}
		/* 검색어 입력 */
        #search-input{
            display: inline-block;
            width: 65%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width: 100%;
            height: 100%;
            border:none;
            font-size: 14px;
            text-align-last: center;
            text-align: center;
        }
        /* 검색 이미지 버튼 */
        #search-btn{
            width: 5%;
            float:right;
            margin:3px 20px 3px 0;
        }
        #search-btn input{
            width: 30px;
            height: 30px;
        }

        /* 검색 결과 구역 */
        #result-area{margin-top:50px;}
        #result-title p{
            float:left; 
            margin:0 15px 0 0;
            font-size:17px;
            font-weight: 600;
        }

        /* 목록 정렬 */
        #array-div{float:right; margin:15px 0 15px 0;}
        #array-condition{
           width:140px;
           height: 25px;
           font-size:14px;
        }

        /* 처리 버튼 */
        #handling-btn .btn{
            padding:0.1em 0.5em;
        }

        /* 조회 결과 테이블 */
        #result-div{
            margin-top:20px; 
            font-size: 14px;
            text-align: center;
            
        }
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

        /* 반품 처리 컬럼 버튼 */
        .handling{
            border: 0.1em solid #EC573B;
            border-radius: 5px;
        }
        .handling>a{color: #EC573B;}

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
            box-shadow: 0px 0px 15px grey;
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

        /* 운송장정보 컬럼 */
        .delivery-wrap{float: left; text-align: left;}
        .delivery-company, .tracking-no, .delivery-btn{display: inline-block;}
        .delivery-company select{
            height: 25px;
            width: 100px;
        }
        .tracking-no{margin-top:5px;}
        .tracking-no input{
            height: 20px;
        }

        /* 운송장 번호 저장 버튼 */
        .delivery-btn{margin-top:30px;}
        .delivery-btn .btn{
            padding:0.01em 0.5em;
            height: 23px;
            width:60px;
        }

         /* 페이징 */
       	#paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

        #paging-wrap{width:fit-content; margin:auto;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
</style>

<script>
	$(document).ready(function(){
	    $("#handling-btn").children().addClass("btn btn-outline-success");
	})
	
	$(function(){
			
			/* 상태 클릭  */
		    $("#getStatus1").click(function(){
		        location.href="adminOrderList.or?orStatus=1";
		    })
		    
		    $("#getStatus2").click(function(){
		        location.href="adminOrderList.or?orStatus=2";
		    })
		    
		    $("#getStatus3").click(function(){
		        location.href="adminOrderList.or?orStatus=3";
		    })
		    
		    $("#getStatus4").click(function(){
		        location.href="adminOrderList.or?orStatus=4";
		    })
		    
		    $("#getStatus5").click(function(){
		        location.href="adminOrderList.or?orStatus=5";
		    })
			
		    /* 정렬 방법 변경 */
		    $("#array-condition").change(function(){
	            let ar = $(this).val();

	            if(${ empty keyword }){            	
		            location.href=`adminOrderList.or?orStatus=${ orStatus }&array=` + ar;		 
	            }else {
	            	location.href=`adminOListSearch.or?condition=${ condition }&keyword=${ keyword }&array=` + ar;
	            }
	        
		    })
		    
		    /* 정렬 시 해당 값 selected */
		    $("#array-condition").val("${ ar }").prop("selected", true);
		    
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
				var $orStatus = 3;
				location.href="deleteAdminMemo.or?orStatus=" + $orStatus + "&orderNo=" + $orderNo;
				
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
            
            /* 주문상태 변경 */
	        $("#handling-btn button").each(function(){
	        	$(this).click(function(){
	        		
					var checkArr = new Array();
					$("input:checkbox[name='oCheck']:checked").each(function(){
						checkArr.push(this.value);
					});
	        		
					location.href="adminOrderConfirm.or?selectedOd=" + checkArr + "&odStatus=" + $(this).val() + "&orStatus=3";
	        	})
	        })

	         /* 주문 상세 보기 */
	        $(".detailC").click(function(){
	        	
	        	var td = $(this);
	        	var orderNo = td.text();
	        	location.href='adminOrderDetail.or?orderNo=' + orderNo;
	        	
	        })

        })
</script>
</head>
<body>

	<jsp:include page="../adminSidebar.jsp"/>
	
	<div id="outer">
        <div id="main-title">
            <img src="resources/adminCommon/images/menu.png" alt="메뉴아이콘" width="30px" height="30px">
            <p>주문/배송관리</p>
        </div> 
        <br>
        <div id="processing-area">
            <div class="processing-outer" id="getStatus1">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="resources/adminCommon/images/processing.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>주문확인</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ confirmCnt }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus2">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/production.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>상품준비중</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ productReadyCnt }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus3">
                <div class="processing-box selected">
                    <div class="img-area selected">
                        <img class="selected img-content" src="resources/adminCommon/images/box selected.png" alt="">
                    </div>
    
                    <div class="text-area selected">
                        <p>배송준비중</p>
                    </div>
    
                    <div class="number-area selected">
                        <p>${deliveryReadyCnt }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus4">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="resources/adminCommon/images/delivery.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>배송중</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ deliveryCnt }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus5">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="resources/adminCommon/images/complete.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>배송완료</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ finishCnt }</p>
                    </div>
                </div>
            </div>
        </div>

        <br><br>
        <div id="search-area">
            <form action="adminOListSearch.or">
            <input type="hidden" name="array" value="${ ar }">
            <input type="hidden" name="orStatus" value="3">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition" >
                            <option value="searchAll">전체</option>
                            <option value="orderNo">주문번호</option>
                            <option value="memName">주문자명</option>
                            <option value="memId">주문자ID</option>
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="keyword" >
                    </div>
                    <div id="search-btn">
                        <input type="image" src="resources/adminCommon/images/search.png" name="Submit" value="Submit" align="absmiddle">
                    </div>
                </div>
            </form>
        </div>

        <div id="result-area">
            <div id="result-title">
                <p>조회결과</p>
                <c:choose>
	                <c:when test="${ not empty conListCount }">
	                	<span>[총 ${ conListCount }개]</span>
	                </c:when>
	            	<c:when test="${ orStatus eq 1 }">
			            <span>[총 ${ confirmCnt }개]</span>
			        </c:when>
			        <c:when test="${ orStatus eq 2 }">
			            <span>[총 ${ productReadyCnt }개]</span>
			        </c:when>
			        <c:when test="${ orStatus eq 3 }">
			            <span>[총 ${ deliveryReadyCnt }개]</span>
			        </c:when>
			        <c:when test="${ orStatus eq 4 }">
			            <span>[총 ${ deliveryCnt }개]</span>
			        </c:when>
			        <c:when test="${ orStatus eq 5 }">
			            <span>[총 ${ finishCnt }개]</span>
			        </c:when>
	                <c:otherwise>
			            <span>[총 ${ listCount }개]</span>			                
	                </c:otherwise>
                </c:choose>
            </div>
            <br>
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="0">주문일순</option>
                    <option value="1">주문일 역순 </option>
                </select>
            </div>

            <div id="handling-btn">
                <button value="4">배송중</button>
                <button value="4-1">준비완료</button>
                <button value="4-2">준비중</button>
            </div>

            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th width="30px"><input type="checkbox"></th>
                            <th>주문번호</th>
                            <th>주문일<br>(결제일)</th>
                            <th>주문자</th>
                            <th>도서명</th>
                            <th>결제금액</th>
                            <th width="250px">운송장정보</th>
                            <th>준비상태</th>
                            <th width="70px">메모</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test = "${ oList.size() != 0}"> 
		                    	<c:forEach var="o" items="${ oList }" varStatus="no">
			                        <tr>
			                            <td>${ no.count }</td>
			                            <td><input type="checkbox" name="oCheck" value="${ o.orderNo }"></td>
			                            <td class="detailC">${ o.orderNo }</td>
			                            <td>${ o.orderDate }</td>
			                            <td>${ o.memName } <br> (${ o.memId })</td>
			                            <td>${ o.bkTitle }</td>
			                            <td>${ o.orderPrice }</td>
			                            <td>
			                            	<div class="delivery-wrap">
			                                    <div class="delivery-company">
			                                        <select name="" id="">
			                                            <option value="">우체국</option>
			                                            <option value="">대한통운</option>
			                                            <option value="">롯데택배</option>
			                                            <option value="">한진택배</option>
			                                        </select>
			                                    </div>
			                                    <br>
			                                    <div class="tracking-no">
			                                        <input type="text">
			                                    </div>
			                                </div>
			                                <div  class="delivery-btn">
			                                    <button class="btn btn-outline-danger">저장</button>
			                                </div>
			                            </td>
			                            <td>${ o.deliveryStatus }</td>
			                            <td style="display:none">${ o.deliveryMsg }</td>
			                            <td style="display:none">${ o.adminMemo }</td>
					                    <td>
				                            <c:choose>
				                            	<c:when test="${ empty o.deliveryMsg }">
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
					                        	<c:when test="${ empty o.adminMemo }">
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
																<input type="hidden" name="orStatus" value="3"/>
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
																<input type="hidden" name="orStatus" value="3"/>
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
		                			<td colspan="12">조회된 결과가 존재하지 않습니다.</td>
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