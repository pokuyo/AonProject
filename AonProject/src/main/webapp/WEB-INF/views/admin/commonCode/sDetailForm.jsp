<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<form id="sDetailForm">
		<table>
			<tbody>
				<c:choose>
                    <c:when test="${not empty sCommonCodeList }">
                      <c:forEach var="sCommonCodeList" items="${sCommonCodeList }" >
                        <tr class="tac" data-num="${sCommonCodeList.cc_no }">
                          
                          <td>${sCommonCodeList.cc_no }</td>
                          <td class="sName">${sCommonCodeList.cc_name}</td>
                          <td class="sGroup">${sCommonCodeList.cc_group }</td>
                          <td class="sDesc">${sCommonCodeList.cc_desc }</td>
                          <td class="sDate">${sCommonCodeList.cc_date }</td>
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
		
		
		<h2>사이즈 등록</h2>
		<div class="btnContainer"><br />
		코드내용 : <input type="text" placeholder="예)S" required="required" id="cc_name" name="cc_name" /><br />
		코드구분 : <input type="text" required="required" id="cc_group" name="cc_group" /><br />
		코드설명 : <input type="text" required="required" id="cc_desc" name="cc_desc" /><br />
		</div>
        <input type="button" id="sizeInsert" value="사이즈등록">
        
</form>