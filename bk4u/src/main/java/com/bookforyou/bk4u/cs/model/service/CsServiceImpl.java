package com.bookforyou.bk4u.cs.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.dao.CsDao;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.order.model.vo.Order;

@Service
public class CsServiceImpl implements CsService{

	@Autowired 
	private CsDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminCancelCount() {
		return cDao.selectAdminCancelCount(sqlSession);
	}

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminReturnCount() {
		return cDao.selectAdminReturnCount(sqlSession);
	}

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	@Override
	public int selectAdminRefundCount() {
		return cDao.selectAdminRefundCount(sqlSession);
	}

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Cancel> selectAdminCancelList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminCancelList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Return> selectAdminReturnList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminReturnList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	@Override
	public ArrayList<Refund> selectAdminRefundList(PageInfo pi, HashMap<String, String> filter) {
		return cDao.selectAdminRefundList(sqlSession, pi, filter);
	}

	/**
	 * [관리자] 검색조건에 일치하는 CS목록 개수 (한진)
	 */
	@Override
	public int selectAdminSearchCount(HashMap<String, String> map) {
		return cDao.selectAdminSearchCount(sqlSession, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '주문취소'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Cancel> selectAdminSearchCancelList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchCancelList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '반품'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Return> selectAdminSearchReturnList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchReturnList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '환불'목록 조회 (한진)
	 */
	@Override
	public ArrayList<Refund> selectAdminSearchRefundList(PageInfo pi, HashMap<String, String> map) {
		return cDao.selectAdminSearchRefundList(sqlSession, pi, map);
	}

	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	@Override
	public Cancel selectAdminCancelDetail(int cancelNo) {
		return cDao.selectAdminCancelDetail(sqlSession, cancelNo);
	}

	/**
	 * [관리자] 주문 취소 - orders테이블 상태 변경 (한빈)
	 */
	@Override
	public int updateAdminCsOrderStatus(Order o) {
		return cDao.updateAdminCsOrderStatus(sqlSession, o);
	}

	/**
	 * [관리자] 주문취소 - cancel테이블 상태 변경 (한진)
	 */
	@Override
	public int updateAdminCancelStatus(Order o) {
		return cDao.updateAdminCancelStatus(sqlSession, o);
	}

	/**
	 * [관리자] 반품 상세 조회 (한진)
	 */
	@Override
	public Return selectAdminReturnDetail(int returnNo) {
		return cDao.selectAdminReturnDetail(sqlSession, returnNo);
	}

	/**
	 * [관리자] 반품 처리 (한진)
	 */
	@Override
	public int updateAdminReturnStatus(Order o) {
		return cDao.updateAdminReturnStatus(sqlSession, o);
	}

	/**
	 * [관리자] 환불 상세 조회 (한진)
	 */
	@Override
	public Refund selectAdminRefundDetail(int refundNo) {
		return cDao.selectAdminRefundDetail(sqlSession, refundNo);
	}

	/**
	 * [관리자] 환불 처리 (한진)
	 */
	@Override
	public int updateAdminRefundStatus(int refundNo) {
		return cDao.updateAdminRefundStatus(sqlSession, refundNo);
	}

	/**
	 * [관리자] 환불 테이블 insert (한진)
	 */
	@Override
	public int insertAdminRefundStatus(Refund r) {
		return cDao.insertAdminRefundStatus(sqlSession, r);
	}

	/**
	 * [관리자] 환불 - 사용된 쿠폰 반환 (한진)
	 */
	@Override
	public int updateAdminRefundCoupon(Refund r) {
		return cDao.updateAdminRefundCoupon(sqlSession, r);
	}

	/**
	 * [관리자] 환불 - 사용된 포인트 반환 (한진)
	 */
	@Override
	public int insertAdminRefundPoint(Refund r) {
		return cDao.insertAdminRefundPoint(sqlSession, r);
	}

	/**
	 * [관리자] 메모 등록/수정 (한진)
	 */
	@Override
	public int updateAdminMemo(HashMap<String, String> map) {
		return cDao.updateAdminMemo(sqlSession, map);
	}

	/**
	 * [관리자] 메모 삭제 (한진)
	 */
	@Override
	public int deleteAdminMemo(HashMap<String, String> map) {
		return cDao.deleteAdminMemo(sqlSession, map);
	}

	
	
	

}
