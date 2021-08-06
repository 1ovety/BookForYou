package com.bookforyou.bk4u.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;

@Repository
public class MypageDao {

	public int deleteAllMemInterest(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.delete("memberMapper.deleteAllMemInterest",member);
	}

	public int deleteAllMemCategory(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.delete("memberMapper.deleteAllMemCategory",member);
	}

	public ArrayList<MemberInterest> selectMemberInterestList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberInterestList", memNo);
	}

	public ArrayList<MemberCategory> selectSubCategoryList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectSubCategoryList",memNo);
	}

	public int updateProfileImg(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateProfileImg",member);
	}

	public int updateMemPassword(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberPassword",member);
	}

	public int updateMemberNickname(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberNickname",member);
	}

	public int updateMemberEmail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberEmail",member);
	}

	public int updateMemberDetail(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.update("memberMapper.updateMemberDetail",member);
	}

	public int updateMemberStatusDisable(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateMemberStatusDisable",member);
	}

	public int selectMyListCount(SqlSessionTemplate sqlSession, Member member) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bookMapper.selectMyListCount",member);
	}

	public ArrayList<Book> selectMyList(SqlSessionTemplate sqlSession, HashMap<String, Object> listParam) {
		// TODO Auto-generated method stub
		PageInfo pi = (PageInfo) listParam.get("pi");
		Member member = (Member) listParam.get("member");
		
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("bookMapper.selectMyList",member, rowBounds);
	}




}
