package com.morackmorack.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.friend.FriendDAO;
import com.morackmorack.mvc.service.friend.FriendService;

@Service("friendServiceImpl")
public class FriendServiceImpl implements FriendService {
	
	@Autowired
	@Qualifier("friendDAOImpl")
	private FriendDAO friendDAO;
	public void setFriendDAO(FriendDAO friendDAO) {
		this.friendDAO=friendDAO;
	}
	public FriendServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("friendServiceImpl::"+getClass());
	}

	@Override
	public void reqFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(friend);
		friendDAO.reqFriend(friend);
	}
	@Override
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.listRecvFriend(recvFriendId);
	}
	@Override
	public Friend getRecvFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getRecvFriend(friendNo);
	}
	@Override
	public Friend getFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getFriend(recvFriendId);
	}
	@Override
	public List<Friend> listFriend(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.listFriend(reqFriendId);
	}
	@Override
	public void okFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.okFriend(friend);
	}
	
	@Override
	public void denyFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.denyFriend(friend);
	}
	
	@Override
	public void delFriend(String reqFriendId, String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.delFriend(reqFriendId, recvFriendId);
	}
	@Override
	public List<Friend> friendList(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(reqFriendId);
		return friendDAO.friendList(reqFriendId);
	}

}