package com.aonproject.admin.notice.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aonproject.admin.aInfo.service.AdminService;
import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.category.service.CategoryService;
import com.aonproject.admin.category.vo.CategoryVO;
import com.aonproject.admin.notice.service.NoticeService;
import com.aonproject.admin.notice.vo.NoticeVO;
import com.aonproject.common.page.Paging;

@Controller
@RequestMapping(value="/admin")
public class NoticeController {
	Logger logger = Logger.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String boardList(@ModelAttribute CategoryVO cvo, @ModelAttribute NoticeVO nvo, Model model, Authentication auth){
		logger.info("noticeList calling");
		
		/*카占쌓곤옙 占쏙옙占쏙옙트 占쏙옙占�*/
		List<CategoryVO> categoryList = categoryService.categoryList(cvo);
		model.addAttribute("categoryList", categoryList);
		
		if(nvo.getOrder_by()==null) nvo.setOrder_by("no_num");
		if(nvo.getOrder_sc()==null) nvo.setOrder_sc("DESC");
		
		Paging.setPage(nvo);
		
		int total = noticeService.noticeListCnt(nvo);
		logger.info("total = " + total);
		UserDetails vo = (AdminVO) auth.getPrincipal();
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("total", total);
		model.addAttribute("data", nvo);
		model.addAttribute("vo", vo);
		
		return "admin/notice/noticeList";
	}
	
	@RequestMapping(value="/notice/writeForm")
	public String writeForm(@ModelAttribute NoticeVO nvo, Model model, Authentication auth){
		logger.info("writeFrom calling");
		UserDetails vo = (AdminVO) auth.getPrincipal();
		
		model.addAttribute("vo", vo);
		
		return "admin/notice/writeForm";
	}
	
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	public String NoticeInsert(Authentication auth, @ModelAttribute NoticeVO nvo){
		logger.info("noticeInsert calling");
		AdminVO avo = (AdminVO)auth.getPrincipal();
		nvo.setA_no(avo.getA_no());
		logger.info("a_no="+nvo.getA_no());
		int result = 0;
		String url = "";
		
		result = noticeService.noticeInsert(nvo);
		System.out.println(result);
		if(result == 1){
			url = "/admin/noticeList";
		}
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/detailForm", method=RequestMethod.GET)
	public String selectForm(Authentication auth, @ModelAttribute AdminVO avo, @ModelAttribute NoticeVO nvo, Model model){
		logger.info("detailForm calling");
		logger.info("no_num = " + nvo.getNo_num());
		
		NoticeVO detail = noticeService.detailForm(nvo);
		UserDetails vo = (AdminVO) auth.getPrincipal();
		AdminVO admin= (AdminVO)auth.getPrincipal();
		int a_no = admin.getA_no();
		
		avo.setA_no(a_no);
		admin = adminService.adminInfo(avo);
		
		
		logger.info("admin= "+admin);

		
		model.addAttribute("adminInfo", admin);
		model.addAttribute("detail", detail);
		model.addAttribute("vo", vo);
		String url = "admin/notice/detailForm";
		
		return url;
	}
	

	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, Model model){
		logger.info("noticeUpdate calling");
		int result = 0;
		String url = "";
		
		logger.info("no_num="+nvo.getNo_num());
		
		result = noticeService.noticeUpdate(nvo);
		
		if(result == 1) {
			url = "/admin/noticeList";
		}
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/noticeDelete", method=RequestMethod.POST)
	public String noticeDelete(@ModelAttribute NoticeVO nvo, Model model) {
		logger.info("noticeDelete calling");
		
		int result = 0;
		String url = "";
		
		logger.info("no_num="+nvo.getNo_num());
		
		result = noticeService.noticeDelete(nvo.getNo_num());
		
		if(result == 1){
			url = "/admin/noticeList";
		}
		return "redirect:"+url;
	}
}