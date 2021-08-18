package com.bookforyou.bk4u.Amember.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.Amember.model.vo.Amem;
import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.member.model.vo.Member;

@Repository
public class AmemDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAmemList", null, rowBounds);
		
	}
	
	
	//검색
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.selectSearchListCount", map);
	}
	
	public ArrayList<Member> selectSearchAmemList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(map);
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchAmemList", map, rowBounds);
		
	}
	//회원 탈퇴
	public int amDelete(SqlSessionTemplate sqlSession, String memId) {
		return sqlSession.delete("memberMapper.amDelete", memId);
		
	}
	
	//회원 상세조회
	
	public Member selectAmemDetail(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectAmemDetail", memNo);
	}
	
}
