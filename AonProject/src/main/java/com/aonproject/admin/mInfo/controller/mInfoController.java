package com.aonproject.admin.mInfo.controller;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aonproject.admin.mInfo.vo.mInfoVO;
import com.aonproject.client.mInfo.service.MemberService;
import com.aonproject.client.mInfo.vo.MemberVO;
import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.mInfo.service.mInfoService;
import com.aonproject.common.page.Paging;
import com.aonproject.common.util.graph.MakeChartGraph;
 
@Controller
@RequestMapping(value="/admin")
public class mInfoController {
	Logger logger = Logger.getLogger(mInfoController.class);
	
	@Autowired
	private mInfoService mInfoService;
	
	@Autowired
	private MemberService memberService;
	
	// member list
	@RequestMapping(value="/mInfoList", method = RequestMethod.GET)
	public String mInfoList(@ModelAttribute mInfoVO mvo, Model model, HttpServletRequest request, Authentication auth) {
		logger.info("mInfoList calling success");
		AdminVO avo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", avo);
	
		// �젙�젹�뿉 ���븳 湲곕낯媛� �꽕�젙
		if(mvo.getOrder_by()==null) mvo.setOrder_by("m_no");
		if(mvo.getOrder_sc()==null) mvo.setOrder_by("DESC");
		
		//�럹�씠吏� �꽭�똿
		Paging.setPage(mvo);
		List<mInfoVO> mInfoList = mInfoService.mInfoList(mvo);
		
		/*String addrs[] = mvo.getM_addr().toString().split("#!@@!#");
		mvo.setM_addr(addrs[1]);*/
		
		for(int i=0; i<mInfoList.size(); i++){
			String addrs = mInfoList.get(i).getM_addr();
			
			/*String remakeAddr = "";
			remakeAddr = addrs.replace("#!@@!#", " ");*/
			
			String addr[] = addrs.split("#!@@!#");
			String remakeAddr = "";
			for(int j=0; j<addr.length; j++){
				remakeAddr += addr[j]+" ";
			}

			logger.info("result : "+remakeAddr);
			mInfoList.get(i).setM_addr(remakeAddr);
		}
		logger.info("레코드 수 = "+mInfoList.size());
		
		Map<String, Integer> map = memberService.memberSexDistribution();
		MakeChartGraph.memberSexDistribution(request, map);
		
		MemberVO vo = new MemberVO();
		String sysdate = "";
		Date date = new Date();
		SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");
		
		sysdate = sdf.format(date);
		vo.setM_date(sysdate);
		
		Map<String, Integer> map2 = memberService.memberCount(vo);
		MakeChartGraph.memberCount(request, map2);
		
		model.addAttribute("mInfoList", mInfoList);
		model.addAttribute("data", mvo);
		
		return "admin/mInfo/mInfoList";
	}
	
	// member detail
	@RequestMapping(value="/mDetailForm", method=RequestMethod.GET)
	public String mDetailForm(@ModelAttribute mInfoVO mvo, Model model, Authentication auth){
		logger.info("mDetailForm calling success");
		logger.info("m_no = " + mvo.getM_no());
		
		mInfoVO mDetail = mInfoService.mDetailForm(mvo);
		UserDetails vo = (AdminVO) auth.getPrincipal();
		
			String addrs = mDetail.getM_addr();
			
			/*String remakeAddr = "";
			remakeAddr = addrs.replace("#!@@!#", " ");*/
			
			String addr[] = addrs.split("#!@@!#");
			String remakeAddr = "";
			for(int j=0; j<addr.length; j++){
				remakeAddr += addr[j]+" ";
			}

			logger.info("result : "+remakeAddr);
			mDetail.setM_addr(remakeAddr);
		
		    model.addAttribute("mDetail", mDetail);
		    model.addAttribute("vo", vo);
		    String url = "admin/mInfo/mDetailForm";
		
		    return url;
	}
	
	@ResponseBody
	@RequestMapping(value="/mInfoDelete", method=RequestMethod.POST)
	public String memberExpire(@ModelAttribute mInfoVO mvo, Model model){
		logger.info("mInfoDelete calling success");
		
		String url = "";
		
		logger.info("m_no="+mvo.getM_no());
		
		String result2 = "";
		
			mvo.setM_no(mvo.getM_no());
			mvo = mInfoService.mDetailForm(mvo);
			
			int min2 = mInfoService.memberExpire(mvo);
			
			if(min2 == 1) {
				mvo.setM_leave("true");
				int a = mInfoService.memberGoodBye(mvo);
				int b = mInfoService.memberAddrGoodBye(mvo);
				if(a == 1 && b == 1) {
					result2 = "success";
				}
				return result2;
			}
		
		return "redirect:"+url;
		
		
		
		/*String result = "";
		int gogo = policyService.policyAgrDenial(vo);
		if(gogo == 1){
			MemberVO mvo = new MemberVO();
			mvo.setM_no(vo.getM_no());
			mvo = memberService.memberInfo(mvo);
			int gogo2 = memberService.memberExpire(mvo);
			if(gogo2 == 1){
				mvo.setM_leave("true");
				int a = memberService.memberGoodBye(mvo);
				int b = memberService.memberAddrGoodBye(mvo);
				if(a == 1 && b == 1){
					result = "success";
				}
			}
		}
		return result; */
	}
}
