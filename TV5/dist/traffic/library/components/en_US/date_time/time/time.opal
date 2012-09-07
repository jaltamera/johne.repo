<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="5.0.0.349 " SDKVersion="5.2.0.349 " locale="en_US">
  <DejimaAgentNetworkDefaults>
    <RecursiveCondition claimLimit="30" />
    <ComboCondition claimLimit="50" />
    <SubstringConditions threshold="80" leastLength="3" />
    <CommonWords filename="common.txt" minimumNonNoiseTokenSize="3" />
    <CharacterEncoding encoding="Cp1252" />
    <FuzzyMatchers>
      <FuzzyComparer name="com.dejima.core.nlp.text.matcher.RestrictedEditDistance" threshold="75" />
    </FuzzyMatchers>
    <Actuation class="com.dejima.core.nlp.text.action.XmlActuation" />
    <Priority class="com.dejima.core.nlp.text.FollowupPriority" />
    <TokenMatchers>
      <TokenMatcher type="numeric" />
      <TokenMatcher type="substring" />
      <TokenMatcher type="fuzzy" />
    </TokenMatchers>
    <Accents>
      <Accent lowerLimit="à" upperLimit="å" character="a" />
      <Accent lowerLimit="ç" upperLimit="ç" character="c" />
      <Accent lowerLimit="è" upperLimit="ë" character="e" />
      <Accent lowerLimit="ì" upperLimit="ï" character="i" />
      <Accent lowerLimit="ñ" upperLimit="ñ" character="n" />
      <Accent lowerLimit="ò" upperLimit="ö" character="o" />
      <Accent lowerLimit="ø" upperLimit="ø" character="o" />
      <Accent lowerLimit="ù" upperLimit="ü" character="u" />
      <Accent lowerLimit="ý" upperLimit="ý" character="y" />
      <Accent lowerLimit="ÿ" upperLimit="ÿ" character="y" />
    </Accents>
    <Alphabet>
      <CharacterRange lowerLimit="a" upperLimit="z" />
      <CharacterRange lowerLimit="A" upperLimit="Z" />
      <CharacterRange lowerLimit="À" upperLimit="ȳ" />
      <CharacterRange lowerLimit="　" upperLimit="￮" />
    </Alphabet>
    <Numeric>
      <CharacterRange lowerLimit="0" upperLimit="9" />
    </Numeric>
    <Symbols>
      <CharacterRange lowerLimit="!" upperLimit="/" />
      <CharacterRange lowerLimit=":" upperLimit="@" />
      <CharacterRange lowerLimit="[" upperLimit="`" />
      <CharacterRange lowerLimit="{" upperLimit="~" />
    </Symbols>
    <Joins />
    <Tokenizer className="com.dejima.core.nlp.text.USEnglishTextTokenizer" />
    <LibraryRoot path="library" />
  </DejimaAgentNetworkDefaults>
  <DejimaAgentNetworkAgentList TopAgent="Time.com.dejima.templates.TemplatizedAgent@time">
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[atTime:
  'at' AbsoluteTime
  {attributes: 'private, atomic'}
;

aTime:
	AbsoluteTime | atTime
	{action: setTag('absoluteDate'), AbsoluteTime, atTime}
   {attributes: 'private'}
;

times:
	aTime+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[NOW:
	'now'
	{attributes: 'private, atomic'}
	{action: setTag('current')}
;

noon:
	'noon'
	{attributes: 'private, atomic'}
	{action: addElement('hour', '12'), addElement('am_pm', 'pm')}
;

midnight:
	'midnight'
	{attributes: 'private, atomic'}
	{action: addElement('hour', '12'), addElement('am_pm', 'am')}
;

textMinute:
  TEXTMINUTE
  {attributes: 'private, atomic'}
  {action: setTag('minute'), TEXTMINUTE}
;

minute:
  MinuteNumbers
  {attributes: 'private, atomic'}
  {action: setTag('minute'), addCData(MinuteNumbers)}
;

/* following two policies are used to only claim minutes that are not part of an absolute time */
minutePartOfAbsoluteDateOrTime:
   ((&lt;exists&gt; (':'|'\\'|'/')) minute) | (minute (&lt;exists&gt; (':'|'\\'|'/')))
  {attributes: 'private, atomic'}
;

standAloneMinute:
  minute - minutePartOfAbsoluteDateOrTime
  {attributes: 'private, atomic'}
;

hour:
  HourNumbers
  {attributes: 'private, atomic'}
  {action: setTag('hour'), HourNumbers}
;

/* following two policies are used to only claim hours that are not part of an absolute time */
hourPartOfAbsoluteDateOrTime:
   ((&lt;exists&gt; (':'|'\\'|'/')) hour) | (hour (&lt;exists&gt; (':'|'\\'|'/')))
  {attributes: 'private, atomic'}
;

standAloneHour:
  hour - hourPartOfAbsoluteDateOrTime
  {attributes: 'private, atomic'}
;

relativeTimeInLetters:
	['at'] textMinute (standAloneHour [AM|Morning|PM|Afternoon]|noon|midnight) |
   (Morning|Afternoon) 'at' textMinute standAloneHour
   {attributes: 'private, atomic'}
	{action: standAloneHour, noon, midnight, textMinute, Morning, AM, Afternoon, PM}
;

/* this policy is to filter invalid claims made by FormattedTime. 
   (maybe not useful anymore as the FormattedTime regexp has improved but keeping the policy just in case!)
   */
notFormattedHourMinute:
	(FormattedTime &lt;exists&gt; ('minute'|':'|'\\'|'/')) | ((&lt;exists&gt; (':'|'\\'|'/')) FormattedTime)
   {attributes: 'private, atomic'}
;

formattedHourMinute:
	(['at'] FormattedTime ['minute'] ['oclock'] [AM|PM|Morning|Afternoon] - notFormattedHourMinute)|
	(Morning|Afternoon) 'at' FormattedTime ['minute'] ['oclock']
   {attributes: 'private, atomic'}
	{action: FormattedTime, Morning, Afternoon, AM, PM}
;

/* claims inputs such as 5 past 10 */
minutesAfterHour:
	['at'] standAloneMinute ['minute'] ('past'|'after') standAloneHour ['oclock'] [AM|Morning|PM|Afternoon] |
   (Morning|Afternoon) 'at' standAloneMinute ['minute'] ('past'|'after') standAloneHour ['oclock'] |
   ['at'] standAloneMinute ['minute'] ('past'|'after') (noon|midnight)
   {attributes: 'private, atomic'}
	{action: standAloneHour, noon, midnight, standAloneMinute, Morning, AM, Afternoon, PM, noon, midnight}
;

/** the following three policies are used to reference minutes as a negative offset (rather than absolute) */
pastMinuteOffset:
  MinuteNumbers - minutePartOfAbsoluteDateOrTime
  {attributes: 'private, atomic'}
  {action: setTag('offset'), '-', MinuteNumbers}
;

pastMinute:
  pastMinuteOffset
  {attributes: 'private, atomic'}
  {action: setTag('minute'), pastMinuteOffset}
;

/* claims inputs such as 5 to 10 */
minutesBeforeHourEnd:
	['at'] pastMinute ['minute'] ('to'|'before') (standAloneHour|formattedHourMinute) ['oclock'] [AM|Morning|PM|Afternoon] |
   (Morning|Afternoon) 'at' pastMinute ['minute'] ('to'|'before') standAloneHour ['oclock'] |
	['at'] pastMinute ['minute'] ('to'|'before') (noon|midnight) 
   {attributes: 'private, atomic'}
	{action: 
         standAloneHour, formattedHourMinute, noon, midnight, pastMinute, Morning, AM, Afternoon, PM}
;

/* stop claims on "from 5 to 10"  - this is a range not a subtraction */
minutesBeforeHour:
	minutesBeforeHourEnd - (&lt;exists&gt;('from'|'between') ~ minutesBeforeHourEnd)
	{action: minutesBeforeHourEnd}
;

hourMinute:
	((standAloneHour ~ standAloneMinute) - (/NUMBER ~ /NUMBER)) ['minute'] [AM|Morning|PM|Afternoon] | 
	'at' standAloneHour standAloneMinute ['minute'] [AM|Morning|PM|Afternoon] | 
   (Morning|Afternoon) 'at' standAloneHour ['and'] standAloneMinute ['minute']
   {attributes: 'private, atomic'}
	{action: standAloneHour, standAloneMinute, Morning, AM, Afternoon, PM}
;

nonAtomicExplicitHour:
	standAloneHour (AM|Morning|PM|Afternoon)
   {attributes: 'private'}
	{action: standAloneHour, AM, Morning, Afternoon, PM}
;

explicitHour:
	('at' standAloneHour (AM|Morning|PM|Afternoon|'oclock')) | 
	(['at'] standAloneHour 'oclock') | 
   [Morning|Afternoon] 'at' standAloneHour |
   'oh' standAloneHour [AM|Morning|PM|Afternoon|'oclock']
   {attributes: 'private, atomic'}
	{action: standAloneHour, AM, Morning, Afternoon, PM}
;

explicitAMPM:
	&lt;exists&gt;('today'|'tomorrow'|'yesterday') ['in' ['the']] (AM|PM)
   {attributes: 'private, atomic'}
	{action: AM, PM}
;

singleTime:
	(explicitAMPM|NOW|noon|midnight|Morning, Afternoon, hourMinute|hourMinute|formattedHourMinute|minutesBeforeHour|minutesAfterHour|relativeTimeInLetters|explicitHour|nonAtomicExplicitHour)+
	{action: explicitAMPM, NOW, noon, midnight, Morning, Afternoon, hourMinute, formattedHourMinute, minutesBeforeHour, minutesAfterHour, relativeTimeInLetters, explicitHour, nonAtomicExplicitHour}
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.date.TimeRegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[FormattedTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.date.TimeRegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[FormattedTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.date.TimeRegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[FormattedTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.date.TimeRegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[FormattedTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PM]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.ActuationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <NoActuationText Type="java.lang.String"><![CDATA[No response!]]></NoActuationText>
        <NoInterpretationText Type="java.lang.String"><![CDATA[Unable to interpret input]]></NoInterpretationText>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	['in' ['the'] | 'this'] 'afternoon'
	{action: setTag('am_pm'), 'pm'}
;

P2:
	['in' ['the'] | 'this'] 'evening'
	{action: setTag('am_pm'), addAttribute('evening','true'), 'pm'}
;

P3:
	['in' ['the'] | 'this'] 'night'
	{action: setTag('am_pm'), addAttribute('night','true'), 'pm'}
;

all:
	(P1|P2|P3) +
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[afternoon.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[afternoon.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[after:
	(('gt' | 'not le') ['the']) TheDate
   {attributes: 'private, atomic'}
	{action: setTag('ge'), TheDate}
;

afterOrEqual:
	(('ge'|'not lt'|'gt or =')  TheDate) | (TheDate 'at the earliest')
   {attributes: 'private, atomic'}
	{action: setTag('ge'), TheDate}
;

afters:
	(after | afterOrEqual)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[compare.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[compare.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AM]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	&lt;exact&gt; 'am'
	{action: setTag('am_pm'), 'am'}
;

P3:
	P1 +
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[am.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[am.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[before:
	(('lt' | 'not ge') ['the']) TheDate
   {attributes: 'private, atomic'}
	{action: setTag('le'), TheDate}
;

beforeOrEqual:
	(('le'|'not gt'|'lt or =') TheDate) | (TheDate 'at the latest')
   {attributes: 'private, atomic'}
	{action: setTag('le'), TheDate}
;

beforeDates:
	(before | beforeOrEqual)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[compare.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[compare.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.library.date.TimeRegularExpressionAgent">
        <AddCData Type="java.lang.Boolean"><![CDATA[false]]></AddCData>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.date.TimeRegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[FormattedTime]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[FormatedTimeAmbiguity]]></AmbiguityTag>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[false]]></AutoApplyXmlTags>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <RegularExpression Type="java.lang.String"><![CDATA[((\D|^)((0?[0-9])|(1[0-9])|(2[0-4]))(h|\.|:)[0-5][0-9](\D|$))]]></RegularExpression>
        <Tag Type="java.lang.String"><![CDATA[FormatedTime]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[time]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	/NUMBER:CARD(0,24,1)
   {attributes: 'private, atomic'}
	{action: *}
;

P2:
	&lt;exact&gt; 'twelve' ['hundred']
   {attributes: 'private, atomic'}
	{action: '12'}
;

P3:
	&lt;exact&gt; 'one' ['hundred']
   {attributes: 'private, atomic'}
	{action: '1'}
;

P4:
	&lt;exact&gt; 'two' ['hundred']
   {attributes: 'private, atomic'}
	{action: '2'}
;

P5:
	&lt;exact&gt; 'three' ['hundred']
   {attributes: 'private, atomic'}
	{action: '3'}
;

P6:
	&lt;exact&gt; 'four' ['hundred']
   {attributes: 'private, atomic'}
	{action: '4'}
;

P7:
	&lt;exact&gt; 'five' ['hundred']
   {attributes: 'private, atomic'}
	{action: '5'}
;

P8:
	&lt;exact&gt; 'six' ['hundred']
   {attributes: 'private, atomic'}
	{action: '6'}
;

P9:
	&lt;exact&gt; 'seven' ['hundred']
   {attributes: 'private, atomic'}
	{action: '7'}
;

P10:
	&lt;exact&gt; 'eight' ['hundred']
   {attributes: 'private, atomic'}
	{action: '8'}
;

P11:
	&lt;exact&gt; 'nine' ['hundred']
   {attributes: 'private, atomic'}
	{action: '9'}
;

P12:
	&lt;exact&gt; 'ten' ['hundred']
   {attributes: 'private, atomic'}
	{action: '10'}
;

P13:
	&lt;exact&gt; 'eleven' ['hundred']
   {attributes: 'private, atomic'}
	{action: '11'}
;

CATCH:
	( P1 | P2 | P3 | P4 | P5 | P6 | P7 | P8 | P9 | P10 | P11 | P12 | P13 ) +
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[digits:
   /NUMBER:CARD(0,24)
   {action: *.number}
;

letters:
	TENS_NUMBERS_IN_LETTERS
   {action: TENS_NUMBERS_IN_LETTERS}
;

tensNumbers:
    (digits|letters)+
    {action: setTag('offset'), digits, letters}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.InteractionAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
        <DefaultUserName Type="java.lang.String"><![CDATA[DefaultUser]]></DefaultUserName>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <HistoryCleanupInterval Type="long"><![CDATA[1000]]></HistoryCleanupInterval>
        <HistoryCleanupThreadPriority Type="int"><![CDATA[1]]></HistoryCleanupThreadPriority>
        <InteractionTimeOut Type="java.lang.Long"><![CDATA[600000]]></InteractionTimeOut>
        <KeepContext Type="boolean"><![CDATA[true]]></KeepContext>
        <MaxConcurrentQueries Type="int"><![CDATA[-1]]></MaxConcurrentQueries>
        <MaxConcurrentQueriesText Type="java.lang.String"><![CDATA[Maximum number of queries that system can handle reliably is achieved. Please wait a couple of minutes and then resubmit your query.]]></MaxConcurrentQueriesText>
        <MaxInputLength Type="int"><![CDATA[100]]></MaxInputLength>
        <MaxInputLengthText Type="java.lang.String"><![CDATA[Your query was too long to be processed. Please shorten and resubmit your query.]]></MaxInputLengthText>
        <NoInputText Type="java.lang.String"><![CDATA[No input found]]></NoInputText>
        <NoResultText Type="java.lang.String"><![CDATA[No result found]]></NoResultText>
        <PromptText Type="java.lang.String"><![CDATA[How can I help you?]]></PromptText>
        <TimeOutText Type="java.lang.String"><![CDATA[Time out expired]]></TimeOutText>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Log]]></Name>
          </Properties>
        </Address>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <MessageLogging Type="boolean"><![CDATA[false]]></MessageLogging>
        <MessageTracing Type="boolean"><![CDATA[true]]></MessageTracing>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.LogMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Log]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[minuteInDigits:
	( '00' | '01' | '1' | '02' | '2' | '03' | '3' | '04' | '4' | '05' | '5' | '06' | '6' | '07' | '7' | '08' | '8' | '09' | '9' | '10' | '11' | '12' | '13' | '14' | '15' | '16' | '17' | '18' | '19' | '20' | '21' | '22' | '23' | '24' | '25' | '26' | '27' | '28' | '29'|  '30' | '31' | '32' | '33' | '34' | '35' | '36' | '37' | '38' | '39' |  '40' | '41' | '42' | '43' | '44' | '45' | '46' | '47' | '48' | '49' |  '50' | '51' | '52' | '53' | '54' | '55' | '56' | '57' | '58' | '59'   )
	{action: *}
;

minuteInLetters:
	( TENS_NUMBERS_IN_LETTERS  )
	{action: TENS_NUMBERS_IN_LETTERS}
;

minute:
    (minuteInDigits | minuteInLetters)
;

minutes:
	(minute)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[digits:
   /NUMBER:CARD(0,60,1)
   {action: *.number}
;

letters:
	TENS_NUMBERS_IN_LETTERS
   {action: TENS_NUMBERS_IN_LETTERS}
;

tensNumbers:
    (digits|letters)+
    {action: setTag('offset'), digits, letters}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	['in' ['the'] | 'this'] 'morning'
	{action: setTag('am_pm'), 'am'}
;

P3:
	P1 +
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[halfAnHour:
	['one'|'a'] 'half' ['an'] 'hour'
	{action: 
        setTag('minute'), addElement('offset', '30')}
;

anHour:
   ['one'|'an'] 'hour'
 {action: 
        setTag('hour'), addElement('offset', '1')}
;

aMinute:
   ['one'|'a'] 'minute'
 {action: 
        setTag('minute'), addElement('offset', '1')}
;

HOUR:
	HourOffset 'hour'
	{action: setTag('hour'), HourOffset}
;

compoundHour:
	HourOffset 'and' halfAnHour
	{action: addElement('hour', HourOffset), halfAnHour}
;

MINUTE:
	MinuteOffset 'minute'
	{action: setTag('minute'), MinuteOffset}
;

aPeriod: 
    HOUR | MINUTE
;


compoundPeriod:
    (HOUR|anHour) ['and'] (MINUTE|aMinute)
;

periods:
   (halfAnHour| anHour | aMinute | aPeriod | compoundPeriod)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	&lt;exact&gt; ('one'|'first')
	{action: '1'}
;

P2:
	&lt;exact&gt; ('two'|'second')
	{action: '2'}
;

P3:
	&lt;exact&gt; ('three'|'third')
	{action: '3'}
;

P4:
	&lt;exact&gt; ('four'|'fourth')
	{action: '4'}
;

P5:
	&lt;exact&gt; ('five'|'fifth')
	{action: '5'}
;

P6:
	&lt;exact&gt; ('six'|'sixth')
	{action: '6'}
;

P7:
	&lt;exact&gt; ('seven'|'seventh')
	{action: '7'}
;

P8:
	&lt;exact&gt; ('eight'|'eighth')
	{action: '8'}
;

P9:
	&lt;exact&gt; ('nine'|'ninth')
	{action: '9'}
;

P10:
	&lt;exact&gt; ('zero')
	{action: '0'}
;

P100:
	(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PM]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	&lt;exact&gt; 'pm'
	{action: setTag('am_pm'), 'pm'}
;

P2:
	P1 +
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[pm.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[pm.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[PAST_PERIODS:
	'since' ['last'] (TimePeriod) ['ago'] | ('in' 'past' TimePeriod) | (['in'] 'past' OFFSETED_PERIOD)
   {attributes: 'private, atomic'}
	{action: setTag('past'), TimePeriod OFFSETED_PERIOD}
;

FUTURE_PERIODS:
	(('by'|'until') ['end of'] ['next'] (TimePeriod|OFFSETED_PERIOD)) | 'in' OFFSETED_PERIOD ['time'] | ['in'] 'next' OFFSETED_PERIOD
   {attributes: 'private, atomic'}
	{action: setTag('future'), TimePeriod, OFFSETED_PERIOD}
;

rangeTenses:
     (PAST_PERIODS, FUTURE_PERIODS)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[aRelativeDate:
	TimeRange
   {attributes: 'private'}
	{action: setTag('relativeDate'), TimeRange}
;

relativeDates:
	aRelativeDate+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[onTime:
   'on' SingleTime
   {attributes: 'private, atomic'}
;

aRelativeDate:
	onTime | SingleTime
   {attributes: 'private'}
	{action: setTag('relativeDate'), SingleTime, onTime}
;

relativeDates:
	aRelativeDate+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[morning:
	['in the'|'at'] ('morning')
   {attributes: 'private, atomic'}
	{action: setTag('am_pm'), 'am'}
;

afternoon:
	['in the'|'at'] ('afternoon'|'evening')
   {attributes: 'private, atomic'}
	{action: setTag('am_pm'), 'pm'}
;

PAST_PERIODS:
	['a'] (OFFSETED_PERIOD) 'ago'
   {attributes: 'atomic'}
	{action: setTag('past'), OFFSETED_PERIOD}
;

CURRENT_PERIODS:
	['this' | 'the'] (TimePeriod|morning|afternoon)
   {attributes: 'atomic'}
	{action: setTag('current'), TimePeriod,morning,afternoon}
;

FUTURE_PERIOD_:
	'in a' TimePeriod | ['a'] (TimePeriod|OFFSETED_PERIOD) ('later')
	{attributes: 'private, atomic'}
;

FUTURE_PERIODS:
	['in'] 'next' TimePeriod | [['in'] 'a'] TimePeriod ['later'] | OFFSETED_PERIOD 'later'
   {attributes: 'atomic'}
	{action: setTag('future'), FUTURE_PERIOD_, TimePeriod, OFFSETED_PERIOD}
;

SINGLE_TENSES:
(PAST_PERIODS | FUTURE_PERIODS | CURRENT_PERIODS)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OFFSETED_PERIOD]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SingleTime]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[SINGLE:
	SINGLE_TENSE
   {attributes: 'private'}
	{action: setTag('singleDate'), SINGLE_TENSE}
;

singleDates:
	SINGLE+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[(P1:
	"
	&lt;exact&gt; ('ten' | 'tenth')
			{action:
					{execute:'10'}}
	"),
(P2:
	"
	&lt;exact&gt; ('eleven') | 'eleventh'
			{action:
					{execute:'11'}}
	"),
(P3:
	"
	'twelve' | 'twelvth'
			{action:
					{execute:'12'}}
	"),
(P4:
	"
	'thirteen' | 'thirteenth'
			{action:
					{execute:'13'}}
	"),
(P5:
	"
	'fourteen' | 'fourteenth'
			{action:
					{execute:'14'}}
	"),
(P6:
	"
	'fifteen' | 'fifteenth'
			{action:
					{execute:'15'}}
	"),
(P7:
	"
	'sixteen' | 'sixteenth'
			{action:
					{execute:'16'}}
	"),
(P8:
	"
	'seventeen' | 'seventeenth'
			{action:
					{execute:'17'}}
	"),
(P9:
	"
	'eighteen' | 'eighteenth'
			{action:
					{execute:'18'}}
	"),
(P10:
	"
	'nineteen' | 'nineteenth'
			{action:
					{execute:'19'}}
	"),
(P100:
	"
	(P1,P2,P3,P4,P5,P6,P7,P8,P9,P10)+
	")]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P2:
	&lt;exact&gt; ('twenty' | 'twentieth')
	{action: '20'}
;

P3:
	&lt;exact&gt; ('thirty' | 'thirtieth')
	{action: '30'}
;

P4:
	&lt;exact&gt; ('forty' | 'fortieth')
	{action: '40'}
;

P5:
	&lt;exact&gt; ('fifty' | 'fiftieth')
	{action: '50'}
;

P6:
	&lt;exact&gt; ('sixty' | 'sixtieth')
	{action: '60'}
;

P7:
	(&lt;exact&gt; 'seventy') | 'seventieth'
	{action: '70'}
;

P8:
	(&lt;exact&gt; 'eighty') | 'eightieth'
	{action: '80'}
;

P9:
	&lt;exact&gt; ('ninety') | 'ninetieth'
	{action: '90'}
;

P20:
	( (P2|P3|P4|P5|P6|P7|P8|P9) ONES_IN_LETTERS )
	{action: '(', P2,P3,P4,P5,P6,P7,P8,P9, ' + ', ONES_IN_LETTERS, ')'}
;

P100:
	( P2,P3,P4,P5,P6,P7,P8,P9,P20 ) +
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_NUMBERS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[numberInLetters:
	(ONES_IN_LETTERS | TENS_IN_LETTERS | TEENS_IN_LETTERS)
;

number:
   numberInLetters
	{action: com.dejima.library.evaluate.EvaluateActuation: evaluateExpression(numberInLetters)}
;

numbers:
	number+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteOffset]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_IN_LETTERS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[P1:
	( 'quarter past' )
	{action: setTag('offset'), '15'}
;

P2:
	( 'quarter to' )
	{action: setTag('offset'), '-15'}
;

P3:
	( 'half past' )
	{action: setTag('offset'), '30'}
;

CATCH:
	( P1 , P2, P3) +
	{action: P1, P2, P3}
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[textminute.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[textminute.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[indicators:
   ('date' ['=']) | 'on'
	{attributes: 'private, atomic'}
   {action: addAttribute('exlplicit', 'true')}
;

dateTypes: 
    (RelativeSingleDate | RelativeDateRange | AbsoluteDate | 
                  RelativeSingleDate AbsoluteDate | 
                  AbsoluteDate RelativeSingleDate | 
						RelativeSingleDate RelativeDateRange |
                  RelativeDateRange RelativeSingleDate |
                  RelativeDateRange AbsoluteDate | 
                  AbsoluteDate RelativeDateRange | 
                  RelativeSingleDate AbsoluteDate RelativeDateRange |
                  RelativeSingleDate RelativeDateRange AbsoluteDate |
                  AbsoluteDate RelativeDateRange RelativeSingleDate |
                  AbsoluteDate RelativeSingleDate RelativeDateRange |
						RelativeDateRange AbsoluteDate RelativeSingleDate |
						RelativeDateRange RelativeSingleDate AbsoluteDate
                  )
	{attributes: 'private'}
;

explicit:
   indicators dateTypes
	{attributes: 'private, atomic'}
;

implicit:
   dateTypes
   {attributes: 'private'}
;

dateObject:
   explicit | implicit
   {attributes: 'private'}
   {action: setTag('Date'), explicit, implicit}
;
   
dates:
	dateObject+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AbsoluteDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeSingleDate]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Time]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String" />
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[false]]></AutoApplyXmlTags>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.templates.TemplatizedAgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/templatized_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Time]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[time.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[time.template]]></Source>
          </Properties>
        </TemplateInfo>
        <TemplateProperties Type="java.util.List">
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[currentDate]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[orKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA['or']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[displayDate]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[displayTime]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[disableDateConversion]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[orTag]]></Name>
                <Value Type="java.lang.String"><![CDATA[or]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[mapToBusinessHours]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[time]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AfterTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[BeforeTime]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TheDate]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimePeriod]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[morning:
	Morning
	{action: Morning}
;

afternoon:
	Afternoon
	{action: Afternoon}
;

minutesOffset:
   MinuteNumbers
   {attributes: 'private'}
   {action: setTag('offset'), MinuteNumbers}
;

halfAnHourOffset:
   'half an hour'
   {attributes: 'private'}
   {action: setTag('offset'), 30}
;

halfAnHour:
	'in' halfAnHourOffset
	{action: 
        setTag('minute'), halfAnHourOffset}
;

hoursOffset:
   HourNumbers
   {attributes: 'private'}
   {action: setTag('offset'), HourNumbers}
;

anHourOffset:
   ('an'|'one') 'hour'
   {attributes: 'private'}
   {action: setTag('offset'), 1}
;

anHour:
	'in' anHourOffset
	{action: 
        setTag('hour'), anHourOffset}
;

relativeMinutes:
	minutesOffset 'minute'
	{attributes: 'private'}
	{action: 
		setTag('minute'), minutesOffset}
;

relativeHours:
	hoursOffset 'hour'
	{attributes: 'private'}
	{action:  
		setTag('hour'), hoursOffset}
;

hourMinute:
	'in' (relativeHours ['and'] relativeMinutes | relativeMinutes ['and'] relativeHours | relativeHours | relativeMinutes)
	{action: relativeHours, relativeMinutes}
;

timePeriods:
	(hourMinute | halfAnHour | anHour | halfAnHour | morning | afternoon)+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[date_time.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[date_time.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Afternoon]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HourNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[MinuteNumbers]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Morning]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[SINGLE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEXTMINUTE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TimeRange]]></Name>
          </Properties>
        </Address>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,4,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String"><![CDATA[RANGE:
	RANGE_TENSE
   {attributes: 'private'}
	{action: setTag('dateRange'), RANGE_TENSE}
;

ranges:
   RANGE+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RANGE_TENSE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[time]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RelativeDateRange]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="AbsoluteDate" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="828" yLocation="477" expanded="true" visible="true" />
    <AgentVisualization name="AbsoluteTime" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="280" yLocation="735" expanded="true" visible="true" />
    <AgentVisualization name="actuator" className="com.dejima.core.agents.ActuationAgent" domainName="time" xLocation="752" yLocation="120" expanded="true" visible="true" />
    <AgentVisualization name="Afternoon" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="338" yLocation="994" expanded="true" visible="true" />
    <AgentVisualization name="AfterTime" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="720" yLocation="313" expanded="true" visible="true" />
    <AgentVisualization name="AM" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="113" yLocation="830" expanded="true" visible="true" />
    <AgentVisualization name="BeforeTime" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="556" yLocation="310" expanded="true" visible="true" />
    <AgentVisualization name="FormattedTime" className="com.dejima.library.date.TimeRegularExpressionAgent" domainName="time" xLocation="123" yLocation="915" expanded="true" visible="true" />
    <AgentVisualization name="HourNumbers" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="831" yLocation="952" expanded="true" visible="true" />
    <AgentVisualization name="HourOffset" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="606" yLocation="939" expanded="true" visible="true" />
    <AgentVisualization name="io" className="com.dejima.core.agents.InteractionAgent" domainName="time" xLocation="544" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="time" xLocation="442" yLocation="151" expanded="true" visible="true" />
    <AgentVisualization name="MinuteNumbers" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="488" yLocation="967" expanded="true" visible="true" />
    <AgentVisualization name="MinuteOffset" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="716" yLocation="941" expanded="true" visible="true" />
    <AgentVisualization name="Morning" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="224" yLocation="981" expanded="true" visible="true" />
    <AgentVisualization name="OFFSETED_PERIOD" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="508" yLocation="737" expanded="true" visible="true" />
    <AgentVisualization name="ONES_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="635" yLocation="1143" expanded="true" visible="true" />
    <AgentVisualization name="PM" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="120" yLocation="877" expanded="true" visible="true" />
    <AgentVisualization name="RANGE_TENSE" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="683" yLocation="596" expanded="true" visible="true" />
    <AgentVisualization name="RelativeDateRange" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="644" yLocation="497" expanded="true" visible="true" />
    <AgentVisualization name="RelativeSingleDate" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="574" yLocation="474" expanded="true" visible="true" />
    <AgentVisualization name="SINGLE_TENSE" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="525" yLocation="615" expanded="true" visible="true" />
    <AgentVisualization name="SingleTime" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="542" yLocation="547" expanded="true" visible="true" />
    <AgentVisualization name="TEENS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="522" yLocation="1122" expanded="true" visible="true" />
    <AgentVisualization name="TENS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="695" yLocation="1101" expanded="true" visible="true" />
    <AgentVisualization name="TENS_NUMBERS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="677" yLocation="1014" expanded="true" visible="true" />
    <AgentVisualization name="TEXTMINUTE" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="551" yLocation="918" expanded="true" visible="true" />
    <AgentVisualization name="TheDate" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="646" yLocation="412" expanded="true" visible="true" />
    <AgentVisualization name="Time" className="com.dejima.templates.TemplatizedAgent" domainName="time" xLocation="661" yLocation="220" expanded="true" visible="true" />
    <AgentVisualization name="TimePeriod" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="603" yLocation="791" expanded="true" visible="true" />
    <AgentVisualization name="TimeRange" className="com.dejima.core.agents.AASAPAgent" domainName="time" xLocation="664" yLocation="540" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

