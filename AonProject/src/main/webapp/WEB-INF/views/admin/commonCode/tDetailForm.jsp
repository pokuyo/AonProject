<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">

  $(function() {
	  $("#typeInsert").click(function() {
		  if(!chkSubmit($("#cc_name"),"코드 내용을"))return;
		  else if(!chkSubmit($("#cc_group"),"코드 구분을"))return;
		  else if(!chkSubmit($("#cc_desc"),"코드 설명을"))return;
		  $("#tDetailForm").attr({
			  "method":"post",
			  "action":"/admin/tCommonCodeInsert"
		  });
		  $("#tDetailForm").submit();
	  });
	  
  });
</script>
<style type="text/css">
table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
    margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    text-align: center;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
h2 {
  font-size: large;
  color: black;
  font-weight: bold;
}
p {
  font-size: small;
  color: black;
  font-weight: bold;
}
</style>
    <h2>타입 목록</h2>
    <form id="tDetailForm">
		<table class="type03">
		    <thead>
		      <tr>
		        <th>타입 번호</th>
		        <th>타입 내용</th>
		        <th>타입 구분</th>
		        <th>타입 설명</th>
		        <th>타입 등록일</th>
		      </tr>
		    </thead>
			<tbody>
				<c:choose>
                    <c:when test="${not empty tCommonCodeList }">
                      <c:forEach var="tCommonCodeList" items="${tCommonCodeList }" >
                        <tr class="tac" data-num="${tCommonCodeList.cc_no }">
                                  
                          <td align="center">${tCommonCodeList.cc_no }</td>
                          <td class="tName" align="center">${tCommonCodeList.cc_name}</td>
                          <td class="tGroup" align="center">${tCommonCodeList.cc_group }</td>
                          <td class="tDesc" align="center">${tCommonCodeList.cc_desc }</td>
                          <td class="tDate" align="center">${tCommonCodeList.cc_date }</td>
                        </tr>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <tr>
                        <td colspan="4" class="tac">등록된 게시물이 존재하지 않습니다.</td>
                      </tr>
                    </c:otherwise>
                </c:choose>
			</tbody>
		</table><br />
		
		
		<h2>타입 등록</h2>
		<div class="btnContainer"><br />
		<p>타입내용 : <input type="text" required="required" id="cc_name" name="cc_name" /></p>
		<p>타입구분 : <input type="text" required="required" id="cc_group" name="cc_group" /></p>
		<p>타입설명 : <input type="text" required="required" id="cc_desc" name="cc_desc" /></p>
		</div>
        <input type="button" id="typeInsert" value="타입등록" class="btn btn-success">
        
</form>