package com.interaksyon.formatter;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Vector;

import com.dejima.core.io.Context;
import com.dejima.core.io.HTMLPresentationFormatter;
import com.dejima.core.nlp.text.action.FieldActuation;
import com.dejima.core.nlp.text.action.FieldInfo;
import com.dejima.core.nlp.text.action.InterpretationActuation;
import com.dejima.core.nlp.text.action.ObjectResults;
import com.dejima.core.serviceProviders.MissingField;
import com.dejima.utils.log.LogManager;
import com.interaksyon.sql.ConnectDB;

public class SMSFormatter extends HTMLPresentationFormatter{

	Properties props = new Properties();

	private String roadName = "";
	private String road = "";
	private String exitName = "";
	private String flow = "";
	private String bound = "";

	protected static final LogManager logger = new LogManager(SMSFormatter.class);

	@Override
	protected void addMissingFieldQuestions(InterpretationActuation interpretationActuation,Context context, ObjectResults objectResults, StringBuffer output){

		this.fieldsInit(interpretationActuation);

		if(!road.equals("")){
			//logger.info("Display missing field question");
			this.propertiesInit("tv5/explanation.properties");//C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/explanation.properties");

			// Set Missing Field Topic(s)
			MissingField missingField = new MissingField();
			missingField = objectResults.getMissingField(0);
			context.setMissingFieldTopic(objectResults, missingField, getNumberedListSynonymTable());

			// Set Output
			output.replace(0, output.length(), "");

			output.append(props.getProperty("header") + MessageFormat.format(props.getProperty("asOf"), new Object[]{Calendar.getInstance().getTime()}) + "<br>");

			if(objectResults.getMissingFieldsSize() > 0){

				Object[] object = new Object[4];
				object[0] = objectResults.getRecord(0).get(0);
				object[1] = objectResults.getRecord(0).get(0);

				Random randomGenerator = new Random();

				object[2] = objectResults.getRecord(randomGenerator.nextInt(objectResults.getRecords().size())).get(2);
				object[3] = objectResults.getRecord(randomGenerator.nextInt(objectResults.getRecords().size())).get(2);

				output.append("<br>" + MessageFormat.format(props.getProperty("missingExit"), object) + "<br><br>");
			}else
				output.append("<br>" + props.getProperty("maxResults") + "<br><br>");			

			output.append(props.getProperty("footer"));
		}else{
			logger.warn("Displaying all possible values");
			objectResults.setMissingFields(new ArrayList());
			addResultsTable(objectResults, output);
		}
	}

	@Override
	protected void addResults(InterpretationActuation interpretationActuation, Context context, StringBuffer output){		
		
		/*
		 * catch all reply
		 */
		if((interpretationActuation.unableToInterpret() && 
				context.getNarrowDownTopic() == null) || 
				interpretationActuation.explicitReset() || 
				interpretationActuation.getInputString().equalsIgnoreCase("help") || 
				interpretationActuation.getInputString().trim().equals("")){
			
			this.propertiesInit("tv5/menu.properties");			// absoulte path --> C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/menu.properties");

			output.replace(0, output.length(), "");

			output.append(props.getProperty("header")+"<br>");

			for(int x = 1; x <= 9; x++){
				output.append(x + ". " + props.getProperty("opt"+x) + "<br>");
			}

			output.append(props.getProperty("footer"));
			
			context.clear();
			road = "";
			return;
		}

		if(!interpretationActuation.unableToInterpret() &&
				context.getNarrowDownTopic() == null &&
				!interpretationActuation.explicitReset()){ 			
			context.clear(); 
		}

		if(output.toString().equals(""))
			super.addResults(interpretationActuation, context, output);
	}

