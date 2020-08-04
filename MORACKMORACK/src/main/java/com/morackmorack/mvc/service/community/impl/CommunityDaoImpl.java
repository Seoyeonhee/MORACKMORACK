package com.morackmorack.mvc.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.community.CommunityDao;
import com.morackmorack.mvc.service.domain.Community;



	@Repository("communityDaoImpl")
	public class CommunityDaoImpl implements CommunityDao{
		@Autowired
		@Qualifier("sqlSessionTemplate")
		private SqlSession sqlSession;
		public void setSqlSession(SqlSession sqlSession) {
			this.sqlSession = sqlSession;
		}
		public CommunityDaoImpl() {
			System.out.println(this.getClass());
		}
		
		
		@Override
		public void addPost(Community community) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.insert("CommunityMapper.addPost", community);
		}
		@Override
		public List<Community> getPostList(Search search, String meetId) throws Exception {
			// TODO Auto-generated method stub
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("search", search);
			map.put("meetId", meetId);
			
			return sqlSession.selectList("CommunityMapper.getPostList", map);
		}
		@Override
		public Community getPost(int postNo) throws Exception {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("CommunityMaper.getPost", postNo);
		}
		@Override
		public void updatePost(Community community) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.update("CommunityMapper.updatePost", community);
		}
		@Override
		public void deletePost(int postNo) throws Exception {
			// TODO Auto-generated method stub
			sqlSession.update("CommunityMapper.deletePost", postNo);
		}
			
}
