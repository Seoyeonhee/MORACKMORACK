package com.morackmorack.mvc.service.friend;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;

public interface FriendDAO {
	
	public void reqFriend(Friend friend) throws Exception;
	
	public List<Friend> listRecvFriend(Search search, String recvFriendId) throws Exception;
	
	public Friend getRecvFriend(String reqFriendId) throws Exception;
	
	public Friend getFriend(String recvFriendId) throws Exception;
	
	public void mangFriend(int friendNo) throws Exception;
	
	public void delFriend(int friendNo) throws Exception;
	
	public List<Friend> listFriend(Search search, String userId) throws Exception;
	
	public int getTotalCount(String userId) throws Exception;

	public List<Friend> friendList(String reqFriendId) throws Exception;
}