	@Override
	protected void addResultsTable(ObjectResults objectResults, StringBuffer output){
		
		if(objectResults.getMissingFields().size() == 0){

			output.replace(0, output.length(), "");
			this.propertiesInit("tv5/explanation.properties");//C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/explanation.properties");

			FieldInfo[] fieldInfo = objectResults.getFieldInfos();

			// Display the header
			output.append(props.getProperty("header") + MessageFormat.format(props.getProperty("asOf"), new Object[]{Calendar.getInstance().getTime()}) + "<br>");

			if(fieldInfo != null){

				if(objectResults.getNumberOfRecords() < 1){

					this.fieldsInit(objectResults);

					Map<String,String> elems = new HashMap<String, String>();
					elems.put("L", "Light Traffic");
					elems.put("M", "Moderate Traffic");
					elems.put("H", "Heavy Traffic");
					elems.put("MH", "Moderate-Heavy Traffic");
					elems.put("ML", "Light-Moderate Traffic");
					elems.put("SB", "South Bound");
					elems.put("NB", "North Bound");

					output.append("<br>");

					if(!road.equals("")){
						output.append("Walang matagpuan sa " + road.toUpperCase());

						if(!exitName.equals(""))
							output.append(" - " + exitName.toUpperCase());

						if(!flow.equals(""))
							output.append(" na " + elems.get(flow.toUpperCase()));

						if(!bound.equals(""))
							output.append(" sa " + elems.get(bound.toUpperCase()));

					}
					else if(!exitName.equals("")){
						output.append("Walang matagpuan sa " + exitName.toUpperCase());

						if(!flow.equals(""))
							output.append(" na " + elems.get(flow.toUpperCase()));

						if(!bound.equals(""))
							output.append(" sa " + elems.get(bound.toUpperCase()));

					}else{
						output.append("Walang matagpuan na ");

						if(!flow.equals(""))
							output.append(elems.get(flow.toUpperCase()) + " - ");

						if(!bound.equals(""))
							output.append(elems.get(bound.toUpperCase()));

						output.append("sa mga oras na ito");
					}

					//					output.append("<br>" + "Walang resulta para sa " + objectResults.getObjectActuation().getInputString() + ". " +
					//							"Siguraduhing tama ang pagkakabaybay ng lahat ng salita, subukan ang ibang mga keyword at magtext ulit." + "<br>");

					output.append("<br>");

					elems.clear();

				}else{
					roadName = "";

					this.fieldsInit(objectResults);

					if(exitName.equals("")){

						//output.append("<br>(" + objectResults.getRecord(0).get(2) + " - " + objectResults.getRecord(objectResults.getNumberOfRecords() - 1).get(2) + ")");

						logger.warn("No exit entered");

						//this.fieldsInit(objectResults);
						String query1 = "select exit_name from tbl_exit where MID = (SELECT MAX(t1.MID) from tbl_exit t1, tbl_main t2 where t2.road_name  like '%"+road.toUpperCase()+"%' and t1.main_id = t2.ID) or MID = (SELECT MIN(t1.MID) from tbl_exit t1, tbl_main t2 where t2.road_name  like '%"+road.toUpperCase()+"%' and t1.main_id = t2.ID) ";
						String query2 = "SELECT t2.road_name, t1.flow, t1.exit_name, t1.bound from tbl_exit t1, tbl_main t2 where (t1.flow = 'H' or t1.flow = 'MH') and t2.road_name like '%" + road + "%' and t1.main_id = t2.ID";

						if(!bound.equals(""))
							query2 += " and bound like '" + bound + "'";

						try{

							ConnectDB cdb = new ConnectDB();
							List paramList;

							paramList = new ArrayList();
							paramList.add("exit_name");

							List records1 = cdb.executeCustomSQL(query1, paramList);

							if(records1.size() > 0){
								output.append("<br>(" + ((List)records1.get(0)).get(0) + " - " + ((List)records1.get(1)).get(0) + ")");

								if(!bound.equals(""))
									output.append(" " + bound.toUpperCase());

							}else
								logger.warn("Query returned 0 result... Check your query");


							paramList = new ArrayList();

							paramList.add("road_name");
							paramList.add("flow");
							paramList.add("exit_name");
							paramList.add("bound");

							List records2 = cdb.executeCustomSQL(query2, paramList);					

							if(records2.size() == 0)
								output.append("<br>Maayos ang daloy ng trapiko sa kahabaan ng " + road.toUpperCase() + " sa mga oras na ito.<br>");

							int maxResultsVal =  (records2.size() > 15) ? 15 : records2.size();

							for(int x = 0 ; x < maxResultsVal; x++){
								addResultsTableRecord(null, (List)records2.get(x) , output);	
							}	

						}catch(Exception e){
							logger.error("Error when trying to execute the query:" + query1 + " " + query2 + " " + e);
						}

					}else{					
						int maxResultsVal =  (objectResults.getMissingFieldsSize() > 15) ? 15 : objectResults.getNumberOfRecords();

						//logger.info(maxResultsVal);

						List records = objectResults.getRecords();

						java.util.Collections.sort(records, new java.util.Comparator(){
							public int compare(Object o1, Object o2) {
								List l1 = (List)o1;
								List l2 = (List)o2;
								return l1.get(0).toString().compareToIgnoreCase(l2.get(0).toString());
							}
						}
								);

						for(int x = 0; x < maxResultsVal; x++){
							List record = (List)records.get(x);
							addResultsTableRecord(fieldInfo, record, output);		
						}
					}


					//roadName = "";
				}
			}

			//			 Display the footer
			output.append("<br>" + props.getProperty("footer"));
		}

	}

