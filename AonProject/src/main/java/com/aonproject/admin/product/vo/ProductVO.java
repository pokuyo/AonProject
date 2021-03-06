package com.aonproject.admin.product.vo;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

import com.aonproject.client.order.vo.Product_orderVO;

public class ProductVO extends Product_orderVO {
	private String p_no;		//상품 코드
	private String p_name;		//상품명
	private String p_info;		//상품정보
	private int	p_price;		//상품 가격
	private int p_discount;		//상품 할인율
	private String color_code;	//색상 코드
	private String size_code;	//사이즈 코드
	private String p_fabric;	//상품 소재
	private String p_caution;	//주의사항
	private String p_date;		//등록일
	private int ca_no;			//카테고리 번호
	private String p_type;		//상품타입
	private String p_del;		//상품삭제여부
	
	private String createP_no;	
	
	//카테고리 노출 필드 선언
	private String ca_name;		//카테고리 이름
	
	//공통코드 필드 선언
	private String p_type_name;	//상품종류
	private String color;		//색상
	private String size;		//사이즈
	
	private int stock_cnt;		//상품 등록 수량
	
	//파일 업로드 위한 속성
	private MultipartFile file;	//첨부파일
	private String pi_file =""; //실제 서버에 저장한 파일명
	
	
	
	public int getStock_cnt() {
		return stock_cnt;
	}
	public void setStock_cnt(int stock_cnt) {
		this.stock_cnt = stock_cnt;
	}
	public String getCreateP_no() {
		return createP_no;
	}
	public void setCreateP_no(String createP_no) {
		this.createP_no = createP_no;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getP_del() {
		return p_del;
	}
	public void setP_del(String p_del) {
		this.p_del = p_del;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getPi_file() {
		return pi_file;
	}
	public void setPi_file(String pi_file) {
		this.pi_file = pi_file;
	}
	public String getP_type_name() {
		return p_type_name;
	}
	public void setP_type_name(String p_type_name) {
		this.p_type_name = p_type_name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_discount() {
		return p_discount;
	}
	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	public String getSize_code() {
		return size_code;
	}
	public void setSize_code(String size_code) {
		this.size_code = size_code;
	}
	public String getP_fabric() {
		return p_fabric;
	}
	public void setP_fabric(String p_fabric) {
		this.p_fabric = p_fabric;
	}
	public String getP_caution() {
		return p_caution;
	}
	public void setP_caution(String p_caution) {
		this.p_caution = p_caution;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public int getCa_no() {
		return ca_no;
	}
	public void setCa_no(int ca_no) {
		this.ca_no = ca_no;
	}
	@Override
	public String toString() {
		return "ProductVO [pageNum=" + pageNum + ", totalCount=" + totalCount + ", countList=" + countList
				+ ", countPage=" + countPage + ", totalPage=" + totalPage + ", pageTotal=" + Arrays.toString(pageTotal)
				+ ", start_data=" + start_data + ", end_data=" + end_data + "]";
	}

	
	
}
