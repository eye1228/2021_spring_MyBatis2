package com.ict.db;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class DAO {
	// DB접속 정보와 mapper.xml 의 위치 정보를 가지고 객체가 생성됨
	private SqlSessionTemplate sqlSessionTemplate ;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	} 
	
	// list
	public List<VO> getSelectList(){
		List<VO> list  = null;
		list = sqlSessionTemplate.selectList("list");
		return list;
	}
	
	// insert
	public int getInsert(VO vo) {
		int result = 0 ;
		result = sqlSessionTemplate.insert("insert", vo);
		return result;
	}
	
	// onelist
	public VO getSelectOne(String idx) {
		VO vo = null;
		vo = sqlSessionTemplate.selectOne("onelist", idx);
		return vo;
	}
	
	// delete
	public int getDelete(String idx) {
		int result = 0 ;
		result = sqlSessionTemplate.delete("delete", idx);
		return result;
	}
	
	// update
	public int getUpdate(VO vo) {
		int result = 0 ;
		result = sqlSessionTemplate.update("update", vo);
		return result;
	}
	
	
}










