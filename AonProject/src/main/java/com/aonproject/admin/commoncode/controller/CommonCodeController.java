package com.aonproject.admin.commoncode.controller;

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

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.category.controller.CategoryController;
import com.aonproject.admin.commoncode.service.CommonCodeService;
import com.aonproject.admin.commoncode.vo.CommonCodeVO;

@Controller
@RequestMapping(value = "/admin")
public class CommonCodeController {
	Logger logger = Logger.getLogger(CategoryController.class);
	
	@Autowired
	private CommonCodeService commonCodeService;
	
	//공통 코드 리스트 구현
	@RequestMapping(value = "/commonCodeList", method=RequestMethod.GET)
	public String CommonCodeList(@ModelAttribute CommonCodeVO cvo, Model model, Authentication auth){
		logger.info("CommonCodeList 호출 성공!");
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
			
		List<CommonCodeVO> commonCodeList = commonCodeService.CommonCodeList(cvo);
			
		if(commonCodeList != null) {
			model.addAttribute("CommonCodeList", commonCodeList);
		}
			
		return "admin/commonCode/DetailForm";
	}
	
	// 공통 코드 size 리스트 구현
	@RequestMapping(value = "/sCommonCodeList", method=RequestMethod.GET)
	public String sCommonCodeList(@ModelAttribute CommonCodeVO cvo, Authentication auth, Model model){
		logger.info("sCommonCodeList 호출 성공!");
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
		
		List<CommonCodeVO> sCommonCodeList = commonCodeService.sCommonCodeList(cvo);
		if(sCommonCodeList != null) {
			model.addAttribute("sCommonCodeList", sCommonCodeList);
		}
		model.addAttribute("vo", vo);
		
		return "admin/commonCode/sDetailForm";
	}
	
	// 공통 코드 color 리스트 구현
		@RequestMapping(value = "/cCommonCodeList", method=RequestMethod.GET)

		public String cCommonCodeList(@ModelAttribute CommonCodeVO cvo, Authentication auth, Model model){
			logger.info("cCommonCodeList 호출 성공!");
			
			UserDetails vo = (AdminVO) auth.getPrincipal();
			model.addAttribute("vo", vo);
			
			List<CommonCodeVO> cCommonCodeList = commonCodeService.cCommonCodeList(cvo);
			
			if(cCommonCodeList != null) {
				model.addAttribute("cCommonCodeList", cCommonCodeList);
			}
			model.addAttribute("vo", vo);
			
			return "admin/commonCode/cDetailForm";
		}
		
		// 공통 코드 type 리스트 구현
		@RequestMapping(value = "/tCommonCodeList", method=RequestMethod.GET)
		public String tCommonCodeList(@ModelAttribute CommonCodeVO cvo, Model model, Authentication auth){
			logger.info("tCommonCodeList 호출 성공!");
			
			UserDetails vo = (AdminVO) auth.getPrincipal();
			model.addAttribute("vo", vo);
			
			List<CommonCodeVO> tCommonCodeList = commonCodeService.tCommonCodeList(cvo);
			
			if(tCommonCodeList != null) {
				model.addAttribute("tCommonCodeList", tCommonCodeList);
			}
			model.addAttribute("vo", vo);
			
			return "admin/commonCode/tDetailForm";
		}
		
		/*size insert*/
		@RequestMapping(value="/sCommonCodeInsert", method=RequestMethod.POST)
		public String sCommonCodeInsert(@ModelAttribute CommonCodeVO cvo){
			logger.info("sCommonCodeInsert 호출 성공");
			
			int result = 0;
			String url = "";
			
			result = commonCodeService.sCommonCodeInsert(cvo);
			System.out.println(result);
			if(result != 1) {
				url = "/admin/sDetailForm";
			}
			return "redirect:"+url;
		}
		
		/*color insert*/
		@RequestMapping(value="/cCommonCodeInsert", method=RequestMethod.POST)
		public String cCommonCodeInsert(@ModelAttribute CommonCodeVO cvo){
			logger.info("cCommonCodeInsert 호출 성공");
			
			int result = 0;
			String url = "";
			
			result = commonCodeService.cCommonCodeInsert(cvo);
			System.out.println(result);
			if(result != 1) {
				url = "/admin/cDetailForm";
			}
			return "redirect:"+url;
		}
		
		/*type insert*/
		@RequestMapping(value="/tCommonCodeInsert", method=RequestMethod.POST)
		public String tCommonCodeInsert(@ModelAttribute CommonCodeVO cvo){
			logger.info("tCommonCodeInsert 호출 성공");
			
			int result = 0;
			String url = "";
			
			result = commonCodeService.tCommonCodeInsert(cvo);
			System.out.println(result);
			if(result != 1) {
				url = "/admin/tDetailForm";
			}
			return "redirect:"+url;
		}
		
}

