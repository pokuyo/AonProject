package com.aonproject.admin.imageUpload.controller;

import java.io.IOException;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import com.aonproject.admin.aInfo.vo.AdminVO;
import com.aonproject.admin.imageUpload.service.ImageUploadService;
import com.aonproject.admin.imageUpload.vo.ImageUploadVO;
import com.aonproject.common.util.upload.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class ImageUploadController {
	Logger logger = Logger.getLogger(ImageUploadController.class);
	
	@Autowired
	private ImageUploadService imageUploadService;
	
	/*image list*/
	@RequestMapping(value = "/imageUploadList", method=RequestMethod.GET)
	public String imageUploadList(@ModelAttribute ImageUploadVO iuvo, Model model, Authentication auth){
		logger.info("imageUploadList calling");
		
		List<ImageUploadVO> imageuploadList = imageUploadService.imageUploadList(iuvo);
		
		model.addAttribute("imageuploadList", imageuploadList);
		
		UserDetails vo = (AdminVO) auth.getPrincipal();
		model.addAttribute("vo", vo);
		
		return "admin/imageUpload/upload";
	}
	
	/*image upload*/
	@RequestMapping(value = "/upload/ImageUploadInsert")
	public String imageUploadInsert(@ModelAttribute ImageUploadVO iuvo, HttpServletRequest request) throws IllegalStateException, IOException {

		logger.info("imageUploadInsert calling");
		
		List<MultipartFile> files = iuvo.getFiles();
		
		for(int i=0; i<files.size(); i++){
			ImageUploadVO ivo = iuvo;
			ivo.setFile(ivo.getFiles().get(i));
			String fileRoute = "mainImgUpload";
			String mp_files = FileUploadUtil.fileUpload("main", fileRoute, ivo.getFile(), request);
			String mp_file[] = mp_files.split("@@@");
			ivo.setMp_route(mp_file[0]);
			ivo.setMp_file(mp_file[1]);
			
			logger.info(ivo.getMp_route());
			logger.info(ivo.getMp_file());
			
			imageUploadService.imageUploadInsert(ivo);
		}
		
		return "redirect:/admin/imageUploadList";
	}
	
}
