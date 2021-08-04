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

	

}