	@Override
	protected void addResultsTableRecord(FieldInfo[] fieldInfo, List record, StringBuffer output){

		if(!roadName.equals(record.get(0)) ){

			roadName = record.get(0).toString();
			output.append("<br>" + roadName + "<br>");
		}

		output.append(record.get(2) + ": " + record.get(3) + "-" + record.get(1) + "<br>");
		//}
	}

	//Not in Use
	@Override
	protected void addResultsTableFieldValue(FieldInfo fieldInfo, Object fieldValue, StringBuffer output){
		output.append(fieldValue.toString() + "<br>");
	}

	@Override
	protected void addAmbiguousObjectsQuestions(InterpretationActuation interpretation,
			Context context,
			java.lang.StringBuffer output){
		
		int tariff = 0;
		
		try {

			bound = "";
			flow = "";
			road = "";
			exitName = "";
			
			this.fieldsInit(interpretation);
			
			ConnectDB cdb = new ConnectDB();

			Vector exitVector = interpretation.findXmlElement("ExitName");
			Vector roadVector = interpretation.findXmlElement("RoadName");
			
			BufferedReader br = new BufferedReader(new FileReader(new File("tv5/to_synonyms.text")));
			String toSynonyms = "";

			while((toSynonyms = br.readLine()) != null){

				if(interpretation.getInputString().matches("(?i).* "+toSynonyms+" .*")){

					roadName = "";

					output.replace(0, output.length(), "");
					this.propertiesInit("tv5/explanation.properties");//C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/explanation.properties");

					output.append(props.getProperty("header") + MessageFormat.format(props.getProperty("asOf"), new Object[]{Calendar.getInstance().getTime()}) + "<br>");				

					if(exitVector.size() > 1){
						
						String query = "call proc_retrieveResult(?,?)";

						List records = cdb.executeCallStatementQuery(query, exitVector);
							
						if(records.size() < 1){

							String query1 = "SELECT top 1 tbl1.main_id FROM (select * from tbl_exit where exit_name like '%"+((FieldActuation)exitVector.get(0)).getText().getValue().toUpperCase()+"%') as tbl1, (select * from tbl_exit where exit_name like '%"+((FieldActuation)exitVector.get(1)).getText().getValue().toUpperCase()+"%') as tbl2 WHERE tbl1.main_id = tbl2.main_id";

							List paramList = new ArrayList();
							paramList.add("main_id");

							List record = cdb.executeCustomSQL(query1, paramList);

							if(record.size() < 1){
								output.append(props.getProperty("diffPts"));
								tariff = 1;
							}
							else
								//if(interpretation.findXmlElement("RoadName").get(0) != null)
								output.append(MessageFormat.format(props.getProperty("roadOk"), new Object[]{((FieldActuation)exitVector.get(0)).getText().getValue().toUpperCase(),((FieldActuation)exitVector.get(1)).getText().getValue().toUpperCase()}));

						}else{
							
							output.append("<br>(" + ((FieldActuation)exitVector.get(0)).getText().getValue().toUpperCase() + " - " + ((FieldActuation)exitVector.get(1)).getText().getValue().toUpperCase() + ")");

							for(int x = 0 ; x < records.size(); x++){
								addResultsTableRecord(null, (List)records.get(x) , output);	
							}	
							records.clear();

						}

						//context.setAmbiguousObjectsTopic(null, null);
						interpretation.setAmbiguous(false);
						interpretation.findAndRemoveXml("Ambiguity");
						interpretation.findAndRemoveXml("Ambiguities");

					}else{
						output.append(props.getProperty("diffPts"));
						tariff = 1;
					}
						
					
					
					if(tariff == 1){
						output.append(tariff);
						output.append("<br>" + props.getProperty("freeFooter"));
					}else{
						output.append("<br>" + props.getProperty("footer"));
					}
					
					context.clear();
					return;
				}
			}

			if(exitVector.size() > 0){
				
				roadName = "";
				
				List records = cdb.getRecords(exitVector, flow, bound, roadVector);

				output.replace(0, output.length(), "");
				this.propertiesInit("tv5/explanation.properties");//C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/explanation.properties");

				output.append(props.getProperty("header") + MessageFormat.format(props.getProperty("asOf"), new Object[]{Calendar.getInstance().getTime()}) + "<br>");				

				if(records.size() < 1){
					output.append(props.getProperty("diffPts"));
					tariff = 1;
				}else{

					for(int x = 0 ; x < records.size(); x++){
						addResultsTableRecord(null, (List)records.get(x) , output);	
					}	
					records.clear();

				}
				
				if(tariff == 1){
					output.append(tariff);
					output.append("<br>" + props.getProperty("freeFooter"));
				}else{
					output.append("<br>" + props.getProperty("footer"));
				}

				//context.setAmbiguousObjectsTopic(null, null);
				interpretation.setAmbiguous(false);
				interpretation.findAndRemoveXml("Ambiguity");
				interpretation.findAndRemoveXml("Ambiguities");

				context.clear();
				
				return;
			}
			
			if(roadVector.size() > 1){
				
				if(!((FieldActuation)roadVector.get(0)).getText().getValue().equals(((FieldActuation)roadVector.get(1)).getText().getValue()) || (roadVector.size() > 1 && exitVector.size() == 0)){
					output.replace(0, output.length(), "");
					this.propertiesInit("tv5/explanation.properties");//C:/Program Files/Answers Anywhere Platform 5.2.0/IDE/include/classes/com/interaksyon/formatter/explanation.properties");

					output.append(props.getProperty("header") + MessageFormat.format(props.getProperty("asOf"), new Object[]{Calendar.getInstance().getTime()}) + "<br>");				

					output.append(props.getProperty("diffPts"));
					output.append("<br>" + props.getProperty("freeFooter"));
					tariff = 1;
					output.append(tariff);
				}
			}
					
			super.addAmbiguousObjectsQuestions(interpretation, context, output);

		} catch (IOException e) {
			logger.error(e + " #SMSF1");
		} catch (Exception ex) {
			logger.error(ex + " #SMSF2");
		}
	}

