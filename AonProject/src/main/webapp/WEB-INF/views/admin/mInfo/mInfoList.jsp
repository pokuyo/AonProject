<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset=UTF-8>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>A O N !</title>
	
	
	<link rel="stylesheet" href="/resources/include/css/reset.css">
<!-- Bootstrap --->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/resources/bootstrap/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/resources/bootstrap/css/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="/resources/bootstrap/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="/resources/bootstrap/css/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="/resources/bootstrap/css/daterangepicker.css" rel="stylesheet">
    <!-- Font awesome -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom Theme Style -->
    <link href="/resources/bootstrap/css/custom.min.css" rel="stylesheet">
  
    <!-- Bootstrap -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/bootstrap/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/resources/bootstrap/css/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/resources/bootstrap/css/green.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="/resources/bootstrap/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="/resources/bootstrap/css/scroller.bootstrap.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/resources/bootstrap/css/custom.min.css" rel="stylesheet">
    
    <style type = "text/css">
    	.chartView{
    		display : inline-block;
    		position : relative;
    		left : 50%;
    		transform : translateX(-50%);
    		clear: both;
 			font: left;
    	}
    	.chartView > div{
    		display: inline-block;
    	}
    	.chartView > div:LAST-CHILD {
    		margin-left: 20px;
		}
		.dateSelect{
			text-align: center;
		}
		.dateSelect input{
			font-size: 21px;
			margin : 20px 0;
		}
		.imgErrorCss{
			display: inline-block;
			width: 720px;
			font-size: 30px;
			text-align: center;
			font-weight: bold;
		}
    </style>
</head>
<form id="mDetailForm">
 <input type="hidden" id="m_no" name="m_no" value="">
