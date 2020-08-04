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
		

		@Override
		public void addPost(Community community) throws Exception {
			// TODO Auto-generated method stub
			communityDao.addPost(community);
		}


		@Override
		public Map<String,Object> getPostList(Search search, String meetId) throws Exception {
			// TODO Auto-generated method stub
			List<Community> list = communityDao.getPostList(search, meetId);
			Map <String,Object> map = new HashMap<String,Object>();
			map.put("list", list);
			System.out.println(map);
			return map;
		}


		@Override
		public void updatePost(Community community) throws Exception {
			// TODO Auto-generated method stub
			communityDao.updatePost(community);
		}


		@Override
		public void deletePost(int postNo) throws Exception {
			// TODO Auto-generated method stub
			communityDao.deletePost(postNo);
		}
		

		public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{

			UUID uuid = UUID.randomUUID();
			
			String savedName = uuid.toString()+"_"+originalName;
			File target = new File(uploadPath, savedName);

			FileCopyUtils.copy(fileData, target);
			
			return savedName;
		}


		@Override
		public Community getPost(int postNo) throws Exception {
			// TODO Auto-generated method stub
			return communityDao.getPost(postNo);
		}



}
