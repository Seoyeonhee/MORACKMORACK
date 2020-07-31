package com.morackmorack.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.friend.FriendDao;
import com.morackmorack.mvc.service.friend.FriendService;

@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService {

	@Autowired
	@Qualifier("friendDaoImpl")
	private FriendDao friendDao;

	public void setFriendDao(FriendDao FriendDao) {
		this.friendDao = FriendDao;
	}

	public FriendServiceImpl() {
		System.out.println("friendServiceImpl::" + getClass());
	}

	public void reqFriend(Friend friend) throws Exception {
		friendDao.reqFriend(friend);
	}

	public List<Friend> listRecvFriend(String receiverId) throws Exception{
		return friendDao.listRecvFriend(receiverId);
	}

	public Map<String, Object> listFriend(String userId) throws Exception{
		return friendDao.listFriend(userId);
	}

	public Friend getFriend(int friendNo) throws Exception{
		return friendDao.getFriend(friendNo);
	}

	public void okFriend(int friendNo) throws Exception{
		friendDao.okFriend(friendNo);
	}

	public void delFriend(int friendNo) throws Exception{
		friendDao.delFriend(friendNo);
	}
}