package com.interaksyon.serviceProvider;

import java.util.Vector;

import com.dejima.core.nlp.text.action.CommandActuation;
import com.dejima.core.nlp.text.action.FieldActuation;
import com.dejima.core.nlp.text.action.ObjectActuation;
import com.dejima.core.nlp.text.action.ObjectResults;
import com.dejima.core.nlp.text.action.Results;
import com.dejima.core.serviceProviders.FieldDefinition;
import com.dejima.core.serviceProviders.MissingField;
import com.dejima.core.serviceProviders.ObjectDefinition;
import com.dejima.serviceProviders.DatabaseServiceProvider;
import com.dejima.utils.log.LogManager;

public class RoadServiceProvider extends DatabaseServiceProvider{
	
public static final String NAME = "RoadServiceProvider";
	
	protected static final LogManager logger = new LogManager(RoadServiceProvider.class);
	
	public RoadServiceProvider(){
		super();
		setName(RoadServiceProvider.class.getName());
	}
	
	@Override
	public boolean processObjectActuationRequest(CommandActuation commandActuation, ObjectActuation objectActuation, ObjectDefinition objectDefinition, Results results, ObjectResults objectResults){		
			
		boolean flag = true;
//		this.maxResultsVal = 15;

		flag = super.processObjectActuationRequest(commandActuation, objectActuation, objectDefinition, results, objectResults);
		
		if(!flag){
			logger.info("super.processObjectActuationRequest is false");
		}
		

		if(objectResults.isMaximumRecordsReturned() /*&& !more*/){
			
			logger.warn("Max Result achieved");
			FieldDefinition field = (FieldDefinition) objectDefinition.getFields().get(0);
			
			MissingField missingField = MissingField.createMissingField(field);
			objectResults.addMissingField(missingField);
				
		}else
			objectActuation.findAndRemoveXml("MissingField");
		
		
					
		return true;
	}
}
