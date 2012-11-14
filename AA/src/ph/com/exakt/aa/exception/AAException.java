package ph.com.exakt.aa.exception;

public class AAException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1329626990089742669L;
	String mistake;
	//----------------------------------------------
	// Default constructor - initializes instance variable to unknown
	
	public AAException()
	{
		super();             // call superclass constructor
		mistake = "Error connecting to AA";
		System.out.println(Thread.currentThread().getName() + ": " + mistake);
	}

	//-----------------------------------------------
	// Constructor receives some kind of message that is saved in an instance variable.
	public AAException(String err)
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
