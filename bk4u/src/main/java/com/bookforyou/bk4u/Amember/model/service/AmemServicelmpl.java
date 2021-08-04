package com.bookforyou.bk4u.Amember.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.Amember.model.dao.AmemDao;
import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;


@Service
public class AmemServicelmpl implements AmemService{
	
	@Autowired
	private AmemDao amDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectAmemListCount() {
		return amDao.selectAmemList(sqlSession);
	}

	@Override
	public ArrayList<Amem> selectList(PageInfo pi) {
		return amDao.selecltAmemSearch(sqlSession, pi);
	}

	@Override
	public int deleteAmem(int amemNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAmem(Amem am) {
		// TODO Auto-generated method stub
		return 0;
	}

}
