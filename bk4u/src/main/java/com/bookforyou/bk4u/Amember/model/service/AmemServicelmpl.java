package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.Amember.model.dao.AmemDao;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;


@Service
public class AmemServicelmpl implements AmemService{
	
	@Autowired
	private AmemDao amDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//관리자 회원조회
	@Override
	public int selectAmemListCount() {
		return amDao.selectAmemList(sqlSession);
	}

	@Override
	public ArrayList<Amem> selectList(PageInfo pi) {
		return amDao.selecltAmemSearch(sqlSession, pi);
	}
	
	//회원검색
	@Override
	public int selectAmemSearchListCount(HashMap<String, String> map) {
		return amDao.selectAmemSearchListCount(sqlSession, map);
		
	}

	@Override
	public ArrayList<Amem> selectAmemSearchList(PageInfo pi, HashMap<String, String> map) {
		return amDao.selectAmemSearchList(sqlSession, pi, map);
		
	}
	
	
	//회원탈퇴
	@Override
	public int amDelete(String memId) {
		return amDao.amDelete(sqlSession, memId);
	}

	@Override
	public int updateAmem(Amem am) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int memNo) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public Member selectAmemDetail(int memNo) {
		return amDao.selectAmemDetail(sqlSession, memNo);
	}




}
