<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

	.body1{
		width:1000px;
		margin: auto;		
	}
	
	.faqTitle{	
		height:100px;	
		font-weight:bold;
		font-size:36px;	
		margin: 200px 0 0 180px;
	}
	
	.cancelButton{		
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		background-color: rgb(252, 190, 52);
		width:120px;
		float:right;
		border:0px;
		
		
	}
	.uploadButton{
		font-size: 19px; 
		color: rgb(64, 64, 64); 
		text-align: center; 
		line-height: 3em;
		border-radius: 4px; 
		width:120px;
		background-color: rgb(224, 224, 224);
		float:right;
		margin-right:100px;
		border:0px;
	}
	
	h4{
	float:left
	}	
	
	.titleinput{	
    width: 800px;
    height: 60px;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;    
    font-size: 20px;
    margin-left: 50px;
    
	}
	
	.content{
	color: rgb(94, 94, 94); 
	 background: #fff;
    border: 1px solid #ccc;
     border-radius: 4px;    
    font-size: 20px;
	width:800px;
	height:587px;
	resize:none;
	margin-left: 80px;
	}
	
	.uploadfile{
	width:500px;
	height:200px;
	}
	.foot{
	width:700px;
	height:200px;
	margin-bottom:300px;
	margin-top:100px;

	}
	
</style>
</head>
<body>

<jsp:include page="../common/menubar.jsp"/>
<div class="body1">
<div class="faqTitle">신고</div>
<hr>
<form action="update.re" method="post">
<input type="hidden" name="reportNo" value="${re.reportNo}">
<h4 style="margin-top:15px; text-align:center;">게시판유형</h4>
<input type="text" value="${re.reportType1}" class="titleinput" readonly>

<br><br><br>


<h4 style="margin-left:35px;">내용</h4>
<textarea class="content" name="reportContent">${re.reportContent}</textarea>
<br><br><br><br>
<h4>사진 첨부</h4>
<div class="uploadfile">
<input type="file" style="margin-top:5px; float:right;" >
</div>

<h4>신고 링크</h4>
<a href="${re.reportLink}" style="margin-left:30px; font-size:20px;">${re.reportLink}</a>
<br><br><br><br><hr>

<div class="foot">
<button type="reset" class="cancelButton" onclick="javascript:history.go(-1);">취소</button> 
<button type="submit" class="uploadButton">등록하기</button>
</div> 
 </form>

</div>
<jsp:include page="../common/footer.jsp"/>

</body>
</html>