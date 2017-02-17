<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<link rel = "stylesheet" href = "/resources/include/fontello/css/fontello.css">
	<link rel="stylesheet" type="text/css" href="/resources/include/css/qna/reset.css">	
	<link rel="stylesheet" type="text/css" href="/resources/include/css/qna/qna.css">
	<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/resources/include/js/board.js"></script>
	<script type="text/javascript" src="/resources/include/js/chkFile.js"></script>
	<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".qna_tr2").find("td").hide();
			$(".qna_tr4").find("td").hide();
			$(".qna_tr1").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".qna_tr1").not(this).next("tr").children("td");
				
				showData.slideToggle(200);
				hideData.slideUp(200);
				reset();
				return false;
			});
			$(".qna_tr3").click(function(){
				var showData = $(this).next("tr").find("td");
				//첫번째 tr요소가 아닌 것에 다음 tr에 td
				var hideData = $(".qna_tr3").not(this).next("tr").children("td");
				
				showData.slideToggle(200);
				hideData.slideUp(200);	
				reset();
				return false;
			});
			
			//comment 쓰는 구역 숨기기
			$(".fieldset_insert").hide();
			$(".fieldset_modify").hide();
			
			//comment_insert
			$(".comment_insert").click(function(){
				$(".fieldset_insert").show();
				$(".fieldset_modify").hide();
			});
			
			//comment_insertBtn입력버튼
			$(".comment_insertBtn").click(function(){
				var commentInsertform = $(this).parents(".commentInsert_form");
				var insertTitle = $(this).parents(".comment_inner").children(".cq_title");
				//var insertPwd = $(this).parents(".comment_inner").children(".cq_pwd");
				var insertContent = $(this).parents(".comment_inner").children(".cq_content");
				if(!chkSubmit($(insertTitle),"제목을"))return;
				//else if(!chkSubmit($(insertPwd),"비밀번호를"))return;
				else if(!chkSubmit($(insertContent),"내용을"))return;
				else{
					$.ajax({
						url:"/admin/commentQnA/commentQnAInsert",
						type:"post",
						data:$(commentInsertform).serialize(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에 문의하세요.");
						},
						success:function(result){
							if(result=="success"){
								alert("입력 성공했습니다.");
								location.reload();
							}
						}
					});
				}
			});
			
			//qnacomment_modify
			$(".qnacomment_modify").click(function(){
				$(".fieldset_insert").hide();
				$(".fieldset_modify").show();
				$(".qnashowComment").hide();
			});
			
			$(".qnacomment_modifyBtn").click(function(){
				var commentModifyform = $(this).parents(".commentModify_form");
				var modifyTitle = $(this).parents(".comment_inner").children(".cq_title");
				var modifyContent = $(this).parents(".comment_inner").children(".cq_content");
				if(!chkSubmit($(modifyTitle),"제목을"))return;
				else if(!chkSubmit($(modifyContent),"내용을"))return;
				else{
					$.ajax({
						url:"/admin/commentQnA/commentQnAUpdate",
						type:"post",
						data:$(commentModifyform).serialize(),
						dataType:"text",
						error:function(){
							alert("시스템 오류입니다. 관리자에 문의하세요.");
						},
						success:function(result){
							if(result=="success"){
								alert("수정 성공했습니다.");
								location.reload();
							}
						}
					});
				}
			});
			
			//comment_incancel
			$(".comment_incancel").click(function(){
				reset();
			});
			
			//Qnacomment_mocancel
			$(".Qnacomment_mocancel").click(function(){
				$(".fieldset_modify").hide();
				$(".qnashowComment").show();
			});
			
			//delete클릭 시 삭제 이벤트
			$(".comment_qnadeleteBtn").click(function(){
				var ptr1 = $(this).parents("table").children(".qna_tr1");
				var ptr2 = $(this).parents("table").children(".qna_tr2");
				var ptr3 = $(this).parents("tr").prev(".qna_tr3"); //한단계 tr
				var ptr4 = $(this).parents("tr")//이벤트 발생 tr 
				var curry = $(this).parents("tr").attr("data-no");
				if(confirm("삭제 하시겠습니까?")) {
		            $(this).parent().click();
		        } else {
		            return false;
		        }
				$.ajax({  
					type:"delete",
					url:"/admin/commentQnA/"+curry,
					headers:{
						"Content-Type":"application/json",
						"X-HTTP-Method-Override":"DELETE"
					},
					dataType:"text",
					success:function(result){
						console.log("result="+result);
						if(result=="success"){
							alert("삭제 완료되었습니다.");
							location.reload();
						}
					}
				})
			});
		});
		
		//취소 
		function reset(){
			$(".fieldset_insert").hide();
			$(".fieldset_modify").hide();
			$(".fieldset_insert .comment_inner .cq_title").val("");
			$(".fieldset_insert .comment_inner .cq_content").val("");
		}
	</script>
