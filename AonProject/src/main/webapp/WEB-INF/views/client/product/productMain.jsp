<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	.item {width:300px; float:left; margin:2em;}
	.item > a {width: 260px; height: 270px; overflow: hidden; display: block; margin: 0 auto;}
	.item > a > img {width:260px; margin:10px auto; display:block;}
	.content ul {text-align:center; margin:1em 0;}
	.content ul li {line-height:1.2rem;}
</style>


<div class="menuTit">
	<c:choose>
		<c:when test="${not empty categorySelect}">
			<c:forEach var="categorySelect" items="${categorySelect}">
				<p>${categorySelect.ca_name}</p>
			</c:forEach>		
		</c:when>
	</c:choose>
  <%-- <p>${categorySelect.ca_name}</p> --%>
</div>
<div class="content">
	<c:choose>
		<c:when test="${not empty productForCategory}">
			<c:forEach items="${productForCategory}" varStatus="status">
				<div class="item" data-num="${productForCategory[status.index].p_no}">
					<a href="/detail?no=${fn:substring(productForCategory[status.index].p_no,0,7)}">
						<img src="${productForCategory[status.index].pi_route}/${productForCategory[status.index].pi_file}" />
					</a>
					<ul>
						<li class="bold">[AON PROJECT]</li>
						<li class="bold">${productForCategory[status.index].p_name}</li>
						<%-- <li>${productForCategory[status.index].p_info}</li> --%>
						<li>CONSUMER PRICE: ${productForCategory[status.index].p_price}</li>
					</ul>
				</div>
			</c:forEach>
		</c:when>
	</c:choose>
	<%-- <table>
		<tr>
			<td colspan="8" id = "pageLow">
				<c:if test = "${productForCategory.totalPage < productForCategory.pageNum }">
					<c:set var = "pNum" value= "${productVO.totalPage }"/>
				</c:if>
				<c:if test = "${productForCategory.totalPage >= productForCategory.pageNum }">
					<c:set var = "pNum" value= "${productForCategory.pageNum }"/>
				</c:if>
			
				<c:if test = "${productForCategory.pageTotal[0] eq 1 and pNum eq 1}" >
					<span class = "icon-angle-double-left"></span>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[0] eq 1 and pNum ne 1}" >
					<a href = "/admin/policyAgr?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[0] ne 1}" >
					<a href = "/admin/policyAgr?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[0] eq 1}" >
					<span class = "icon-angle-left"></span>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[0] ne 1}" >
					<a href = "/admin/policyAgr?pageNum=${productForCategory.pageTotal[0] - fn:length(productForCategory.pageTotal) }" data-num = "${productForCategory.pageTotal[0] - fn:length(productForCategory.pageTotal) }" class = "icon-angle-left"></a>
				</c:if>
	
				<c:forEach items="${productForCategory.pageTotal }" varStatus="status">
					<c:if test = "${productForCategory.pageTotal[status.index] eq pNum}" >
						<span>${productForCategory.pageTotal[status.index] }</span>
					</c:if>
					<c:if test = "${productForCategory.pageTotal[status.index] ne pNum}" >
						<a href = "/admin/policyAgr?pageNum=${productForCategory.pageTotal[status.index] }" data-num = "${productForCategory.pageTotal[status.index]}">
	 						${productForCategory.pageTotal[status.index] } 
						</a>
					</c:if>
				</c:forEach>
	
				<c:if test = "${productForCategory.pageTotal[fn:length(productForCategory.pageTotal) - 1] eq productForCategory.totalPage}" >
					<span class = "icon-angle-right"></span>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[fn:length(adminVO.pageTotal) - 1] ne productForCategory.totalPage}" >
					<a href = "/admin/policyAgr?pageNum=${productForCategory.pageTotal[0] + fn:length(productForCategory.pageTotal) }" data-num = "${productForCategory.pageTotal[0] + fn:length(productForCategory.pageTotal) }" class = "icon-angle-right"></a>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[fn:length(productForCategory.pageTotal) - 1] eq productForCategory.totalPage and productForCategory.totalPage eq pNum}" >
					<span class = "icon-angle-double-right"></span>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[fn:length(adminVO.pageTotal) - 1] eq productForCategory.totalPage and productForCategory.totalPage ne pNum}" >
					<a href = "/admin/policyAgr?pageNum=${productForCategory.totalPage }" data-num = "${productForCategory.totalPage }" class = "icon-angle-double-right"></a>
				</c:if>
				<c:if test = "${productForCategory.pageTotal[fn:length(adminVO.pageTotal) - 1] ne productForCategory.totalPage}" >
					<a href = "/admin/policyAgr?pageNum=${productForCategory.totalPage }" data-num = "${productForCategory.totalPage }" class = "icon-angle-double-right"></a>
				</c:if>
			</td>
		</tr>
	</table> --%>
</div>
