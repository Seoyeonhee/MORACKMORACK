package com.morackmorack.mvc.service.friend.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.morackmorack.mvc.service.domain.Friend;
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
		sqlSession.insert("FriendMapper.reqFriend", friend);
	}

	@Override
	public List<Friend> listRecvFriend(String recvFriendId) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recvFriendId",recvFriendId);
		
		List<Friend> list = sqlSession.selectList("FriendMapper.listRecvFriend",map);
		
		for(int i=0 ; i<list.size() ; i++) {
			list.get(i).setRecvFriend((User)sqlSession.selectOne("UserMapper.getUser", list.get(i).getRecvFriend().getUserId()));
		}
		return list;
		
	}

	@Override
	public Friend getRecvFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FriendMapper.getRecvFriend", friendNo);
	}

	@Override
	public Friend getFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FriendMapper.getFriend", friendNo);
	}

	@Override
	public int getTotalCount(String recvFriend) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void mangFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		
			sqlSession.update("friendMapper.denyFriend", friendNo);
		
			sqlSession.update("friendMapper.okFriend",friendNo);
	}

	@Override
	public void delFriend(int friendNo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Friend> listFriend(String userId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}