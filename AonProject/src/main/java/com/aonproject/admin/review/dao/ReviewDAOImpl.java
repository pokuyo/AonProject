package com.aonproject.admin.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aonproject.admin.review.vo.ReviewVO;
import com.aonproject.client.mInfo.vo.MemberVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSession session;
	
	//리뷰 리스트 목록
	@Override
	public List<ReviewVO> reviewList(ReviewVO rvo){
		return session.selectList("reviewList", rvo);
	}
	@Override
	public List<ReviewVO> reviewuserList(ReviewVO rvo){
		return session.selectList("reviewuserList", rvo);
	}
	//글 입력
	@Override
	public int reviewInsert(ReviewVO rvo){
		return session.insert("reviewInsert", rvo);
	}
	@Override
	public int selectReno(){
		return session.selectOne("selectReno");
	}

	@Override
	public int pwdConfirm(ReviewVO rvo) {
		return session.selectOne("pwdConfirm");
	}

	@Override
	public int reviewUpdate(ReviewVO rvo) {
		return session.update("reviewUpdate");
	}

	@Override
	public int reviewDelete(int re_no) {
		return session.update("reviewDelete");
	}

	@Override
	public int reviewSelectNo() {
		return session.selectOne("reviewSelectNo");
	}

	@Override
	public int rechkUpdate(int re_no) {
		return session.update("rechkUpdate");
	}

	@Override
	public int cntList() {
		return session.selectOne("cntList");
	}

	@Override
	public int mnoList() {
		return session.selectOne("mnoList");
	}

	@Override
	public int onoList() {
		return session.selectOne("onoList");
	}

	@Override
	public int reviewUserInsert(ReviewVO rvo) {
		return session.insert("reviewUserInsert", rvo);
	}

	@Override
	public int reviewUserUpdate(ReviewVO rvo) {
		return session.update("reviewUserUpdate");
	}

	@Override
	public int InsertID(ReviewVO rvo) {
		return session.update("InsertID", rvo);
	}
	
	@Override
	public int confirmMno(ReviewVO rvo){
		return session.selectOne("confirmMno");
	}
	@Override
	public String reviewOrderConfirm(ReviewVO rvo) {
		return session.selectOne("reviewOrderConfirm");
	}
	@Override
	public int reviewConfirm(ReviewVO rvo){
		return session.selectOne("reviewConfirm");
	}
	@Override
	public List<ReviewVO> myReview(MemberVO vo) {
		// TODO Auto-generated method stub
		return session.selectList("myReview", vo);
	}
	@Override
	public int myReviewCnt(MemberVO vo) {
		// TODO Auto-generated method stub
		return session.selectOne("myReviewCnt", vo);
	}
}
