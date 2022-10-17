package com.bookforyou.bk4u.cs.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.cs.model.vo.Cancel;
import com.bookforyou.bk4u.cs.model.vo.Refund;
import com.bookforyou.bk4u.cs.model.vo.Return;
import com.bookforyou.bk4u.order.model.vo.Order;

@Repository
public class CsDao {

	/**
	 * [관리자] '주문취소' 목록 개수 조회 (한진)
	 */
	public int selectAdminCancelCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("csMapper.selectAdminCancelCount");
	}

	/**
	 * [관리자] '반품' 목록 개수 조회 (한진)
	 */
	public int selectAdminReturnCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("csMapper.selectAdminReturnCount");
	}

	/**
	 * [관리자] '환불' 목록 개수 조회 (한진)
	 */
	public int selectAdminRefundCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("csMapper.selectAdminRefundCount");
	}

	/**
	 * [관리자] '주문취소' 목록 조회 (한진)
	 */
	public ArrayList<Cancel> selectAdminCancelList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminCancelList", filter, rowBounds);
	}

	/**
	 * [관리자] '반품' 목록 조회 (한진)
	 */
	public ArrayList<Return> selectAdminReturnList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminReturnList", filter, rowBounds);
	}

	/**
	 * [관리자] '환불' 목록 조회 (한진)
	 */
	public ArrayList<Refund> selectAdminRefundList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> filter) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminRefundList", filter, rowBounds);
	}

	/**
	 * [관리자] 검색조건에 일치하는 CS개수 조회 (한진)
	 */
	public int selectAdminSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("csMapper.selectAdminSearchCount", map);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '주문취소'목록 조회 (한진)
	 */
	public ArrayList<Cancel> selectAdminSearchCancelList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminSearchCancelList", map, rowBounds);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '반품'목록 조회 (한진)
	 */
	public ArrayList<Return> selectAdminSearchReturnList(SqlSessionTemplate sqlSession, PageInfo pi,HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminSearchReturnList", map, rowBounds);
	}

	/**
	 * [관리자] 검색조건에 일치하는 '환불'목록 조회 (한진)
	 */
	public ArrayList<Refund> selectAdminSearchRefundList(SqlSessionTemplate sqlSession, PageInfo pi,HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("csMapper.selectAdminSearchRefundList", map, rowBounds);
	}

	/**
	 * [관리자] 주문취소 상세 조회 (한진)
	 */
	public Cancel selectAdminCancelDetail(SqlSessionTemplate sqlSession, int cancelNo) {
		return sqlSession.selectOne("csMapper.selectAdminCancelDetail", cancelNo);
	}

	/**
	 * [관리자] 주문취소 - orders테이블 상태 변경 (한진)
	 */
	public int updateAdminCsOrderStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("csMapper.updateAdminCsOrderStatus", o);
	}

	/**
	 * [관리자] 주문취소 - cancel테이블 상태 변경 (한진)
	 */
	public int updateAdminCancelStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("csMapper.updateAdminCancelStatus", o);
	}

	/**
	 * [관리자] 반품 상세 조회 (한진)
	 */
	public Return selectAdminReturnDetail(SqlSessionTemplate sqlSession, int returnNo) {
		return sqlSession.selectOne("csMapper.selectAdminReturnDetail", returnNo);
	}

	/**
	 * [관리자] 반품 상태 변경 (한진)
	 */
	public int updateAdminReturnStatus(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("csMapper.updateAdminReturnStatus", o);
	}

	/**
	 * [관리자] 환불 상세 조회 (한진)
	 */
	public Refund selectAdminRefundDetail(SqlSessionTemplate sqlSession, int refundNo) {
		return sqlSession.selectOne("csMapper.selectAdminRefundDetail", refundNo);
	}

	/**
	 * [관리자] 환불 처리 (한진)
	 */
	public int updateAdminRefundStatus(SqlSessionTemplate sqlSession, int refundNo) {
		return sqlSession.update("csMapper.updateAdminRefundStatus", refundNo);
	}

	/**
	 * [관리자] 환불 테이블 insert (한진)
	 */
	public int insertAdminRefundStatus(SqlSessionTemplate sqlSession, Refund r) {
		return sqlSession.insert("csMapper.insertAdminRefundStatus", r);
	}

	/**
	 * [관리자] 환불 - 사용된 쿠폰 반환 (한진)
	 */
	public int updateAdminRefundCoupon(SqlSessionTemplate sqlSession, Refund r) {
		return sqlSession.update("memberMapper.updateAdminRefundCoupon", r);
	}

	/**
	 * [관리자] 환불 - 사용된 포인트 반환 (한진)
	 */
	public int insertAdminRefundPoint(SqlSessionTemplate sqlSession, Refund r) {
		return sqlSession.insert("csMapper.insertAdminRefundPoint", r);
	}

	/**
	 * [관리자] 메모 등록/수정 (한진)
	 */
	public int updateAdminMemo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("csMapper.updateAdminMemo", map);
	}

	/**
	 * [관리자] 메모 삭제 (한진)
	 */
	public int deleteAdminMemo(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("csMapper.deleteAdminMemo",map);
	}

	

	

}
