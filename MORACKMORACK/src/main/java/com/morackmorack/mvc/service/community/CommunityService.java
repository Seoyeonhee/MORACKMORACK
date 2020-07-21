package com.morackmorack.mvc.service.community;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Community;

public interface CommunityService {
	public void addOffReview(Community community) throws Exception ;

	public void updateOffReview(Community community) throws Exception ;
	
//	public Community getOffReview(String postNo, String userId, String CommunityName) throws Exception ;

	public Map<String, Object> getOffReviewList(Search search, String communityName) throws Exception ;
	
	public void deleteOffReview(int postNo) throws Exception;
	
	public void addBusinessReview(Community community) throws Exception ;

	public void updateBusinessReview(Community community) throws Exception ;
	
//	public Community getBusinessReview(String postNo, String userId, String CommunityName) throws Exception ;

	public Map<String, Object> getBusinessReviewList(Search search, String communityName) throws Exception ;
	
	public void deleteBusinessReview(int postNo) throws Exception;
	
}

