package com.bookforyou.bk4u.rental.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.rental.model.vo.Rental;

public interface RentalService {

	/*
	 * [사용자] 대여 내역 개수 조회 (연지)
	 */
	int selectRentalCount(int memNo);
	
	/*
	 * [사용자] 대여 내역 조회 (연지)
	 */
	ArrayList<Rental> selectRentalList(PageInfo pi, int memNo);
	
	/*
	 * [사용자] 대여 내역 상세 조회 (연지)
	 */
	Rental selectRental(int rentalNo);

}
