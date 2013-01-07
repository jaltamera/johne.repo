/*
 * @Author: 	Johne Altamera
 * @Date: 		12/06/2012
 * @version 4.0
 * No copyright
 */

package ph.com.exakt.sql.pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Vector;

/**
* 	<p>JDBC Connection Pool</p>
* 	<p>Implementation of a standard JDBC connection pool.</p>
*/

public class JDCConnectionPool {
	
	/**
	 * Container that will contain the connections. 
	 */
	private Vector 				connections;
	
	/**
	 * String that specifies information about a data source and the means of connecting to it.
	 */
	private String 				connectionString;
	
	/**
	 * Reference to ConnectionReaper class
	 */
	private ConnectionReaper 	reaper;				
	
	/**
	 * Staled connection threshold (10 minutes)
	 * The maximum time that any SQL single statement may last.
	 */
	final private long 			timeout=60000;	
	
	/**
	 * Limit for maximum open connections
	 */
	final private int 			poolsize=10;		
	
	/**
	 * Constructor
	 * By default, maximum pool size is set to 10,
	 * maximum opened connections is 10,
     * connection timeout is 5 minutes.
     * Start the connection reaper
	 * @param connectionString
	 */
	public JDCConnectionPool(String connectionString) {
		
		/* change the input parameter to connectionString instead of url, user and password */
		//private String url, user, password;
		
		/* 
		 * String url, 
		 * String user, 
		 * String password
		 */
		
		/* this.url = url;
	      this.user = user;
	      this.password = password;*/
		
		this.connectionString = connectionString;
		connections = new Vector(poolsize);
		reaper = new ConnectionReaper(this);
		reaper.start();
	}
	
	/**
	 * Called from the connection reaper daemon thread every n-minutes for maintaining the pool clean
     */
	public synchronized void reapConnections() {

		long stale = System.currentTimeMillis() - timeout;
		Enumeration connlist = connections.elements();
		
		// Remove each connection that is not in use or
		// is stalled for more than maximun usage timeout (default 10 mins)
		
		while((connlist != null) && (connlist.hasMoreElements())) {
			JDCConnection conn = (JDCConnection)connlist.nextElement();

			if((conn.inUse()) && (stale > conn.getLastUse()) && 
					(!conn.validate())) {
				removeConnection(conn);
			}
		}
	}
	
	/**
	 * Close all connections from the pool regardless of their current state
	 */
	public synchronized void closeConnections() {

		Enumeration connlist = connections.elements();

		while((connlist != null) && (connlist.hasMoreElements())) {
			JDCConnection conn = (JDCConnection)connlist.nextElement();
			removeConnection(conn);
		}
	}
	
	/**
     * Close and remove one connection from the pool
	 * @param conn Connection to close
	 */
	private synchronized void removeConnection(JDCConnection conn) {
		connections.removeElement(conn);
	}

	/**
	 * Get a connection from the pool
	 * @return Opened JDCConnection
     * @throws SQLException If getMaxPoolSize() opened connections is reached an
     * SQLException with SQLState="08004" will be raised upon calling getConnection().<br>
     * <b>Microsoft SQL Server</b>: Connection reuse requires that SelectMethod=cursor was
     * specified at connection string.
     */
	public synchronized Connection getConnection() throws SQLException {

		JDCConnection c;
		for(int i = 0; i < connections.size(); i++) {
			c = (JDCConnection)connections.elementAt(i);
			if (c.lease()) {
				return c;
			}
		}

		Connection conn = DriverManager.getConnection(connectionString);//DriverManager.getConnection(url, user, password);
		c = new JDCConnection(conn, this);
		c.lease();
		connections.addElement(c);
		return c;
	} 
	
	/**
	 * Return a connection to the pool
     * @param conn JDCConnection returned to the pool
     */
	public synchronized void returnConnection(JDCConnection conn) {
		conn.expireLease();
	}
}