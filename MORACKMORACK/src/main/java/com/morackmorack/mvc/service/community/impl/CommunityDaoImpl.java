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
		
		public void addOffReview(Community community) throws Exception {
			sqlSession.insert("CommunityMapper.addOffReview", community);
		}
		

		public void updateOffReview(Community community) throws Exception {
			sqlSession.update("CommunityMapper.updateOffReview", community);	
		}

		public List<Community> getOffReviewList(Search search, int offNo) throws Exception {
			Map<String, Object> map=new HashMap<String, Object>();
			
			map.put("search", search);
			map.put("offNo", offNo);
			
			return sqlSession.selectList("CommunityMapper.getOffReviewList", map);
		}
	
			
		public void deleteOffReview(int postNo) throws Exception {
			sqlSession.update("CommunityMapper.deleteOffReview", postNo);
		}
	
		public void addBusinessReview(Community community) throws Exception {
			sqlSession.insert("CommunityMapper.addBusinessReview", community);	
		}
	
		public void updateBusinessReview(Community community) throws Exception {
			sqlSession.update("CommunityMapper.updateBusinessReview", community);	
		}

		public List<Community> getBusinessReviewList(Search search, String communityName) throws Exception {
			Map<String, Object> map=new HashMap<String, Object>();
			
			map.put("search", search);
			map.put("communityName", communityName);
			
			return sqlSession.selectList("CommunityMapper.getBusinessReviewList", map);
		}

		public void deleteBusinessReview(int postNo) throws Exception {
			sqlSession.update("CommunityMapper.deleteBusinessReview", postNo);
		}
		@Override
		
		public int getOffReviewListCount(String meetId) throws Exception {
			return sqlSession.selectOne("CommunityMapper.getOffReviewCount_meetId", meetId);
		}
		
		public int getOffReviewListCount2(int offNo) throws Exception {
			
			return sqlSession.selectOne("CommunityMapper.getOffReviewCount_offNo", offNo);
		}
		
		@Override
		public int getBusinessReviewListCount(Search search, String communityName) throws Exception {
			Map<String, Object> map=new HashMap<String, Object>();
			
			map.put("search", search);
			map.put("communityName", communityName);
			
			return sqlSession.selectOne("CommunityMapper.getBusinessReviewListCount", map);
		}
		@Override
		public Community getRecentOffReview(String MeetId) throws Exception {
				return sqlSession.selectOne("CommunityMapper.getRecentOffReview", MeetId);
		}
			
}