<div id="qnabody">
	<div class="qna_top">
		<div class="qna_hd">
			<h1 style="font-size: 24px;margin: 9px 0;">문의관리</h1>
		</div>
	</div>
	
	<div class="qna_topBtn" style="padding: 0 5px 8px;">
		<a href="/admin/commentQnA/commentQnAList" class="all_btns">
			ALL VIEW
		</a>
	</div>
	
	<!-- 문의관리 -->
	<div class="qna-table-list">
		<table summary="QnAboard">
			<caption>일반게시판 게시글</caption>
				<colgroup>
                   <col width="60">
                   <!-- .상품정보가 있을 경우에만 나타남 -->
                   <col width="*">
                   <col width="130">
                   <col width="130">
               </colgroup>
               <thead>
               		<tr>
                       <th scope="col"><div class="tb-center">No.</div></th>
                       <!-- .상품정보가 있을 경우에만 나타남 -->
                       <th scope="col"><div class="tb-center">Content</div></th>
                       <th scope="col"><div class="tb-center">Name</div></th>
                       <th scope="col"><div class="tb-center">Date</div></th>
                   	</tr>
               </thead>
               <tbody>
               		<tr class="qna_tr">
                       <td>
                       		<div class="tb-center">
                       			<img src="/resources/include/image/qnaimage/icon_box_arrow.gif" >
                       			<img src="/resources/include/image/qnaimage/neo_notice.gif" >
                       		</div>
                       </td>
                       <!-- .상품정보가 있을 경우에만 나타남 -->
                       <td>
                          <div class="tb-center">
                               <a href="#"><font color="#000000"><b>- 비방/욕설/가격비교/홍보/영업방해/게시판과 맞지않는 글은 무통보 삭제합니다 -</b></font></a>                                                                                                                    
                     	  </div>
                       </td>
                       <td>
                           <div class="tb-center">
                               	작성자
                           </div>
                       </td>
                       <td><div class="tb-center">등록일</div></td>
                   </tr>
                   <c:choose>
                   		<c:when test="${not empty qnacommentList }">
							<c:forEach items="${qnacommentList }" var="qna">
								<tr data-num="${qna.q_no }" class="qna_tr1">
									<td>
										<div class="tb-center">${qna.q_no }
										</div>
									</td>
									<td>
										<div class="tb-center">${qna.q_title }
											<c:forEach items="${qna.q_confirm }">
												<c:if test="${qna.q_confirm==1 }">
													(<label style="color:red">문의 답변 완료</label>)
												</c:if>
												<c:if test="${qna.q_confirm==0 }">
													(<label style="color:red">답변 대기</label>)
												</c:if>
											</c:forEach>										
										</div>
									</td>
									<td><div class="tb-center">${qna.q_name }***</div></td>
									<td><div class="tb-center">${qna.q_date }</div></td>
								</tr>
								<tr class="qna_tr2">
									<td colspan="4">
										<div class="user_qnacontent">
											<div>-QnA : ${qna.q_content }</div>
											<div class="comment-insert">
												<h3>COMMENT INSERT</h3>
												<div style="padding-top: 10px;">
													<a href="javascript:;" class="comment_insert">INSERT</a>
												</div>
												<div class="fieldset_insert">
													<form class="commentInsert_form" data-num="${commentQnA.cq_no }">
														<fieldset>
															<legend>comment 입력</legend>	
															<input type="hidden" id="q_no" name="q_no" value="${qna.q_no }">
															<div class="comment_inner">
																<label>제목 : </label>
																<input type="text" class="cq_title" name="cq_title">
																<br />
																<!-- <label>비밀번호: </label>
																<input type="password" class="cq_pwd" name="cq_pwd">
																<br /> -->
																
																<label>내용 : </label>
																<textarea class="cq_content" name="cq_content"></textarea>						
																<a href="javascript:;" class="comment_insertBtn">
																	등록
																</a>
																<a href="javascript:;" class="comment_incancel">
																	취소
																</a>
															</div>
														</fieldset>
													</form>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr class="qna_tr3">
									<c:if test="${not empty commentQnAList }">
										<c:forEach items="${commentQnAList }" var="commentQnA">
											<c:if test="${qna.q_no eq commentQnA.q_no }">
												<td><div class="tb-center">
														<img src="/resources/include/image/qnaimage/neo_lock.gif" >
													</div>
												</td>
												<td><div class="tb-center"><img src="/resources/include/image/qnaimage/neo_reply.gif" >&nbsp;비밀글입니다.</div></td>
												<td><div class="tb-center">AON관리자</div></td>
												<td><div class="tb-center">${commentQnA.cq_date }</div></td>
											</c:if>
										</c:forEach>
									</c:if>
								</tr>
								<tr class="qna_tr4" data-no="${qna.q_no }">
									<td colspan="4">
										<div class="qnacomment-list">
											<h3>COMMENT LIST</h3>
											<div class="comment-cover">
												<div class="comment-content">
													<div class="content-top">
														<a href="javascript:;" class="qnacomment_modify">MODIFY</a>
														<a href="javascript:;" class="comment_qnadeleteBtn">DELETE</a>
													</div>
													<div class="fieldset_modify">
														<form class="commentModify_form">
															<fieldset>
																<legend>comment 수정</legend>	
																<c:if test="${not empty commentQnAList }">
																	<c:forEach items="${commentQnAList }" var="commentQnA">
																		<c:if test="${commentQnA.q_no eq qna.q_no}">
																			<input type="hidden" id="q_no" name="q_no" value="${qna.q_no }">
																			<input type="hidden" id="cq_no" name="cq_no" value="${commentQnA.cq_no }">
																			<div class="comment_inner">
																				<label>제목 : </label>
																				<input type="text" class="cq_title" name="cq_title" value="${commentQnA.cq_title }">
																				<br />
																				
																				<label>내용 : </label>
																				<textarea class="cq_content" name="cq_content">${commentQnA.cq_content }</textarea>						
																				<a href="javascript:;" class="qnacomment_modifyBtn">
																					수정
																				</a>
																				<a href="javascript:;" class="Qnacomment_mocancel">
																					취소
																				</a>
																			</div>
																		</c:if>
																	</c:forEach>
																	
																</c:if>
															</fieldset>
														</form>
													</div>
													<div class="qnashowComment">
														<c:if test="${not empty commentQnAList }">
															<c:forEach items="${commentQnAList }" var="commentQnA">
																<c:if test="${commentQnA.q_no eq qna.q_no}">
																	<div style="color:#BDBDBD">AON&nbsp;&nbsp;&nbsp; ${commentQnA.cq_date }</div>
																	<div class="cq_title" style="padding-top:10px;"> 
																		<label>제목 : </label>${commentQnA.cq_title }
																	</div>
																	<div class="cq_content" style="padding-top:10px;">
																		<label>내용 : </label>${commentQnA.cq_content }	
																	</div>
																</c:if>
															</c:forEach>
														</c:if>
													</div>
												</div>
					
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
							<tr class="page_tr">
									<td colspan="4" id = "pageLow">
										<c:if test = "${qnaVO.totalPage < qnaVO.pageNum }">
											<c:set var = "pNum" value= "${qnaVO.totalPage }"/>
										</c:if>
										<c:if test = "${qnaVO.totalPage >= qnaVO.pageNum }">
											<c:set var = "pNum" value= "${qnaVO.pageNum }"/>
										</c:if>
										
										<c:if test = "${qnaVO.pageTotal[0] eq 1 and pNum eq 1}" >
											<span class = "icon-angle-double-left"></span>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[0] eq 1 and pNum ne 1}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[0] ne 1}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=1" data-num = "1" class = "icon-angle-double-left"></a>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[0] eq 1}" >
											<span class = "icon-angle-left"></span>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[0] ne 1}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=${qnaVO.pageTotal[0] - fn:length(qnaVO.pageTotal) }" data-num = "${qnaVO.pageTotal[0] - fn:length(qnaVO.pageTotal) }" class = "icon-angle-left"></a>
										</c:if>
							
									
										<c:forEach items="${qnaVO.pageTotal }" varStatus="status">
											<c:if test = "${qnaVO.pageTotal[status.index] eq pNum}" >
												<span>${qnaVO.pageTotal[status.index] }</span>
											</c:if>
											<c:if test = "${qnaVO.pageTotal[status.index] ne pNum}" >
												<a href = "/admin/commentQnA/commentQnAList?pageNum=${qnaVO.pageTotal[status.index] }" data-num = "${qnaVO.pageTotal[status.index]}">
							 						${qnaVO.pageTotal[status.index] } 
												</a>
											</c:if>
										</c:forEach>
			
										<c:if test = "${qnaVO.pageTotal[fn:length(qnaVO.pageTotal) - 1] eq qnaVO.totalPage}" >
											<span class = "icon-angle-right"></span>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[fn:length(qnaVO.pageTotal) - 1] ne qnaVO.totalPage}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=${qnaVO.pageTotal[0] + fn:length(qnaVO.pageTotal) }" data-num = "${qnaVO.pageTotal[0] + fn:length(qnaVO.pageTotal) }" class = "icon-angle-right"></a>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[fn:length(qnaVO.pageTotal) - 1] eq qnaVO.totalPage and qnaVO.totalPage eq pNum}" >
											<span class = "icon-angle-double-right"></span>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[fn:length(qnaVO.pageTotal) - 1] eq qnaVO.totalPage and qnaVO.totalPage ne pNum}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=${qnaVO.totalPage }" data-num = "${qnaVO.totalPage }" class = "icon-angle-double-right"></a>
										</c:if>
										<c:if test = "${qnaVO.pageTotal[fn:length(qnaVO.pageTotal) - 1] ne qnaVO.totalPage}" >
											<a href = "/admin/commentQnA/commentQnAList?pageNum=${qnaVO.totalPage }" data-num = "${qnaVO.totalPage }" class = "icon-angle-double-right"></a>
										</c:if>
									</td>
								</tr>
						</c:when>
						<c:otherwise>
							<tr class="qna_tr5">
								<td colspan="4">
									<div class="tb-center">등록된 문의가 없습니다.</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>	
               </tbody>
		</table>
	</div>
</div>