package com.morackmorack.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.common.Search;
import com.morackmorack.mvc.service.domain.Friend;
import com.morackmorack.mvc.service.domain.Meet;
import com.morackmorack.mvc.service.domain.MeetMem;
import com.morackmorack.mvc.service.domain.User;
import com.morackmorack.mvc.service.friend.FriendDAO;

@Repository("friendDAOImpl")
public class FriendDAOImpl implements FriendDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;				
	}
	
	public FriendDAOImpl() {
		System.out.println("pConstructor:"+getClass());
	}

	@Override
	public void reqFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(friend);
		sqlSession.insert("FriendMapper.reqFriend", friend);
	}

	@Override
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stu
		
		List<Friend> listRecvFriend = sqlSession.selectList("FriendMapper.listRecvFriend",recvFriendId);
		
		for(int i=0 ; i<listRecvFriend.size() ; i++) {
			listRecvFriend.get(i).setReqFriend((User)sqlSession.selectOne("UserMapper.getUser", listRecvFriend.get(i).getReqFriend().getUserId()));
		}
		return listRecvFriend;
		
	}

	@Override
	public Friend getRecvFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FriendMapper.getRecvFriend", friendNo);
	}

	@Override
	public Friend getFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FriendMapper.getFriend", recvFriendId);
	}

	@Override
	public int getTotalCount(String recvFriend) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void okFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		
		String reqFriendId = friend.getReqFriend().getUserId();
		String recvFriendId = friend.getRecvFriend().getUserId();
		Map<String, Object> map = new HashMap();
		
		map.put("reqFriendId", reqFriendId);
		map.put("recvFriendId", recvFriendId);
		
//		sqlSession.insert("FriendMapper.addFriend", map);
		

			
		sqlSession.update("FriendMapper.okFriend", map);
	}

	@Override
	public void denyFriend(Friend friend) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("friendMapper.denyFriend", friend);
	}
	
	@Override
	public void delFriend(String reqFriendId, String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("reqFriendId", reqFriendId);
		map.put("recvFriendId", recvFriendId);
		
		sqlSession.update("friendMapper.delFriend", map);
	}

	@Override
	public List<Friend> listFriend(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		List<Friend> listFriend = sqlSession.selectList("FriendMapper.listFriend",reqFriendId);
		
		for(int i=0 ; i<listFriend.size() ; i++) {
			listFriend.get(i).setRecvFriend((User)sqlSession.selectOne("UserMapper.getUser", listFriend.get(i).getRecvFriend().getUserId()));
		}
		return listFriend;
	}

	@Override
	public List<Friend> friendList(String reqFriendId) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(reqFriendId);
		
		List<Friend> friendList = sqlSession.selectList("FriendMapper.friendList", reqFriendId);
		for(int i=0; i<friendList.size(); i++) {
			friendList.get(i).setRecvFriend((User)sqlSession.selectOne("UserMapper.getUser", friendList.get(i).getRecvFriend().getUserId()));
		}
		
		
		System.out.println(reqFriendId);

		System.out.println(friendList);
		return friendList;

	}

}