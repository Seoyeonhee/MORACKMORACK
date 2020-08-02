package com.morackmorack.mvc.service.friend;

import java.util.List;
import java.util.Map;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;

public interface FriendService {
	
public void reqFriend(Friend friend) throws Exception;
	
	public List<Friend> listRecvFriend(String receiverId) throws Exception;
	
	public Map<String, Object> listFriend(String userId) throws Exception;
	
	public Friend getFriend(int friendNo) throws Exception;

	public void okFriend(int friendNo) throws Exception;
	
	public void delFriend(int friendNo) throws Exception;
	
	public boolean isFriend(String userId, String meetMemId) throws Exception;
	
}
