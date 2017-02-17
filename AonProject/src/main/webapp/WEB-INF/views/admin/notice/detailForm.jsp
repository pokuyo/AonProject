<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
<link rel="shortcut icon" href="../image/icon.png" />
<link rel="apple-touch-icon" href="../image/icon.png" />
<!--IE8이하 적용/--> 
<!--[if lt IE 9]>
   <script src="./js/html5shiv.js"></script>
<![endif]--> 
<title>Insert title here</title>

        <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
		
			var butChk = 0;//수정버튼과 삭제버튼을 구별하기 위한 변수
			$(function(){
				/*수정 버튼 클릭시*/
				$("#updateBtn").click(function(){
					if(!chkSubmit($("#no_title"),"제목을"))return;
					else if(!chkSubmit($("#no_content"),"내용을"))return;
					$("#f_writeForm").attr({
						"method":"post",
						"action":"/admin/noticeUpdate"
					});
					$("#f_writeForm").submit();
				});
				
				/*삭제 버튼 클릭시*/
				$("#deleteBtn").click(function(){
					$("#getNo").attr({
						"method" : "post",
						"action" : "/admin/noticeDelete"
					});
					$("#getNo").submit();
				});
				
				/*취소 버튼 클릭시*/
				$("#cancelBtn").click(function(){
					location.href="/admin/noticeList";
				});
			});
			
		</script>

</head>
<body>
    <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>공지사항</h3>
              </div>

            </div>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>공지사항 작성 <small></small></h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                  <form id="getNo" name="getNo">
                    <input type="hidden" name="no_num" value="${detail.no_num}">
                  </form>
                    <form class="form-horizontal form-label-left" novalidate id="f_writeForm" name="f_writeForm" enctype="multipart/form-data">
						<input type="hidden" name="no_num" value="${detail.no_num}"> 
                        <span class="section"></span>
                      
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="telephone">제목 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" value="${detail.no_title}" name="no_title" id="no_title" required="required" data-validate-length-range="8,20" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">내용 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="no_content" required="required" name="no_content" class="form-control col-md-7 col-xs-12">${detail.no_content}</textarea>
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <input type="button" id="updateBtn" name="updateBtn" value="수정" class="btn btn-success">
                          <input type="button" id="cancelBtn" name="cancelBtn" value="취소" class="btn btn-info">
					      <input type="button" id="deleteBtn" name="deleteBtn" value="삭제" class="btn btn-danger">
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->
</body>
</html>