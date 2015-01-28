package com.omg.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.omg.dto.*;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Autowired
	private SqlSession sqlSession;
		
	@Override
	public int insertMessage(Messages msg) {
		int ret =sqlSession.insert("com.omg.message.sendMessage", msg);
		return ret;
	}
	
	@Override
	public List<Messages> selectMsgs(int page,String userId) {
		Map pageInfo = new HashMap();
		int startPage = (page-1) * 5 + 1;
		int endPage = startPage + (5 - 1);
		pageInfo.put("startPage", startPage);
		pageInfo.put("endPage", endPage);
		pageInfo.put("receiveId", userId);
		List<Messages> list = sqlSession.selectList("com.omg.message.selectMsgs", pageInfo);
		return list;
	}

	@Override
	public int totalCount(String userId) {
		int totalCount = sqlSession.selectOne("com.omg.message.totalCount",userId);
		return totalCount;
	}

	@Override
	public Messages selectDetail(int num) {
		Messages msg =sqlSession.selectOne("com.omg.message.selectByNum", num);
		return msg;
	}

	@Override
	public List<Messages> selectMsgByName(Messages msg) {
		Map msgInfo = new HashMap();
		int startPage = (msg.getPage()-1) * 5 + 1;
		int endPage = startPage + (5 - 1);
		msgInfo.put("startPage", startPage);
		msgInfo.put("endPage", endPage);
		msgInfo.put("receiveId", msg.getReceiveId());
		msgInfo.put("sendId", msg.getSendId());
		List<Messages> list =sqlSession.selectList("com.omg.message.selectMsgByName", msgInfo);
		return list;
	}
	
	@Override
	public int totalByNameCount(Messages msg) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("receiveId", msg.getReceiveId());
		map.put("sendId", msg.getSendId());
		int totalByNameCount = sqlSession.selectOne("com.omg.message.totalCountByName",map);
		return totalByNameCount;
	}

	@Override
	public int deleteMessage(int[] msgnums) {
		int ret = sqlSession.delete("com.omg.message.deleteMsg", msgnums);
		return ret;
	}

	

}
