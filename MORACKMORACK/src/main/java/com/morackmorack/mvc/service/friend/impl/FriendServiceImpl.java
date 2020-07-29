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
	public Map<String, Object> listRecvFriend(Search search, String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		List<Friend> list = friendDAO.listRecvFriend(search, recvFriendId);
		int totalCount=friendDAO.getTotalCount(recvFriendId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		return map;
	}
	@Override
	public Friend getRecvFriend(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getRecvFriend(reqFriendId);
	}
	@Override
	public Friend getFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		return friendDAO.getFriend(recvFriendId);
	}
	@Override
	public Map<String, Object> listFriend(Search search, String userId) throws Exception {
		// TODO Auto-generated method stub
		List<Friend> list = friendDAO.listFriend(search, userId);
		int totalCount=friendDAO.getTotalCount(userId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("totalCount", new Integer(totalCount));
		return null;
	}
	@Override
	public void mangFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.mangFriend(friendNo);
	}
	@Override
	public void delFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		friendDAO.delFriend(friendNo);
	}
	@Override
	public List<Friend> friendList(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(reqFriendId);
		return friendDAO.friendList(reqFriendId);
	}
}