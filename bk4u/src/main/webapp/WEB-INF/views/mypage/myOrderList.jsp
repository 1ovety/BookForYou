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
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link rel='stylesheet' href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css'>
    <link rel='stylesheet' href='https://puertokhalid.com/up/demos/puerto-Mega_Menu/css/normalize.css'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="resources\mypage\css\side-style.css">
    <style>
        .wrap {
            width: 1200px;
            height: 1200px;
            margin: auto;
        }

        .wrap>div {
            width: 100%;
        }

        #content {
            background: #EEE;
            height: 100%;
            position: relative;
            display: inline-flex;
        }

        #main_content {
            margin-left: 60px;
            margin-top: 50px;
            margin-right: 60px;
            width: 100%;
            height: 900px;
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

        #state-of-order {
            height: 30px;
            margin-top: 15px;
        }

        #state-of-order li {
            list-style-type: none;
            float: left;
            margin-left: 20px;
            text-decoration: none;
            font-size: large;
            font-weight: bold;
        }

        #state-of-order li a {
            color: rgb(189, 185, 185);
            text-decoration-line: none;
        }

        #date-box {
            width: 95%;
            margin-top: 30px;
            display: inline-flex;
            margin-left: 20px;
            height: 30px;
        }

        #date-input-box {
            display: inline-flex;
            margin-left: 10px;
        }

        #date-button-box {
            width: 300px;
        }

        #state-select-box {
            margin-left: 20px;
            width: 100px;
        }

        #order-list-box {
            width: 95%;
            margin-top: 40px;
            margin-left: auto;
            margin-right: auto;
            height: 480px;
        }
        #book-title{
            width: 40%;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        #order-list-box table tr{
            text-align: center;
            cursor: pointer;
        }
        #paging-wrap{width:fit-content; margin:auto; margin-top: 30px;}
        .page-link, .page-link:hover{color:rgb(252, 190, 52);}
    </style>
</head>

<body>
    <div class="wrap">
        <div id="content">
            <!-- partial:index.partial.html -->
            <div class="container">
                <nav>
                    <ul class="mcd-menu">
                        <li>
                            <a href="" class="active">
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
                            <a href="">
                                <i class="fa fa-user" class="active"></i>
                                <strong>개인정보 수정</strong>
                                <small>개인정보를 수정합니다.</small>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- partial -->
            <div id="main_content">
                <div id="head-of-main-content">
                    주문내역 조회
                </div>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <ul id="state-of-order">
                    <li><a href="">입금/결제</a></li>
                    <li><a href="">배송중</a></li>
                    <li><a href="">배송완료</a></li>
                    <li><a href="">반품</a></li>
                </ul>
                <hr style="text-align: center; width: 95%; margin: auto; color:black;">
                <div id="date-box">
                    <div class="btn-group btn-group-sm" id="date-button-box" role="group"
                        aria-label="Basic radio toggle button group">
                        <button type="button" id="btnWeek" class="btn btn-outline-secondary">1주일</button>
                        <button type="button" id="btnMonth" class="btn btn-outline-secondary">1개월</button>
                        <button type="button" id="btn3Month" class="btn btn-outline-secondary">3개월</button>
                    </div>

                    <div id="date-input-box">
                        <input type="text" id="beginDate" class="form-control">
                    </div>
                    <div id="date-input-box">
                        <input type="text" id="endDate" class="form-control">
                    </div>
                    <select class="form-select form-select-sm" id="state-select-box"
                        aria-label=".form-select-sm example" style="margin-right: 10px;">
                        <option value="1" selected>전체</option>
                        <option value="2">입금/결제</option>
                        <option value="3">배송중</option>
                        <option value="4">배송완료</option>
                        <option value="5">반품</option>
                    </select>
                    <button type="button" class="btn btn-dark btn-sm" style="width:50px">조회</button>
                    <script>

                        // 시작 일자 달력 이미지 클릭시 달력 표기 
                        $('#beginDate').datepicker({
                            showOn: "button",
                            buttonImage: "../images/calendar1.png",
                            buttonImageOnly: true,
                            buttonText: "Select date"
                        });
                        $('#beginDate').datepicker('option', 'dateFormat', 'yy-mm-dd'); // 기존 dd/mm/yy에서 yy-mm-dd로 format 변경    

                        // 종료 일자 달력 이미지 클릭시 달력 표기    
                        $('#endDate').datepicker({
                            showOn: "button",
                            buttonImage: "../images/calendar1.png",
                            buttonImageOnly: true,
                            buttonText: "Select date"
                        });
                        $('#endDate').datepicker('option', 'dateFormat', 'yy-mm-dd');

                        let d = new Date();
                        let year = d.getFullYear();
                        let month = d.getMonth() + 1; // 월은 0에서 시작하기 때문에 +1
                        let day = d.getDate();
                        $('#beginDate').val(`${year}-${month}-${day}`);
                        $('#endDate').val(`${year}-${month}-${day}`);

                        // 버튼 클릭시 현재 날짜에서 1주일, 1개월, 3개월 더하기
                        let beginDate = d;
                        $('#btnWeek').click(function () {
                            $('#endDate').val(`${year}-${month}-${day}`);
                            beginDate.setDate(beginDate.getDate() - 7);
                            $('#beginDate').val(`${beginDate.getFullYear()}-${beginDate.getMonth() + 1}-${beginDate.getDate()}`);
                            beginDate.setDate(beginDate.getDate() + 7); // 버튼 클릭 시 계속 더해지기 때문에 초기화
                        });

                        $('#btnMonth').click(function () {
                            $('#endDate').val(`${year}-${month}-${day}`);
                            beginDate.setMonth(beginDate.getMonth() - 1);
                            $('#beginDate').val(`${beginDate.getFullYear()}-${beginDate.getMonth() + 1}-${beginDate.getDate()}`);
                            beginDate.setMonth(beginDate.getMonth() + 1);
                        });

                        $('#btn3Month').click(function () {
                            $('#endDate').val(`${year}-${month}-${day}`);
                            beginDate.setMonth(beginDate.getMonth() - 3);
                            $('#beginDate').val(`${beginDate.getFullYear()}-${beginDate.getMonth() + 1}-${beginDate.getDate()}`);
                            beginDate.setMonth(beginDate.getMonth() + 3);
                        });
                    </script>
                </div>
                <div id="order-list-box">
                    <table class="table table-hover" style="table-layout:fixed">
                        <thead class="table-light">
                            <tr>
                                <th scope="col" style="width: 10%;">주문번호</th>
                                <th scope="col">주문일자</th>
                                <th scope="col" id="book-title">상품이름</th>
                                <th scope="col">주문금액</th>
                                <th scope="col">주문상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <th scope="row">4</th>
                                <td>2021.07.21</td>
                                <td id="book-title">[도서]코드로 배우는 스프링 부트 웹 프로젝트 : 현업 개발을 위한 단계별 실습서 [동영상 강의 제공]</td>
                                <td>30600</td>
                                <td>배송완료</td>
                            </tr
                        </tbody>
                    </table>

                </div>
                <div id="paging-wrap">
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link">이전</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">1</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">2</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">3</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">4</a></li>
                        <li class="page-item"><a class="page-link" href="list.bo?currentPage=${ p }">5</a></li>
                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</body>

</html>