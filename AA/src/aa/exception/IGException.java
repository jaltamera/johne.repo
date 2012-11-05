package aa.exception;

public class IGException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1932887033826944180L;
	
	String mistake;
	//----------------------------------------------
	// Default constructor - initializes instance variable to unknown
	public IGException(int responseCode)
	{
		super();             // call superclass constructor
		mistake = "Error connecting to IG";
		System.out.println(Thread.currentThread().getName() + ": " + mistake + " with response code: " + responseCode);
	}

	//-----------------------------------------------
	// Constructor receives some kind of message that is saved in an instance variable.
	public IGException(String err)
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
