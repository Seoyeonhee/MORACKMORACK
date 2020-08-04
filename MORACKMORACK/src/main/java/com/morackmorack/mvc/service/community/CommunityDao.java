package com.morackmorack.mvc.service.community;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Community;
import com.sun.javafx.collections.MappingChange.Map;


public interface CommunityDao {
	
	public void addPost(Community community) throws Exception ; 
	
	public List<Community> getPostList(Search search, String meetId) throws Exception ;
	
	public Community getPost(int postNo) throws Exception ;
	
	public void updatePost(Community community) throws Exception ;
	
	public void deletePost(int postNo) throws Exception ;
	
}
