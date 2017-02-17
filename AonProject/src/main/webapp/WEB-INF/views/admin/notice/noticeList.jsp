<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<style type="text/css">
#insertFormBtn{float: right;}
</style>

<script>
  $(function() {
	  $("#checked-all").click(function() {
		  $(".checkedRecord").attr('checked', 'checked');
	  });
	  
	  $("#insertFormBtn").click(function() {
		  location.href = "/admin/notice/writeForm";
	  });
	  
	  //글 상세페이지로 이동
	  $(".goDetail").click(function(){
		  var no_num = $(this).parents("tr").attr("data-num");
		  $("#no_num").val(no_num);
		  console.log("글번호 : " + no_num);
		  $("#detailForm").attr({
			  "method":"get",
			  "action":"detailForm"
		  });
		  $("#detailForm").submit();
	  });
	});
</script>
<form id="detailForm">
 <input type="hidden" id="no_num" name="no_num" value="">
</form>
        
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>공지사항</h3>
              </div>
            </div>
            
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>공지사항관리 <small>게시판관리 > 공지사항관리</small></h2>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">

                    <div class="table-responsive">
                      <table class="table table-striped jambo_table bulk_action">
                        <thead>
                          <tr class="headings">
                            <th>
                              <!-- <input type="checkbox" id="check-all" class="flat"> -->
                              <input type="checkbox" id="checked-all">
                            </th>
                            <th class="column-title">글번호
                              <c:choose>
                                <c:when test="${data.order_by=='no_num' and data.order_sc=='ASC'}">▲</c:when>
                                <c:when test="${data.order_by=='no_num' and data.order_sc=='DESC'}">▼</c:when>
                                <c:otherwise>▲</c:otherwise>
                              </c:choose>
                            </th>
                            <th class="column-title">글제목 </th>
                            <th class="column-title">작성일
                              <c:choose>
                                <c:when test="${data.order_by=='no_date' and data.order_sc=='ASC'}">▲</c:when>
                                <c:when test="${data.order_by=='no_date' and data.order_sc=='DESC'}">▼</c:when>
                                <c:otherwise>▲</c:otherwise>
                              </c:choose>
                            </th>
                            <th class="column-title">작성자 </th>
                          </tr>
                        </thead>

                        <tbody id = "list">
                          <tr class="even pointer">
                           
                            <c:choose>
                              <c:when test="${not empty noticeList }">
                                <c:forEach var="noticeList" items="${noticeList }" >
                                  <tr class="tac" data-num="${noticeList.no_num }">
                                  
                                    <td class="a-center ">
                                       <input type="checkbox" class="checkedRecord" name="table_records">
                                    </td>
                                    <td class="goDetail">${noticeList.no_num }</td>
                                    <td class="goDetail">${noticeList.no_title}</td>
                                    <td class="goDetail">${noticeList.no_date }</td>
                                    <td class="goDetail">${noticeList.a_no }</td>
                                  </tr>
                                </c:forEach>
                              </c:when>
                              <c:otherwise>
                                <tr>
                                  <td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
                                </tr>
                              </c:otherwise>
                            </c:choose>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div>
              <input type="button" id="insertFormBtn" name="insertFormBtn" value="글쓰기" class="btn btn-primary">
            </div>
           </div>
           