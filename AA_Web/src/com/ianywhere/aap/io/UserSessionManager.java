package com.ianywhere.aap.io;

import com.dejima.core.io.Context;
import com.dejima.core.kernel.ChainIdentifier;
import com.dejima.core.nlp.text.action.XmlActuation;
import com.dejima.utils.TimedHashtable;

public class UserSessionManager {

	private static TimedHashtable timedHashTable = null;
	//private static long DEFAULT_TIME = 450000; //15 mins
	private static long DEFAULT_TIME = 150000; //5 mins
	//private static long DEFAULT_TIME = 75000; //2.5 mins

	private static UserSessionManager _instance = null;

	private UserSessionManager()
	{
		timedHashTable = new TimedHashtable();
		timedHashTable.setTimeOut(DEFAULT_TIME);
	}
	public static synchronized UserSessionManager getUserSessionManager()
	{
		if (null==_instance)
			_instance = new UserSessionManager();
		return _instance;
	}
	public void init(long time)
	{
		timedHashTable.setTimeOut(time); //15 mins
		timedHashTable.startCleanupThread(10*60*1000);
	}
	public void setChainID(String userId, ChainIdentifier id, Context myContext)
	{
		UserContext userCtx = (UserContext)id.getSession();
		userCtx.setActuation((XmlActuation)myContext.getPreviousActuation());
		userCtx.setContext(myContext);
		timedHashTable.remove(userId);
		//ChainIdentifier chainID  = new ChainIdentifier (userId, userCtx);
		timedHashTable.put(userId, id);
	}
	public ChainIdentifier getChainID(String userId)
	{
		ChainIdentifier chainID=null;

		if(userId != null && userId.length() > 0)
		{
			if((chainID=(ChainIdentifier)timedHashTable.get(userId)) == null)
			{
				try
				{
					chainID = new ChainIdentifier(userId, createUserContext(userId));
					timedHashTable.put(userId, chainID);
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			}
		}
		return chainID;
	}

	private Object createUserContext(String userId)
	{
		UserContext userCtx = new UserContext(userId, userId , new XmlActuation(), Context.createExternalContext());
		return userCtx;
	}

}
