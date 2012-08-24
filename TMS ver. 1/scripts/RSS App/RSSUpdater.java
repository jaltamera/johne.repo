

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class RSSUpdater {
	
    public static void main(String args[]){
        
        Timer timer = new Timer();
        
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY, 06);
        calendar.set(Calendar.MINUTE, 00);
        calendar.set(Calendar.SECOND, 0);
        Date time = calendar.getTime();
               
        timer.schedule(new RSSUpdater().new InnerFeedUpdater(), time, 300000);
        //timer.schedule(new DateTask(), time);
        
    }
    
    class InnerFeedUpdater extends TimerTask{
    	
    	public void run(){
    		
    		RSSFeedParser parser = new RSSFeedParser("http://mmdatraffic.interaksyon.com/livefeed");  //http://mmdatraffic.interaksyon.com/livefeed/
    		Feed feed = parser.readFeed();
		
    		/*for (FeedMessage message : feed.getMessages()) {
    			System.out.println(message);

    		}*/
    	}
    }
}
