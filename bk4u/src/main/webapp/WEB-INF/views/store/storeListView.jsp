<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content1{
		width:800px;
		margin:auto;		
		margin-top: 200px;
		margin-bottom: 200px;
	}
	
	.searchBar1{
	width:1000px;	
	margin-bottom:30px;
	}
	
	.table_board{
	
 
		font-size: 18px;	
	    border-collapse: collapse;	 	   
	    border-top: 2px solid #ccc;
	    border-bottom: 2px solid #ccc;
	    width:100%;
	   	     
    }
    .table_board>tbody>tr>th{
    	background-color: rgb(224,224,224);
    	text-align:center;
    }
    .table_board>tbody>tr>td{    	
    	text-align:center;
    }
  #paging-wrap, #search-wrap, .custom-select ,input::placeholder{font-size: 14px;}

    #paging-wrap{width:fit-content; margin:auto;}
    .page-link, .page-link:hover{color:rgb(252, 190, 52);}
	
 #popup_open_btn{
		font-size: 16px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 2.5em;
		border-radius: 4px;
		background-color: rgb(224, 224, 224);
		width:80px;
		height:40px;
		float:right;			
	}
	span{
	display: inline-block;
	}
	.Title{	
	height:100px;	
	font-weight:bold;
	font-size:36px;
	margin-top:200px;
	
	}
	.choose{
	 margin-left:310px;
	}
	
	
    #my_modal, #update {
         display: none;
         width: 300px;
         padding: 20px 60px;
         background-color: #fefefe;
         border: 1px solid #888;
         border-radius: 3px;
         }
    #my_modal .modal_close_btn {
         position: absolute;
         top: 10px;
         right: 10px;
         }
         
    .delete{
    	font-size:15px;
    	border:0px;
    	width:60px;
    	height:30px;
    }
       
    
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
 	<div id="content1">
 		<div class="Title">지점 관리</div>
 	<div class="searchBar1">
 	<span class="listCount">
 	<h5>목록   [총${listCount}개]</h5>
 	</span>
 	<span class="choose">
	<select name="choice">
	<option>전체</option>
	<option>매장명</option>
	<option>전화번호</option>
	<option>관리자명</option>
	</select>	
	<input type="text"/>
	<button>검색</button>
	</span>
	</div>

	<table class="table_board">
	<tbody>
	<tr>
	<th>No</th>	
	<th>매장명</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>보유도서</th>	
	<th>상태</th>
	<th>삭제 여부</th>
	</tr>

	<c:forEach var="st" items="${list}">
		<tr>
		<td style="height:60px;" class="storeNo">${st.storeNo}</td>		
		<td class="storeName">${st.storeName}</td>
		<td class="storeAddress">${st.storeAddress}</td>
		<td class="storePhone">${st.storePhone}</td>
		<td>
		<button value="${st.storeNo}" class="book" style="border:0px; background-color:white; color:blue;">
		보러가기
		</button>
		</td>	
		<td class="storeStatus">${st.storeStatus}</td>
		<td class="storeClosed" style="display:none;">${st.storeClosed}</td>
		<td class="storeOpen" style="display:none;">${st.storeOpen}</td>
		<td>
		<button value="${st.storeNo}" class="delete">삭제</button>
		</td>
		</tr>
	</c:forEach>

	</tbody>
	</table>
	 <script>
            	$(function(){
            		
            		$(".book").click(function(){
            			location.href="list.storebook?storeNo=" + $(this).val();
            		});
            		$(".delete").click(function(){
            			location.href="delete.store?storeNo=" + $(this).val();
            		});
            		
            		$(".table_board>tbody>tr").click(function(){
            			var storeNo= $(this).children(".storeNo").text();
            			$("#storeNo").val(storeNo);
            			var storeName= $(this).children(".storeName").text();
            			$("#storeName").val(storeName);
            			var storeAddress= $(this).children(".storeAddress").text();
            			$("#storeAddress").val(storeAddress);
            			var storePhone= $(this).children(".storePhone").text();
            			$("#storePhone").val(storePhone);     
            			var storeClosed= $(this).children(".storeClosed").text();
            			$("#storeClosed").val(storeClosed); 
            			var storeOpen= $(this).children(".storeOpen").text();
            			$("#storeOpen").val(storeOpen); 
            			modal('update');
            		});
            		
            	});
           
      </script>      
  
	<br><br><br>
	<div id="paging-wrap">
            <ul class="pagination">
            	<c:choose>
            	<c:when test="${pi.currentPage eq 1}">
                <li class="page-item disabled"><a class="page-link">이전</a></li>
                </c:when>
                <c:otherwise>
                	<li class="page-item"><a class="page-link" href="list.store?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                </c:otherwise>
                </c:choose>
                
                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}"> 
                <li class="page-item"><a class="page-link" href="list.store?currentPage=${ p }">${ p }</a></li>
                </c:forEach>
             
             <c:choose>
             	<c:when test="${pi.currentPage eq pi.maxPage}">
             		    <li class="page-item disabled"><a class="page-link">다음</a></li>
             	</c:when>
             	<c:otherwise>
             		<li class="page-item"><a class="page-link" href="list.store?currentPage=${ pi.currentPage+1 }">Next</a></li>
		        </c:otherwise>
             </c:choose>
            
            </ul>
        </div>
        <div id="popup_open_btn">추가</div>
        
             <div id="my_modal">
	            <form action="add.store" method="post">
	            	<h4>매장명</h4>
					<input type="text"  name="storeName" class="titleinput">
					<br><br>
					<h4>주소</h4>
					<input type="text" name="storeAddress" class="titleinput">
					<br><br>
					<h4>휴무일</h4>
					<input type="text"  name="storeClosed" class="titleinput">
					<br><br>
					<h4>오픈 시간</h4>
					<input type="text"  name="storeOpen" class="titleinput">
					<br><br>
					<h4>전화 번호</h4>
					<input type="text"  name="storePhone" class="titleinput">
					
					<br><br><br>
					<button type="submit" style="float:right;">등록하기</button>
	           	</form>
	            <a class="modal_close_btn">닫기</a>
       		</div>
       		
       		 <div id="update">
       		 	
       		 	<a class="modal_close_btn" style="float:right;">닫기</a>
	          
				<form action="update.store" method="post">
	            <input type="hidden" id="storeNo" name="storeNo" class="titleinput">
	            	<h4>매장명</h4>
					<input type="text" id="storeName" name="storeName" class="titleinput">
					<br><br>
					<h4>주소</h4>
					<input type="text" id="storeAddress" name="storeAddress" class="titleinput">
					<br><br>
					<h4>휴무일</h4>
					<input type="text"  id="storeClosed" name="storeClosed" class="titleinput">
					<br><br>
					<h4>오픈 시간</h4>
					<input type="text"  id="storeOpen" name="storeOpen" class="titleinput">
					<br><br>
					<h4>전화 번호</h4>
					<input type="text" id="storePhone" name="storePhone" class="titleinput">
					
					<br><br>				
					<button type="submit" style="float:right;">수정하기</button>
					
	           	</form>
	            
       		</div>
       		
       		
        <script>
            function modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
                              
               

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            document.getElementById('popup_open_btn').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
            
            
        </script>
        
</div>


<jsp:include page="../common/footer.jsp"/>
</body>
</html>