</form>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>A O N !</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- sidebar menu -->
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
        
            <div class="clearfix"></div>
  
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <p>&nbsp;</p>
                <h3>Menu</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-gift"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/product">상품관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> 주문관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="orderlist" id="orderlist">주문내역</a></li>
                      <li><a class="orderPaymentList" id="orderPaymentList">결제관리</a></li>
                      <li><a class="RefundList" id="RefundList">환불관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mInfo" id="mInfo">회원조회</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-address-book-o" aria-hidden="true"></i> 약관관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/policy">약관목록</a></li>
                      <li><a href="/admin/policyAgr">약관여부</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> 재고관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="main" id="main">재고관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bug"></i> 게시판관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="notice" id="notice">공지사항관리</a></li>
                      <li><a class="reviewList" id="reviewList">후기관리</a></li>
                      <li><a class="commentQnAList" id="commentQnAList">문의관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 공통코드관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="size" id="size">사이즈관리</a></li>
                      <li><a class="color" id="color">색상관리</a></li>
                      <li><a class="type" id="type">상품타입관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 화면 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a class="mImage" id="mImage">메인 이미지 관리</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> 카테고리관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="/admin/category">카테고리관리</a></li>
                    </ul>
                  </li>                  
                </ul>
              </div>
            </div>
          </div>
        </div>
            <!-- /sidebar menu -->

          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    ${vo.a_id }님
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="/admin/myPage">Profile</a></li>
                    <li><a href="/admin/joinForm">Register</a></li>
                    <li><a href="/admin/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
          	<div class = "chartView">
          		<div class = "mGender">
          			<img src = "/chart/memberSexDistribution.jpg" />
          		</div>
          		<div class = "mCount">
          			<img id="mCountView" />
          		</div>
          	</div>
          	<div class = "dateSelect"><input type="date" id = "kia" name = "kia" /></div>
            <script src = "/resources/include/js/jquery-1.12.4.min.js"></script>
          		<script type = "text/javascript">
          			$(document).ready(function(){
          				document.getElementById('kia').valueAsDate = new Date();	
          				$("#mCountView").attr("src", "/chart/memberCount"+$("#kia").val()+".jpg");
          				$("#kia").blur(function(){
          					$("#imgError").remove();
          					$("#mCountView").attr("src", "/chart/memberCount"+$("#kia").val()+".jpg");
          					$("#mCountView").show();
          					$("#mCountView").error(function() {
          						$("#mCountView").hide();
          				       $(".mCount").append("<span id = 'imgError'>자료가 존재하지 않습니다.</span");
          				       $("#imgError").addClass("imgErrorCss");
          				   	});
          				});
          			});
          		</script>
            <div class="page-title">
              <div class="title_left">
                <h3>회원관리</h3>
              </div>

              
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원조회 <small>회원관리>회원조회</small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <form id="getNo" name="getNo">
                    <input type="hidden" name="m_no" value="${mInfo.m_no}">
                  </form>
                  <form id="mInfoList">
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                          <th>회원번호</th>
                          <th>아이디</th>
                          <th>이름</th>
                          <th>성별</th>
                          <th>전화번호</th>
                          <th>이메일</th>
                          <th>주소</th>
                        </tr>
                      </thead>
                      <tbody id = "list">
                             
                            <c:choose>
                              <c:when test="${not empty mInfoList }">
                                <c:forEach var="mInfo" items="${mInfoList }" >
                                  <tr class="tac" data-num="${mInfo.m_no }">
                                  
                                    <td class="goMDetail">${mInfo.m_no }</td>
                                    <td class="goMDetail">${mInfo.m_id}</td>
                                    <td class="goMDetail">${mInfo.m_name }</td>
                                    <c:forEach items="${mInfo.m_gender }">
									  <c:if test="${mInfo.m_gender == 'm' }">
									    <td class="goMDetail">남자</td>
									  </c:if>
									  <c:if test="${mInfo.m_gender == 'f' }">
										<td class="goMDetail">여자</td>
									  </c:if>
								    </c:forEach>
                                    <td class="goMDetail">${mInfo.m_tel }</td>
                                    <td class="goMDetail">${mInfo.m_email }</td>
                                    <td class="goMDetail">${mInfo.m_addr }</td>
                                  </tr>
                                </c:forEach>
                              </c:when>
                              <c:otherwise>
                                <tr>
                                  <td colspan="7" class="tac">등록된 게시물이 존재하지 않습니다.</td>
                                </tr>
                              </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                    </form>
                  </div>
                </div>
              </div>
                    </div>
                  </div>
                </div>
              
        <!-- /page content -->

        
      </div>
    </div>

    <!-- jQuery -->
    <script src="/resources/bootstrap/js/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="/resources/bootstrap/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="/resources/bootstrap/js/fastclick.js"></script>
    <!-- NProgress -->
    <script src="/resources/bootstrap/js/nprogress.js"></script>
    <!-- iCheck -->
    <script src="/resources/bootstrap/js/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="/resources/bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="/resources/bootstrap/js/dataTables.bootstrap.min.js"></script>
    <script src="/resources/bootstrap/js/dataTables.buttons.min.js"></script>
    <script src="/resources/bootstrap/js/buttons.bootstrap.min.js"></script>
    <script src="/resources/bootstrap/js/buttons.flash.min.js"></script>
    <script src="/resources/bootstrap/js/buttons.html5.min.js"></script>
    <script src="/resources/bootstrap/js/buttons.print.min.js"></script>
    <script src="/resources/bootstrap/js/dataTables.fixedHeader.min.js"></script>
    <script src="/resources/bootstrap/js/dataTables.keyTable.min.js"></script>
    <script src="/resources/bootstrap/js/dataTables.responsive.min.js"></script>
    <script src="/resources/bootstrap/js/responsive.bootstrap.js"></script>
    <script src="/resources/bootstrap/js/dataTables.scroller.min.js"></script>
    <script src="/resources/bootstrap/js/jszip.min.js"></script>
    <script src="/resources/bootstrap/js/pdfmake.min.js"></script>
    <script src="/resources/bootstrap/js/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="/resources/bootstrap/js/custom.min.js"></script>
    
    <!-- Skycons -->
    <script src="/resources/bootstrap/js/skycons.js"></script>
    <!-- Flot -->
    <script src="/resources/bootstrap/js/jquery.flot.js"></script>
    <script src="/resources/bootstrap/js/jquery.flot.pie.js"></script>
    <script src="/resources/bootstrap/js/jquery.flot.time.js"></script>
    <script src="/resources/bootstrap/js/jquery.flot.stack.js"></script>
    <script src="/resources/bootstrap/js/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="/resources/bootstrap/js/jquery.flot.orderBars.js"></script>
    <script src="/resources/bootstrap/js/jquery.flot.spline.min.js"></script>
    <script src="/resources/bootstrap/js/curvedLines.js"></script>
    
    <!-- JQVMap -->
    <script src="/resources/bootstrap/js/jquery.vmap.sampledata.js"></script>
    
    <!-- bootstrap-daterangepicker -->
    <script src="/resources/bootstrap/js/moment.min.js"></script>
    <script src="/resources/bootstrap/js/daterangepicker.js"></script>



    <!-- Datatables -->
    <script>
    $(function() {
		  // 회원조회 클릭 시
		  $(".mInfo").click(function() {
			  location.href = "/admin/mInfoList";
		  });
		  
		  $(".commentQnAList").click(function() {
			  location.href = "/admin/commentQnA/commentQnAList";
		  });
		  
		  $(".reviewList").click(function() {
			  location.href = "/admin/reviewList";
		  });
		  
		  $(".main").click(function() {
			  location.href = "/admin/stockList";
		  });
		  
		  $(".orderlist").click(function() {
			  location.href = "/admin/order/orderList";
		  });
		  
		  $(".orderPaymentList").click(function() {
			  location.href = "/admin/order/orderPaymentList";
		  });
		  
		  $(".RefundList").click(function() {
			  location.href = "/admin/order/orderRefundList";
		  });
		  
		  $(".notice").click(function() {
			  location.href = "/admin/noticeList";
		  });
		  
		  $(".mImage").click(function() {
			  location.href = "/admin/imageUploadList";
		  });
		  
		  $(".size").click(function() {
			  location.href = "/admin/sCommonCodeList";
		  });
		  
		  $(".color").click(function() {
			  location.href = "/admin/cCommonCodeList";
		  });
		  
		  $(".type").click(function() {
			  location.href = "/admin/tCommonCodeList";
		  });
		  
		  // 회원 정보 상세페이지로 이동
		  $(".goMDetail").click(function(){
			  var m_no = $(this).parents("tr").attr("data-num");
			  $("#m_no").val(m_no);
			  console.log("글번호 : " + m_no);
			  $("#mDetailForm").attr({
				  "method":"get",
				  "action":"mDetailForm"
			  });
			  $("#mDetailForm").submit();
		  });
	  });
		  
      $(document).ready(function() {
        var handleDataTableButtons = function() {
          if ($("#datatable-buttons").length) {
            $("#datatable-buttons").DataTable({
              dom: "Bfrtip",
              buttons: [
                {
                  extend: "copy",
                  className: "btn-sm"
                },
                {
                  extend: "csv",
                  className: "btn-sm"
                },
                {
                  extend: "excel",
                  className: "btn-sm"
                },
                {
                  extend: "pdfHtml5",
                  className: "btn-sm"
                },
                {
                  extend: "print",
                  className: "btn-sm"
                },
              ],
              responsive: true
            });
          }
        };

        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons();
            }
          };
        }();

        $('#datatable').dataTable();

        $('#datatable-keytable').DataTable({
          keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
          ajax: "js/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });

        $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });

        var $datatable = $('#datatable-checkbox');

        $datatable.dataTable({
          'order': [[ 1, 'asc' ]],
          'columnDefs': [
            { orderable: false, targets: [0] }
          ]
        });
        $datatable.on('draw.dt', function() {
          $('input').iCheck({
            checkboxClass: 'icheckbox_flat-green'
          });
        });

        TableManageButtons.init();
      });
    </script>
    <!-- /Datatables -->
  </body>
</html>