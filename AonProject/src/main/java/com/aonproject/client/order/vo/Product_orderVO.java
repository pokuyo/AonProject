package com.aonproject.client.order.vo;

import java.util.List;

import com.aonproject.common.util.vo.CommonPagingVO;

public class Product_orderVO extends CommonPagingVO {
	private int 	o_no = 0;			//주문번호		
	private int 	o_cnt = 0;			//주문수량
	private int 	o_price = 0;		//주문가격
	private String 	o_mode = "";		//결재방법
	private String 	o_confirm = "";		//결재유무
	private String 	o_date = "";		//등록일
	private int 	m_no = 0;			//회원번호
	private int 	ma_no = 0;			//회원주소
	private String 	p_no = "";			//상품번호
	private String  o_num = "";			//주문묶음
	private String	addrChk = "";		//신규주소등록여부확인
	
	private List<String> p_nos = null;	//상품번호 리스트
	private List<Integer> o_cnts = null;//상품 주문수량 리스트
	
	private String pi_file = "";
	private String pi_route = "";
	private String p_name = "";
	private String size_code = "";
	private String color_code = "";
	private String p_color = "";
	private String p_size = "";
	private String p_type = "";
	
	private String m_id = "";
	private String m_name = "";
	
	private String m_addr = "";
	
	private String startDate = "";
	private String endDate = "";
	
	
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	public String getAddrChk() {
		return addrChk;
	}
	public void setAddrChk(String addrChk) {
		this.addrChk = addrChk;
	}
	public int getMa_no() {
		return ma_no;
	}
	public void setMa_no(int ma_no) {
		this.ma_no = ma_no;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getSize_code() {
		return size_code;
	}
	public void setSize_code(String size_code) {
		this.size_code = size_code;
	}
	public String getColor_code() {
		return color_code;
	}
	public void setColor_code(String color_code) {
		this.color_code = color_code;
	}
	public String getP_color() {
		return p_color;
	}
	public void setP_color(String p_color) {
		this.p_color = p_color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getPi_file() {
		return pi_file;
	}
	public void setPi_file(String pi_file) {
		this.pi_file = pi_file;
	}
	public String getPi_route() {
		return pi_route;
	}
	public void setPi_route(String pi_route) {
		this.pi_route = pi_route;
	}
	@Override
	public String toString() {
		return "Product_orderVO [o_no=" + o_no + ", o_cnt=" + o_cnt + ", o_price=" + o_price + ", o_mode=" + o_mode
				+ ", o_confirm=" + o_confirm + ", o_date=" + o_date + ", m_no=" + m_no + ", p_no=" + p_no + ", o_num="
				+ o_num + ", p_nos=" + p_nos + ", o_cnts=" + o_cnts + "]";
	}
	public String getO_num() {
		return o_num;
	}
	public void setO_num(String o_num) {
		this.o_num = o_num;
	}
	public List<String> getP_nos() {
		return p_nos;
	}
	public void setP_nos(List<String> p_nos) {
		this.p_nos = p_nos;
	}
	public List<Integer> getO_cnts() {
		return o_cnts;
	}
	public void setO_cnts(List<Integer> o_cnts) {
		this.o_cnts = o_cnts;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getO_cnt() {
		return o_cnt;
	}
	public void setO_cnt(int o_cnt) {
		this.o_cnt = o_cnt;
	}
	public int getO_price() {
		return o_price;
	}
	public void setO_price(int o_price) {
		this.o_price = o_price;
	}
	public String getO_mode() {
		return o_mode;
	}
	public void setO_mode(String o_mode) {
		this.o_mode = o_mode;
	}
	public String getO_confirm() {
		return o_confirm;
	}
	public void setO_confirm(String o_confirm) {
		this.o_confirm = o_confirm;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	
	
}
