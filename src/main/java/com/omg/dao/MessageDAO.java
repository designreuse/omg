package com.omg.dao;

import java.util.*;

import com.omg.dto.*;

public interface MessageDAO {
	int insertMessage(Messages msg);
	int deleteMessage(int[] msgnums);
	List<Messages> selectMsgs(int page,String userId);
	int totalCount(String userId);
	Messages selectDetail(int num);
	List<Messages> selectMsgByName(Messages msg);
	int totalByNameCount(Messages msg);
	List<Messages> msgLatelyByDate(String userId);
}
