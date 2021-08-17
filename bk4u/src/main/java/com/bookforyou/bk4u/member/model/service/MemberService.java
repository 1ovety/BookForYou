package com.bookforyou.bk4u.member.model.service;


import java.util.ArrayList;

import com.bookforyou.bk4u.member.model.vo.Coupon;
import com.bookforyou.bk4u.member.model.vo.Member;
import com.bookforyou.bk4u.member.model.vo.MemberCategory;
import com.bookforyou.bk4u.member.model.vo.MemberInterest;
import com.bookforyou.bk4u.member.model.vo.MemberPhonebook;
import com.bookforyou.bk4u.report.model.vo.ReportList;

public interface MemberService {
	
	Member loginMember(Member member);	

	int idCheck(String memId);

	int nickCheck(String memNickname);

	int emailCheck(String memEmail);

	int insertMember(Member member);

	int updateEmailStatus(Member member);

	int selectByMemId(Member member);

	int insertMemberInterest(MemberInterest memberInterest);

	int insertMemberCategory(MemberCategory memberCategory);

	Member selectEmailAndAuthKey(Member member);

	Member findMemberByEmail(Member member);

	Member findMemberByEmailAndId(Member member);

	String createTempPassword();

	int updatePassword(Member member);

	/*
	 * [사용자] 소지 쿠폰 개수 조회 (연지)
	 */
	int selectCouponCount(int memNo);

	/*
	 * [사용자] 소지 쿠폰 조회 (연지)
	 */
	ArrayList<Coupon> selectCouponList(int memNo);

	int updateMemberWorkAndLevel(Member member);

	String selectMemberPassword(int memNo);

	/*
	 * [사용자] 주소록 리스트 조회 (연지)
	 */
	ArrayList<MemberPhonebook> selectMemPhonebookList(int memNo);

	/*
	 * [관리자] 신고 스텍증가 (김현솔)
	 */
	int updateReportStack(ReportList reli);
	int updateStatus(int memNo);

	/*
	 * [사용자] 최근 사용 주소록 조회 (연지)
	 */
	MemberPhonebook selectRecentPhonebook(int memNo);
}

