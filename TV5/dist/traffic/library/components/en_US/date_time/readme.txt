Description:

There are a number of date-time components provided with the Answers Anywhere Platform. The simplest are the Date and Time 
components, which interpret dates and times respectively. Dates can be explicitly defined ("2/2/04") or defined 
relatively ("last week", "next month"). Dates can also be expressed in words  ("thursday 12 june"). The date fields 
that are interpreted are days, months, quarters, and years. The Time component interprets both explicit times ("12.32 pm") 
and relative time ("in three hours"). Times may be expressed numerically or alpha-numerically.

The Date and Time components are combined as subcomponents of the Date_Time and Start_End_Date_Time 
components. The Date_Time component interprets both dates and times. Refer to the date_time.smp
file for a corpus of inputs that are interpreted by this component. Some examples are: "2/2/04 at 2:34 pm",
and "morning after 8:30". The Date_Time component converts the relative date and times to absolute date times.
For example if today is June 12, 2006 then the input "tomorrow morning after 8:30" is translated to:

<date_time:DejimaInterpretation xmlns:date_time="date_time" type="interpretation">
  <date_time:Input><![CDATA[tomorrow morning after 8:30]]></date_time:Input>
  <date_time:Understood><![CDATA[tomorrow morning after 8:30]]></date_time:Understood>
  <date_time:System type="intent">
    <date_time:DateTime>
      <time:Time xmlns:time="time">
        <time:ge>
          <time:hour><![CDATA[8]]></time:hour>
          <time:minute><![CDATA[30]]></time:minute>
          <time:am_pm><![CDATA[am]]></time:am_pm>
        </time:ge>
        <time:le>
          <time:hour><![CDATA[0]]></time:hour>
          <time:minute><![CDATA[0]]></time:minute>
          <time:am_pm><![CDATA[pm]]></time:am_pm>
        </time:le>
      </time:Time>
      <date:Date xmlns:date="date">
        <date:day><![CDATA[13]]></date:day>
        <date:month><![CDATA[6]]></date:month>
        <date:year><![CDATA[2006]]></date:year>
      </date:Date>
    </date_time:DateTime>
  </date_time:System>
</date_time:DejimaInterpretation>
The Start_End_Date_Time component interprets date ranges (for example, "starting today at 2pm and finishing on 2/3/4 ending at 3pm").

Sample files should be at 100% correct.