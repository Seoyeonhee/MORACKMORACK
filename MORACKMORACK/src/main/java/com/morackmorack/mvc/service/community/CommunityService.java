package com.morackmorack.mvc.service.community;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Community;

public interface CommunityService {

	public void addPost(Community community) throws Exception ;
	
	public Map<String,Object> getPostList(Search search, String meetId) throws Exception ;
	
	public Community getPost(int postNo) throws Exception ;
	
	public void updatePost(Community community) throws Exception ;
	
	public void deletePost (int postNo) throws Exception ;
	
	public String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception;
}

