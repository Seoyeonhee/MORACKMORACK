package com.morackmorack.mvc.service.friend;

import java.util.List;

import com.morackmorack.mvc.service.domain.Friend;

public interface FriendDAO {
	
	public void reqFriend(Friend friend) throws Exception;
	
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception;
	
	public Friend getRecvFriend(int friendNo) throws Exception;
	
	public Friend getFriend(int friendNo) throws Exception;
	
	public void mangFriend(int friendNo) throws Exception;
	
	public void delFriend(int friendNo) throws Exception;
	
	public List<Friend> listFriend(String userId) throws Exception;
	
	public int getTotalCount(String userId) throws Exception;

}
