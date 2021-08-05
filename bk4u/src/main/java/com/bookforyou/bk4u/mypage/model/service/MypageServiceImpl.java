package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int deleteAllMemInterest(Member member) {
		return mypageDao.deleteAllMemInterest(sqlSession,member);
	}

	@Override
	public int deleteAllMemCategory(Member member) {
		return mypageDao.deleteAllMemCategory(sqlSession, member);
	}

	@Override
	public ArrayList<MemberInterest> getMemberInterestList(int memNo) {
		return mypageDao.selectMemberInterestList(sqlSession,memNo);
	}

	@Override
	public ArrayList<MemberCategory> getSubCategoryList(int memNo) {
		return mypageDao.selectSubCategoryList(sqlSession,memNo);
	}

	@Override
	public int updateProfileImg(Member member) {
		return mypageDao.updateProfileImg(sqlSession,member);
	}

	@Override
	public int updateMemPassword(Member member) {
		return mypageDao.updateMemPassword(sqlSession,member);
	}

	@Override
	public int updateMemberNickname(Member member) {
		return mypageDao.updateMemberNickname(sqlSession,member);
	}

	@Override
	public int updateMemberEmail(Member member) {
		return mypageDao.updateMemberEmail(sqlSession,member);
	}

	@Override
	public int updateMemberDetail(Member member) {
		return mypageDao.updateMemberDetail(sqlSession,member);
	}

	@Override
	public int updateMemberStatusDisable(Member member) {
		return mypageDao.updateMemberStatusDisable(sqlSession,member);
	}


	
	

}
