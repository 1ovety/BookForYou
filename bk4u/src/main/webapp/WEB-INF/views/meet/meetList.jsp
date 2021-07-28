<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" url="http://java.sun.com/jsp/jstl.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
    .content{
        background-color:#FCBE34;
        margin:auto;
        width: 1200px;
    }
    .innerOuter{
        border:1px solid white;
        width:80%;
        margin:auto;
        padding:5% 15%;
        background:white;
    }

    .attandGroup{
        border: 2px solid black;
        border-radius: 10px;
        margin: auto;
        height: 90px;
    }
</style>
</head>
<body>
      
            <!--독서모임게시판상세불러오기-->
            <jsp:include page=""/>
                
              <div class="content">
      
              <div class="innerOuter"  style="padding:5% 5%;" align="center">
                    <br><br><br><br><br><br><br><br>
                    <div align="left" style="padding-left:19px">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                              <a class="nav-link active" href="#">모임정보</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" href="#">소게시판</a>
                            </li>
                    </div>
      
                  <div style="width: 800px; border-radius: 10px; height: 780px; border: 1px solid; margin: auto; padding-left: 10px;" > 

                  <br>
                    
                        <table width="820px">
                                    <td>
                                        <b>진행 예정인 정모</b>
                                        <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                                        <button type="submit" class="" style="float: right;" >삭제하기</button> 
                                         <button type="submit" class="" style="float: right;" >정모공지</button>
                                    </td>
                                    <td style="padding-right: 35px;"><b>만남의 장소</b></td>
                                </tr>
                                <br>
                        </table>    

                        <table border="2" width="770px">
                            <br>
                                <tr>
                                    <td height="180" width="570px">
                                      <table>
                                          <tr>
                                              <td style="height:5px">날짜 : </td>
                                          </tr>
                                          <tr>
                                              <td style="height:40px">장소 : </td>
                                          </tr>
                                          
                                          <tr>
                                              <td style="height:100px">
                                                  참여자프로필아이콘
                                                  data-toggle="tooltip" title="회원닉네임" 
                                              </td>
                                          </tr>
                                      </table>
                                    </td> 
                                    <td height="180">
                                        <div id="map" style="width:30px;height:180px;"></div>
            
                                                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59b5fb5033b78ddb6353f23ac7eb1bc7&libraries=services"></script>
                                                    <script>
                                                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                                        mapOption = {
                                                            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                                            level: 3 // 지도의 확대 레벨
                                                        };  
                                                    
                                                    // 지도를 생성합니다    
                                                    var map = new kakao.maps.Map(mapContainer, mapOption); 
                                                    
                                                    // 주소-좌표 변환 객체를 생성합니다
                                                    var geocoder = new kakao.maps.services.Geocoder();
                                                    
                                                    // 주소로 좌표를 검색합니다
                                                    geocoder.addressSearch('경기도 구리시 갈매순환로10', function(result, status) {
                                                    
                                                        // 정상적으로 검색이 완료됐으면 
                                                        if (status === kakao.maps.services.Status.OK) {
                                                    
                                                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                                    
                                                            // 결과값으로 받은 위치를 마커로 표시합니다
                                                            var marker = new kakao.maps.Marker({
                                                                map: map,
                                                                position: coords
                                                            });
                                                    
                                                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                                                            var infowindow = new kakao.maps.InfoWindow({
                                                                content: '<div style="width:150px;text-align:center;padding:6px 0;">만남의 장소</div>'
                                                            });
                                                            infowindow.open(map, marker);
                                                    
                                                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                                            map.setCenter(coords);
                                                        } 
                                                    });    
                                                    </script>
                                </td>
                                </tr>
                
                        
                                </tr>
                               
                        </table>

                    

                        <table width="570px" align="left"  >
                            <br>
                                <tr>
                                    <td>
                                        <b>이미 진행된 정모</b>

                                        <!-- 작성자가 모임장일 경우 뜨는 버튼-->
                                        <button type="submit" class="" style="float: right;" >삭제하기</button>
                                    </td>
                                </tr>
                               
                        </table>
                    
                        <br>
                        <table width="580px" border="1" align="left">
                            <br>
                            <td height="180">
                                <table width="570px">
                                    <tr>
                                        <td style="height:5px">날짜 : </td>
                                    </tr>
                                    <tr>
                                        <td style="height:40px">장소 : </td>
                                    </tr>
                                    <tr>
                                        <td style="height:100px">
                                            참여자프로필아이콘
                                            <!--토글튜토리얼 갖다대면 닉네임보이게-->
                                            data-toggle="tooltip" title="회원닉네임" 
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </table> 
                      
                      

                        <table width="580px" border="1" align="left">
                            <td height="180">
                                <table width="570px">
                                    <tr>
                                        <td style="height:5px">날짜 : </td>
                                    </tr>
                                    <tr>
                                        <td style="height:40px">장소 : </td>
                                    </tr>
                                    <tr>
                                        <td style="height:100px">
                                            참여자프로필아이콘
                                            <!--토글튜토리얼 갖다대면 닉네임보이게-->
                                            data-toggle="tooltip" title="회원닉네임" 
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </table> 

                        
                

                    </div>
                    <br>

                    <div class="attandGroup">
                            <table width="750px" align="center">
                                <tr>
                                    <td>날짜</td>
                                    <td colspan="2">시간</td>
                                </tr>
                                <tr>
                                    <td>장소 </td> 
                                    <td align="right">가격</td>
                                    <td width="200">
                                        <button style="float: right; border-color: black; background-color: white; border-radius: 10px;" >취소하기</button>
                                        <button style="float: right;  border-color: rgb(236, 87, 59); background-color: white; border-radius: 10px;" >참여하기</button>
                                    </td> 
                                </tr>
                                <br>
                            </table>
                    </div>

                    <br><br>

                </div>
            </div>        
      


         
            
        

         <!--푸터바 입력-->
         <jsp:include page=""/>  


    </body>

</html>