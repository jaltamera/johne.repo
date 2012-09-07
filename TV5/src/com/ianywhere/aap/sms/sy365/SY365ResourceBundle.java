package com.ianywhere.aap.sms.sy365;

import java.util.ResourceBundle;

public class SY365ResourceBundle {

    // load resource bundle.
    protected static final ResourceBundle Sy365Resource =
        ResourceBundle.getBundle(
            "com.ianywhere.app.sms.sy365.SY365");

    public static final String getResource(String resourceName)
    {
        String result = resourceName;
        if (Sy365Resource != null)
            result = Sy365Resource.getString(resourceName);
        else
            System.out.println("SY365 resource bundle not found.");
        return result;
    }
    
    public static void main (String args[])
    {
    	String url = Sy365Resource.getString("sy365.url");
    	System.out.println(url);
    }
}
