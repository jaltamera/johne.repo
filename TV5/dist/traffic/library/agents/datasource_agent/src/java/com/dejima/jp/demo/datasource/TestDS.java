/*
 * TestDS.java
 *
 * Copyright 2002 - Dejima Japan, Inc.
 */

package com.dejima.jp.demo.datasource;

import java.util.*;
import org.w3c.dom.Element;
import com.dejima.core.nlp.text.*;
import com.dejima.library.datasource.*;
import com.dejima.jp.xml.DOMUtil;

/**
 * The sample data source implementation.
 */
public class TestDS implements DataSource
{
    /**
     * XML tags to get configurations.
     */
    static final String XML_NAMESPACE = "http://www.dejima-japan.com/demo/DataSourceAgent/TestDS";
    static final String ELEM_TOKENS = "Tokens";
    static final String ELEM_TOKEN = "Token";
    static final String ELEM_KEY = "Key";
    static final String ELEM_VALUE = "Value";

    /**
     * The container of key and token pairs.
     */
    Map datas;

    /**
     * Open the data source.
     * This method is invoked when the data source is created by the DataSourceAgent.
     * @param config the XML element which describes about configuration of the data source.
     *    It belongs the namespace "http://www.dejima-japan.com/DataSourceAgent" and element name is "Config".
     *    You can write any element, it can be in other namespaces, in this element.
     *    The application specific configuration is embedded under this element.
     *    If no configration is specified in the descriptor, the null is set.
     * @exception DataSourceException fail to close the data source.
     */
    public void open(Element config) throws DataSourceException
    {
	System.out.println("*** Open");
	// read data from config
	datas = new HashMap();
	Element tokensElem = DOMUtil.getElementNS(config, XML_NAMESPACE, ELEM_TOKENS);
	if (tokensElem == null) {
	    throw new DataSourceException("Found no element in configuration: " + ELEM_TOKENS);
	}
	for (Iterator ite = DOMUtil.getElementsNS(tokensElem, XML_NAMESPACE, ELEM_TOKEN); ite.hasNext();) {
	    Element tokenElem = (Element)ite.next();
	    String key = DOMUtil.getString(DOMUtil.getElementNS(tokenElem, XML_NAMESPACE, ELEM_KEY));
	    String value = DOMUtil.getString(DOMUtil.getElementNS(tokenElem, XML_NAMESPACE, ELEM_VALUE));
	    datas.put(key, new TextInput(value));
	    System.out.println("load token: (" + key + "," + value + ")");
	}
    }

    /**
     * Close the data source.
     * This method is invoked when the data source is released by the DataSourceAgent.
     * @exception DataSourceException fail to close the data source.
     */
    public void close() throws DataSourceException
    {
	System.out.println("*** close");
	datas.clear();
    }

    /**
     * Returns the all key and token pairs from the data source.
     * The key is used to the actuated value to specify which data entry matches the token.
     * @param hints tokens which a user inputs. This might be used as the key to filter out the irrelevant records.
     * @return the set of key (String) and token (TextInput) pairs.
     * @exception DataSourceException fail to obtain data sets from data source.
     */
    public Map getDatas(TextToken[] hints) throws DataSourceException
    {
	return datas;
    }

    /**
     * Set the resource search path
     * @param resourceSearchPath
     */
    public void setResourceSearchPath(String resourceSearchPath)
    {
    }
}







