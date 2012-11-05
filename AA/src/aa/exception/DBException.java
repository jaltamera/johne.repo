package aa.exception;

public class DBException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1072715956731222395L;
	String mistake;
	//----------------------------------------------
	// Default constructor - initializes instance variable to unknown
	public DBException()
	{
		super();             // call superclass constructor
		mistake = "Error connecting to DB";
		System.out.println(Thread.currentThread().getName() + ": " + mistake);
	}

	//-----------------------------------------------
	// Constructor receives some kind of message that is saved in an instance variable.
	public DBException(String err)
	{
		super(err);     // call super class constructor
		mistake = err;  // save message
	}

	//------------------------------------------------  
	// public method, callable by exception catcher. It returns the error message.
	public String getError()
	{
		return mistake;
	}
}
