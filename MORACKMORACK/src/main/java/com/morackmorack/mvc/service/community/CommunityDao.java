package com.morackmorack.mvc.service.community;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Community;


public interface CommunityDao {
	
	public void addOffReview(Community community) throws Exception ;

	public void updateOffReview(Community community) throws Exception ;
	
//	public Community getOffReview(String postNo, String userId, String CommunityName) throws Exception ;

	public List<Community> getOffReviewList(Search search, String communityName) throws Exception ;
	
	public int getOffReviewListCount(Search search, String communityName) throws Exception;
	
	public void deleteOffReview(int postNo) throws Exception;
	
	public void addBusinessReview(Community community) throws Exception ;

	public void updateBusinessReview(Community community) throws Exception ;
	
	public int getBusinessReviewListCount(Search search, String communityName) throws Exception;
	
//	public Community getBusinessReview(String postNo, String userId, String CommunityName) throws Exception ;

	public List<Community> getBusinessReviewList(Search search, String communityName) throws Exception ;
	
	public void deleteBusinessReview(int postNo) throws Exception;
	
}
