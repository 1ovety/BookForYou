package com.bookforyou.bk4u.mypage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.book.model.dao.BookDao;
import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.mypage.model.dao.MypageDao;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageDao mypageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	@Override
	public ArrayList<Book> selectRentalList() {
		// TODO Auto-generated method stub
		return mypageDao.selectRentalList(sqlSession);
	}

}
