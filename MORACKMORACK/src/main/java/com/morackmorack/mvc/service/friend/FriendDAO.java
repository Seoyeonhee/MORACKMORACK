package com.morackmorack.mvc.service.friend;

import java.util.List;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;

public interface FriendDAO {
	
	public void reqFriend(Friend friend) throws Exception;
	
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception;
	
	public Friend getRecvFriend(int friendNo) throws Exception;
	
	public Friend getFriend(String recvFriendId) throws Exception;
	
	public void okFriend(Friend friend) throws Exception;
	
	public void denyFriend(Friend friend) throws Exception;
	
	public void delFriend(String reqFriendId, String recvFriendId) throws Exception;
	
	public List<Friend> listFriend(String reqFriendId) throws Exception;
	
	public int getTotalCount(String userId) throws Exception;

	public List<Friend> friendList(String reqFriendId) throws Exception;
}
