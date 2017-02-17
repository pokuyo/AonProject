package com.aonproject.admin.commentQnA.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.commentQnA.service.CommentQnAService;
import com.aonproject.admin.commentQnA.vo.CommentQnAVO;
import com.aonproject.admin.qna.service.QnaService;
import com.aonproject.admin.qna.vo.QnaVO;
import com.aonproject.common.util.paging.PagingSet;

@Controller
@RequestMapping(value="/admin/commentQnA")
public class CommentQnAController {
	Logger logger = Logger.getLogger(CommentQnAController.class);
	
	@Autowired
	private CommentQnAService commentQnAService;
	
	@Autowired
	private QnaService qnaService;
	
	
	@RequestMapping(value="/commentQnAList", method=RequestMethod.GET)
	public String CommentQnAList(@ModelAttribute CommentQnAVO cqvo, @ModelAttribute QnaVO qvo, Model model, Authentication auth){
		
		int cnt = 0;
		cnt = commentQnAService.cntList();
		qvo.setCountList(5);
		PagingSet.setPageing(qvo, cnt);
		
		List<CommentQnAVO> commentQnAList = commentQnAService.commentQnAList(cqvo);
		model.addAttribute("commentQnAList", commentQnAList);
		
		
		List<QnaVO> qnacommentList = qnaService.qnacommentList(qvo);
		model.addAttribute("qnacommentList", qnacommentList);
		model.addAttribute("qnaVO",qvo);
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
		
		return "admin/commentQnA/commentQnAList";
	}
	
	@ResponseBody
	@RequestMapping(value="/commentQnAInsert", method=RequestMethod.POST)
	public String commentQnAInsert(@ModelAttribute CommentQnAVO cqvo, HttpServletRequest request){
		
		int result = 0;
		int q_no = cqvo.getQ_no();
		result = commentQnAService.commentQnAInsert(cqvo);
		
		if(result == 1){
			qnaService.qnaQconfirm(q_no);//확인을 0에서 1로 바꾼
		}
		String good = "success";
		
		return good;
	}
	
	@ResponseBody
	@RequestMapping(value="/commentQnAUpdate", method=RequestMethod.POST)
	public String commentQnAUpdate(@ModelAttribute CommentQnAVO cqvo, HttpServletRequest request){
		
		int result = 0;
		result = commentQnAService.commentQnAUpdate(cqvo);
		
		if(result == 1){

		}
		String good = "success";
		
		return good;
	}
	
	//review 내용 삭제하기
	@ResponseBody
	@RequestMapping(value="/{q_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> commentQnADelete(@PathVariable("q_no") Integer q_no, @ModelAttribute CommentQnAVO cqvo, @ModelAttribute QnaVO qvo, HttpServletRequest request)throws IOException{
		
		ResponseEntity<String> entity = null;
		try{
			commentQnAService.commentQnADelete(q_no);
			qnaService.qnaDelete(q_no);
			
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
