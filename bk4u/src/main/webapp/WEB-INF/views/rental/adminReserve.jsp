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
        .processing-outer:hover{cursor:pointer;}

        /* 공통 테두리 */
        .bar-outer{
            border:1px solid grey;
            padding:15px;
        }

        /* 검색 영역 */
        #search-area{
            display:flex;
            justify-content: center;
            margin-top:40px;
        }
        #search-bar{
            border-radius: 40px;
            border:2px solid #EC573B;
            width:600px;
            height: 40px;
            padding:1px;
            margin:auto;
            vertical-align: middle;
        }

        /* 검색 조건 select */
        #search-condition{
            display: inline-block;
            border-right:2px solid #EC573B;
            width:25%;
            height: 100%;
        }
        #search-condition>select{
            border-radius: 40%;
            border: none;
            width: 95%;
            height: 100%;
            font-size: 15px;
            text-align-last: center;
        }
        select:focus, #search-input>input:focus{
            outline:none;
        }
        
        /* 검색어 입력 */
        #search-input{
            display: inline-block;
            width:65%;
            height: 100%;
        }
        #search-input > input{
            border-radius: 40px;
            width:100%;
            height: 100%;
            border:none;
            font-size: 15px;
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
            font-size:18px;
            font-weight: 600;
        }

        /* 목록 정렬 */
        #array-div{float:right; margin:15px 0 15px 0;}
        #array-condition{
            width:140px;
            height: 25px;
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

        /* 배송 처리 컬럼 버튼 */
        .handling{
            border: 0.1em solid #EC573B;
            border-radius: 5px;
        }
        .handling>a{color: #EC573B;}

        /* 테이블 */
        .table{border:0.08em solid grey;}
        .table *{vertical-align: middle;}
        .table td, .table th{border: 0.01em solid #dee2e6;}

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
	        location.href="adminRentalList.re?rStatus=1";
	    })
	    
	    $("#getStatus2").click(function(){
	        location.href="adminRentalList.re?rStatus=2";
	    })
	    
	    $("#getStatus3").click(function(){
	        location.href="adminRentalList.re?rStatus=3&array=2";
	    })
	    
	    $("#getStatus4").click(function(){
	        location.href="adminRentalList.re?rStatus=4&array=2";
	    })
	    
	    $("#getStatus5").click(function(){
	        location.href="adminRentalList.re?rStatus=5";
	    })
	    
		/* 정렬 방법 변경 */
	    $("#array-condition").change(function(){
	        let ar = $(this).val();
	
	        if(${ empty keyword }){            	
	            location.href=`adminRentalList.re?rStatus=${ rStatus }&array=` + ar;		 
	        }else {
	        	location.href=`adminRentalList.re?rStatus=${ rStatus }&condition=${ condition }&keyword=${ keyword }&array=` + ar;
	        }
	    
	    })
	    
	    /* 정렬 시 해당 값 selected */
	    $("#array-condition").val("${ ar }").prop("selected", true);
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
                <div class="processing-box  selected">
                    <div class="img-area  selected">
                        <img class="selected img-content" src="resources/adminCommon/images/reservation selected.png" alt="">
                    </div>
    
                    <div class="text-area  selected">
                        <p>예약</p>
                    </div>
    
                    <div class="number-area  selected">
                        <p>${ reserveCount }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus2">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/rental.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>대여중</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ rentalIngCount }</p>
                    </div>
                </div>
            </div>

            <div class="processing-next">
                <img src="resources/adminCommon/images/processing-next.png" alt="">
            </div>

            <div class="processing-outer" id="getStatus3">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/returnbook.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>반납완료</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ returnCount }</p>
                    </div>
                </div>
            </div>

            <div class="processing-outer" style="margin-left:40px;" id="getStatus4">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="img-content" src="resources/adminCommon/images/overdue.png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>연체</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ overDueCount }</p>
                    </div>
                </div>
            </div>

            <div class="processing-outer" id="getStatus5">
                <div class="processing-box">
                    <div class="img-area">
                        <img class="selected img-content" src="resources/adminCommon/images/cancel .png" alt="">
                    </div>
    
                    <div class="text-area">
                        <p>예약취소</p>
                    </div>
    
                    <div class="number-area">
                        <p>${ rentalCancelCount }</p>
                    </div>
                </div>
            </div>
        </div>

        <div id="search-area">
            <form action="">
                <div id="search-bar">
                    <div id="search-condition">
                        <select name="condition">
                            <option value="searchAll">전체</option>
                            <option value="productCode">상품코드</option>
                            <option value="bookName">도서명</option>
                            <option value="writerName">저자</option>
                            <option value="publisher">출판사</option>
                        </select>
                    </div>
                    <div id="search-input">
                        <input type="text" name="">
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
                <span>[총 10개]</span>
            </div>
            <br>
            <div id="array-div">
                <select name="" id="array-condition">
                    <option value="0">대여신청일</option>
                    <option value="1">대여신청일 역순 </option>
                </select>
            </div>

            <div id="handling-btn">
                <button>예약취소</button>
                <button>대여중</button>
            </div>

            <div id="result-div">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>
                                <input type="checkbox">
                            </th>
                            <th>대여번호</th>
                            <th>대여자</th>
                            <th>매장명</th>
                            <th>도서명</th>
                            <th>대여신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="r" items="${ rList }" varStatus="no">                    	
	                        <tr>
	                            <td>${ no.count }</td>
	                            <td>
	                                <input type="checkbox">
	                            </td>
	                            <td>${ r.rentalNo }</td>
	                            <td>${ r.memName }<br>(${ r.memId })</td>
	                            <td>${ r.storeName }</td>
	                            <td>${ r.bkTitle }</td>
	                            <td>${ r.requestDate }</td>
	                        </tr>
                    	</c:forEach>
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