	private void propertiesInit(String path){
		try {
			props.load(new FileInputStream(path));
		} catch (FileNotFoundException e) {
			logger.error(e + " #SMSF3");
		} catch (IOException e) {
			logger.error(e + " #SMSF4");
		}
	}

	private void fieldsInit(ObjectResults objectResults){

		road = "";
		exitName = "";
		bound = "";
		flow = "";

		Vector roadVector = objectResults.getObjectActuation().findXmlElement("RoadName");
		if(roadVector != null &&  roadVector.size() > 0){
			FieldActuation roadFieldActuation = (FieldActuation) roadVector.get(0);
			road = roadFieldActuation.getText().getValue();
		}

		Vector exitVector = objectResults.getObjectActuation().findXmlElement("ExitName");
		if(exitVector != null &&  exitVector.size() > 0){
			FieldActuation exitFieldActuation = (FieldActuation) exitVector.get(0);
			exitName = exitFieldActuation.getText().getValue();
		}

		Vector boundVector = objectResults.getObjectActuation().findXmlElement("Bound");
		if(boundVector != null &&  boundVector.size() > 0){
			FieldActuation boundFieldActuation = (FieldActuation) boundVector.get(0);
			bound = boundFieldActuation.getText().getValue();
		}

		Vector flowVector = objectResults.getObjectActuation().findXmlElement("Flow");
		if(flowVector != null &&  flowVector.size() > 0){
			FieldActuation flowFieldActuation = (FieldActuation) flowVector.get(0);
			flow = flowFieldActuation.getText().getValue();
		}
	}

	private void fieldsInit(InterpretationActuation interpretation){

		Vector roadVector = interpretation.findXmlElement("RoadName");
		if(roadVector != null &&  roadVector.size() > 0){
			FieldActuation roadFieldActuation = (FieldActuation) roadVector.get(0);
			road = roadFieldActuation.getText().getValue();
		}

		Vector exitVector = interpretation.findXmlElement("ExitName");
		if(exitVector != null &&  exitVector.size() > 0){
			FieldActuation exitFieldActuation = (FieldActuation) exitVector.get(0);
			exitName = exitFieldActuation.getText().getValue();
		}

		Vector boundVector = interpretation.findXmlElement("Bound");
		if(boundVector != null &&  boundVector.size() > 0){
			FieldActuation boundFieldActuation = (FieldActuation) boundVector.get(0);
			bound = boundFieldActuation.getText().getValue();
		}

		Vector flowVector = interpretation.findXmlElement("Flow");
		if(flowVector != null &&  flowVector.size() > 0){
			FieldActuation flowFieldActuation = (FieldActuation) flowVector.get(0);
			flow = flowFieldActuation.getText().getValue();
		}
	}
}
