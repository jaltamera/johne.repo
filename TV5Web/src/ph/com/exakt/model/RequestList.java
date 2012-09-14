package ph.com.exakt.model;

import java.util.ArrayList;
import java.util.List;

public class RequestList{
	
	private static volatile ArrayList<Object> objects = new ArrayList<Object>();
	
	public static synchronized void add(Object obj){
		objects.add(obj);
	}
	
	public static synchronized List<Object> getList(){
		return RequestList.objects;
	}
	
	public static synchronized Object get(int x){
		return objects.get(x);
	}
	
	public static synchronized void remove(int x){
		objects.remove(x);
	}
}
