package com.bookforyou.bk4u.book.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.book.model.vo.Book;
import com.bookforyou.bk4u.common.model.vo.PageInfo;

public interface BookService {

	/**
	 * [관리자] 전체 도서 개수 조회 (한진)
	 * @return
	 */
	int selectAllListCount();
	
	/**
	 * [관리자] 전체 도서 목록 조회 (한진)
	 * @param pi
	 * @return
	 */
	ArrayList<Book> selectAdminBookList(PageInfo pi);

	int selectSearchBookCount(HashMap<String, String> map);

	ArrayList<Book> selectSearchBook(PageInfo pi, String condition, String keyword);

	/**
	 * [관리자] '판매중'인 도서 개수 조회 (한진)
	 * @return
	 */
	int selectStatusYCount();
	
	/**
	 * [관리자] 게시'Y'인 도서 개수 조회 (한진)
	 * @return
	 */
	int selectSelStatusYCount();
}
