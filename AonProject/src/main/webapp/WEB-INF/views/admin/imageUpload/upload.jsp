<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript" src="/resources/include/js/jquery.form.js"></script>
<script>
  $(function() {
	  $("#insertBtn1").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm1").submit();
	  });
	  
	  $("#insertBtn2").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm2").submit();
	  });
	  
	  $("#insertBtn3").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm3").submit();
	  });
	  
	  $("#insertBtn4").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm4").submit();
	  });
	  
	  $("#insertBtn5").click(function() {
		  $("#detailForm").attr({
			  "method":"post",
			  "action":"/admin/upload/ImageUploadInsert"
		  });
		  $("#detailForm5").submit();
	  });
	  
  });
</script>

<!-- page content -->
        <input type="hidden" name="img_id" value="${imageUploadList.mp_no}">
        
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>메인 이미지 관리</h3>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
              
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>메인 이미지 관리 <small>화면관리 > 메인 이미지 관리</small></h2>
                    
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!-- <form class="form-horizontal form-label-left"> -->
                    <div class="btnContainer">
	                <form id="detailForm1" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-sm-2 control-label">이미지 1</label>
                        <div class="col-sm-9">
                          <input type="file" id = "files" name="files"><br />
                          <div class="input-group">
                            <span class="input-group-btn">
                               <input type="button" id="insertBtn1" name="insertBtn1" value="등록" class="btn btn-success">
                               <input type="button" id="deleteBtn1" name="deleteBtn1" value="삭제" class="btn btn-danger">
                            </span>
                          </div>        
                        </div>
                        <img src="#">
                      </div>
                    </form>
                    <form id="detailForm2" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-sm-2 control-label">이미지 2</label>
                        <div class="col-sm-9">
                          <input type="file" id = "files" name="files"><br />
                          <div class="input-group">
                            <span class="input-group-btn">
                               <input type="button" id="insertBtn2" name="insertBtn2" value="등록" class="btn btn-success">
                               <input type="button" id="deleteBtn2" name="deleteBtn2" value="삭제" class="btn btn-danger">
                            </span>
                          </div>        
                        </div>
                        <img src="#">
                      </div>
                    </form>
                    <form id="detailForm3" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-sm-2 control-label">이미지 3</label>
                        <div class="col-sm-9">
                          <input type="file" id = "files" name="files"><br />
                          <div class="input-group">
                            <span class="input-group-btn">
                               <input type="button" id="insertBtn3" name="insertBtn3" value="등록" class="btn btn-success">
                               <input type="button" id="deleteBtn3" name="deleteBtn3" value="삭제" class="btn btn-danger">
                            </span>
                          </div>        
                        </div>
                        <img src="#">
                      </div>
                    </form>
                    <form id="detailForm4" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-sm-2 control-label">이미지 4</label>
                        <div class="col-sm-9">
                          <input type="file" id = "files" name="files"><br />
                          <div class="input-group">
                            <span class="input-group-btn">
                               <input type="button" id="insertBtn4" name="insertBtn4" value="등록" class="btn btn-success">
                               <input type="button" id="deleteBtn4" name="deleteBtn4" value="삭제" class="btn btn-danger">
                            </span>
                          </div>        
                        </div>
                        <img src="#">
                      </div>
                    </form>
                    <form id="detailForm5" enctype="multipart/form-data">
                      <div class="form-group">
                        <label class="col-sm-2 control-label">이미지 5</label>
                        <div class="col-sm-9">
                          <input type="file" id = "files" name="files"><br />
                          <div class="input-group">
                            <span class="input-group-btn">
                               <input type="button" id="insertBtn5" name="insertBtn5" value="등록" class="btn btn-success">
                               <input type="button" id="deleteBtn5" name="deleteBtn5" value="삭제" class="btn btn-danger">
                            </span>
                          </div>        
                        </div>
                        <img src="#">
                      </div>
                    </form>
                    </div>
                    <!-- </form> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->