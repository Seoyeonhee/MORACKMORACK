package com.morackmorack.mvc.service.community.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.community.CommunityDao;
import com.morackmorack.mvc.service.community.CommunityService;
import com.morackmorack.mvc.service.domain.Community;



	@Service("communityServiceImpl")
	public class CommunityServiceImpl implements CommunityService{
		
		///Field
		@Autowired
		@Qualifier("communityDaoImpl")
		private CommunityDao communityDao;
		
		public void setCommunityDao(CommunityDao communityDao) {
			this.communityDao = communityDao;
		}
		
		
		public CommunityServiceImpl() {
			System.out.println(this.getClass());
		}
		
		public void addOffReview(Community community) throws Exception {
			communityDao.addOffReview(community);
		}
		

		public void updateOffReview(Community community) throws Exception {
			communityDao.updateOffReview(community);
		}

		public void deleteOffReview(int postNo) throws Exception {
			communityDao.deleteOffReview(postNo);
		}
		
		@Override
		public Map<String, Object> getOffReviewList(Search search, int offNo) throws Exception {
		
			List<Community> list= communityDao.getOffReviewList(search, offNo);
			int totalCount = communityDao.getOffReviewListCount2(offNo);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list );
			map.put("totalCount", new Integer(totalCount));
		
			return map;
		}
		
		public void addBusinessReview(Community community) throws Exception {
			communityDao.addBusinessReview(community);
		}
	
		public void updateBusinessReview(Community community) throws Exception {
			communityDao.updateBusinessReview(community);
		}

		public Map<String, Object> getBusinessReviewList(Search search, String communityName) throws Exception {
			List<Community> list= communityDao.getBusinessReviewList(search, communityName);
			int totalCount = communityDao.getBusinessReviewListCount(search, communityName);
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list );
			map.put("totalCount", new Integer(totalCount));
			
			return map;
		}

		public void deleteBusinessReview(int postNo) throws Exception {
			communityDao.deleteBusinessReview(postNo);
		}


		public Community getRecentOffReview(String MeetId) throws Exception {
			return communityDao.getRecentOffReview(MeetId);
		}
		
		public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{

			UUID uuid = UUID.randomUUID();
			
			String savedName = uuid.toString()+"_"+originalName;
			File target = new File(uploadPath, savedName);

			FileCopyUtils.copy(fileData, target);
			
			return savedName;
		}

}
