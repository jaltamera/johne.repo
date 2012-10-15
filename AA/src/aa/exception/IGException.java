package aa.exception;

public class IGException extends Exception {
	
	String mistake;
	//----------------------------------------------
	// Default constructor - initializes instance variable to unknown
	public IGException()
	{
		super();             // call superclass constructor
		mistake = "Error connecting to IG";
		System.out.println(mistake);
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
