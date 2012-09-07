<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="4.0.2.128 " SDKVersion="4.0.2.128 " locale="en_US">
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
  </DejimaAgentNetworkDefaults>
  <DejimaAgentNetworkAgentList TopAgent="OpenEndedSearch.com.dejima.core.agents.XMLBasedInterpretationAgent@openEndedSearch">
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ACRONYMS]]></Name>
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
	'acronym finder'
	{action: 'http://www.acronymfinder.com/af-query.asp?String=exact&amp;Acronym='}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.ActuationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
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
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.XMLBasedInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[true]]></AutoApplyXmlTags>
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
	(('who' | 'what' | 'where' | 'when' | 'why') ['is' | 'are'] | ('get' | 'find') ['me'] ['a'] 'map' ['of']) ['the']
	{action: 'http://www.ask.com/main/askjeeves.asp?ask=', get(GETINPUT, 'INPUT')}
;

FINAL:
	P1
	{action: addCData(P1)}
;]]></Policies>
        <Tag Type="java.lang.String"><![CDATA[site]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[openEndedSearch]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DICTIONARY]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[TOKENS:
	'dictionary'
	{action: 'http://www.dictionary.com/search?q='}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.GetInputAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GOOGLE]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[TOKENS:
	'google' | 'google.com' | 'www.google.com' | (['all of the' | 'the entire'|'the'] ('web' | 'internet' | 'world wide web'))
	{action: 'http://www.google.com/search?hl=en&amp;q='}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.InteractionAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
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
        <KeepContext Type="boolean"><![CDATA[false]]></KeepContext>
        <MaxConcurrentQueries Type="int"><![CDATA[-1]]></MaxConcurrentQueries>
        <MaxConcurrentQueriesText Type="java.lang.String"><![CDATA[Maximum number of queries that system can handle reliably is achieved. Please wait a couple of minutes and then resubmit your query.]]></MaxConcurrentQueriesText>
        <MaxInputLength Type="int"><![CDATA[100]]></MaxInputLength>
        <MaxInputLengthText Type="java.lang.String"><![CDATA[Your query was too long to be processed. Please shorten and resubmit your query.]]></MaxInputLengthText>
        <NoInputText Type="java.lang.String"><![CDATA[Unable to interpret input - technical difficulties]]></NoInputText>
        <NoResultText Type="java.lang.String"><![CDATA[Unable to interpret input - technical difficulties]]></NoResultText>
        <PromptText Type="java.lang.String"><![CDATA[Enter your request:]]></PromptText>
        <TimeOutText Type="java.lang.String"><![CDATA[Unable to interpret input - technical difficulties]]></TimeOutText>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage" />
      <SendsTo messageType="com.dejima.core.messages.GetMessage" />
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage" />
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[log]]></Name>
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
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[log]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.XMLBasedInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[true]]></AutoApplyXmlTags>
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
        <ExplanationFile Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String"><![CDATA[open_ended_search]]></Directory>
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[explanation.xml]]></Name>
            <Source Type="java.lang.String"><![CDATA[open_ended_search\explanation.xml]]></Source>
          </Properties>
        </ExplanationFile>
        <Policies Type="java.lang.String"><![CDATA[MAIN:
	WebSearch | WordLookup | AllElse | UrlRequest
	{action: WebSearch, WordLookup, AllElse, UrlRequest}
;

/** 
Please do not uncomment this here.   
You can add this as the last policy in the top agent 
of your network, so all unclaimed inputs would be searched 
on askJeeves.
*/
/*
DATA:
	true
   {action:'http://www.ask.com/main/askjeeves.asp?ask=', get(GETINPUT, 'INPUT')}
;

DEFAULT:
	DATA
	{action: setTag('site'), addCData(DATA)}
;
*/]]></Policies>
        <Tag Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[openEndedSearch]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage" />
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AllElse]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.GetInputAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GETINPUT]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[io]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[POST_URL]]></Name>
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
	'.com' | '.gov' |  '.org' | '.edu' | '.tv' | '.net' | '.co.' ? | '.cs.' ?
	{action: *}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[THESAURUS]]></Name>
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
	'thesaurus'
	{action: 'http://www.thesaurus.com/cgi-bin/search?config=roget&amp;words='}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.XMLBasedInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[UrlRequest]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[true]]></AutoApplyXmlTags>
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
	[('get' ['me']) | 'load' | 'go to' | 'bring up' | ('show' ['me'])] ['URL'] [':'] ('www.' ? POST_URL)
	{action: 'www.',?,POST_URL}
;

FINAL:
	P1
	{action: addCData(P1)}
;]]></Policies>
        <Tag Type="java.lang.String"><![CDATA[site]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[openEndedSearch]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[POST_URL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[POST_URL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[POST_URL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[POST_URL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.XMLBasedInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[true]]></AutoApplyXmlTags>
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
        <Policies Type="java.lang.String"><![CDATA[MAIN:
	(('find'|'look for'|'search') ('\'' ? '\'' | '"' ? '"' | ?) ('using'|'on') (YAHOO | GOOGLE)) | 
    (GOOGLE | YAHOO) ('search' | 'find' | 'look-up') ('\'' ? '\'' | '"' ? '"' | ?)
	{action: YAHOO, GOOGLE, ?}
;

MAIN_CDATA:
	MAIN
	{action: addCData(MAIN)}
;

ALTERNATIVE:
	('search') (YAHOO | GOOGLE) ['for'] ('\'' ? '\'' | '"' ? '"' | ?)
	{action: YAHOO, GOOGLE, ?}
;

ALTERNATIVE_CDATA:
	ALTERNATIVE
	{action: addCData(ALTERNATIVE)}
;

NONE_GRAM:
	(YAHOO | GOOGLE) ['find'|'look'|'search'] ['for'|'on'][':'] ('\'' ? '\'' | '"' ? '"' | ?)
	{action: YAHOO, GOOGLE, ?}
;

NONE_GRAM_CDATA:
	NONE_GRAM
	{action: addCData(NONE_GRAM)}
;

FINAL:
	MAIN_CDATA | ALTERNATIVE_CDATA | NONE_GRAM_CDATA
;]]></Policies>
        <Tag Type="java.lang.String"><![CDATA[site]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[openEndedSearch]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GOOGLE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[YAHOO]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GOOGLE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[YAHOO]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GOOGLE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[YAHOO]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[GOOGLE]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[YAHOO]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.XMLBasedInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WordLookup]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <Attributes Type="com.dejima.core.nlp.text.action.Attributes">
          <Properties Type="com.dejima.core.nlp.text.action.Attributes">
            <AttList Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </AttList>
          </Properties>
        </Attributes>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[true]]></AutoApplyXmlTags>
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
        <Policies Type="java.lang.String"><![CDATA[MAIN:
	('look up' ('\'' ? '\'' | '"' ? '"' | ?) ['in' ('a'|'an')] (DICTIONARY | THESAURUS)) | 
   (DICTIONARY | THESAURUS | ACRONYMS) [':'] ('\'' ? '\'' | '"' ? '"' | ?)
	{action: DICTIONARY, THESAURUS, ?}
;

MAIN_CDATA:
	MAIN
	{action: addCData(MAIN)}
;

WORD-LOOKUP:
	'what does' ['the word'] ('\'' ? '\'' | '"' ? '"' | ?) 'mean' | 
   ['what is the'] 'meaning of' ('\'' ? '\'' | '"' ? '"' | ?)
	{action: 'http://www.dictionary.com/search?q=', ?}
;

WORD-LOOKUP_CDATA:
	WORD-LOOKUP
	{action: addCData(WORD-LOOKUP)}
;

WORD-LOOKUP2:
	(['get']('definition'|'pronunciation'|'etymology'|'origin'|'dict'|'look up'|'lookup'|'look-up') ['of'|'for']['the word'] ('\'' ? '\'' | '"' ? '"' | ?)) | 
   'define' ['the word'] ('\'' ? '\'' | '"' ? '"' | ?)
	{action: 'http://www.dictionary.com/search?q=', ?}
;

WORD-LOOKUP2_CDATA:
	WORD-LOOKUP2
	{action: addCData(WORD-LOOKUP2)}
;

WORD-LOOKUP3:
	('how is' ('\'' ? '\'' | '"' ? '"' | ?) 'spelled') | 
   (('spell'|'spelling' ('for'|'of')) ('\'' ? '\'' | '"' ? '"' | ?))
	{action: 'http://www.dictionary.com/search?q=', ?}
;

WORD-LOOKUP3_CDATA:
	WORD-LOOKUP3
	{action: addCData(WORD-LOOKUP3)}
;

SYNONYM:
	(['whats'|'what is'] ['the'] ('synonyms'|'syn'|'opposite'|'other words'|'another word'|'thes'|('synonymous' ['to'])|(('similar meaning'|'similar meanings') ['to'])) ['of' | 'for'|':'] ('\'' ? '\'' | '"' ? '"' | ?)) | 
   (('word'|'words') ['that'|'which'] ('means'|'mean'|'meaning') ['the'] 'same' ('as'|':') ('\'' ? '\'' | '"' ? '"' | ?))
	{action: 'http://www.thesaurus.com/cgi-bin/search?config=roget&amp;words=', ?}
;

SYNONYM_CDATA:
	SYNONYM
	{action: addCData(SYNONYM)}
;

ACRONYM:
	(('whats' | 'what does') ('\'' ? '\'' | '"' ? '"' | ?) 'stand for')
	{action: 'http://www.acronymfinder.com/af-query.asp?String=exact&amp;Acronym=', ?}
;

ACRONYM_CDATA:
	ACRONYM
	{action: addCData(ACRONYM)}
;

FINAL:
	MAIN_CDATA | WORD-LOOKUP_CDATA | WORD-LOOKUP2_CDATA | WORD-LOOKUP3_CDATA | SYNONYM_CDATA | ACRONYM_CDATA
;]]></Policies>
        <Tag Type="java.lang.String"><![CDATA[site]]></Tag>
        <Uri Type="java.lang.String"><![CDATA[openEndedSearch]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ACRONYMS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DICTIONARY]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[THESAURUS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ACRONYMS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DICTIONARY]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[THESAURUS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ACRONYMS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DICTIONARY]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[THESAURUS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ACRONYMS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DICTIONARY]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[OpenEndedSearch]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[THESAURUS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[YAHOO]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[TOKENS:
	'yahoo' | 'yahoo.com' | 'www.yahoo.com'
	{action: 'http://search.yahoo.com/bin/search?p='}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.XMLBasedInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[openEndedSearch]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[WebSearch]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="ACRONYMS" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="518" yLocation="390" expanded="true" visible="true" />
    <AgentVisualization name="actuator" className="com.dejima.core.agents.ActuationAgent" domainName="openEndedSearch" xLocation="421" yLocation="100" expanded="true" visible="true" />
    <AgentVisualization name="AllElse" className="com.dejima.core.agents.XMLBasedInterpretationAgent" domainName="openEndedSearch" xLocation="572" yLocation="233" expanded="true" visible="true" />
    <AgentVisualization name="DICTIONARY" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="522" yLocation="462" expanded="true" visible="true" />
    <AgentVisualization name="GETINPUT" className="com.dejima.core.agents.GetInputAgent" domainName="openEndedSearch" xLocation="699" yLocation="314" expanded="true" visible="true" />
    <AgentVisualization name="GOOGLE" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="334" yLocation="389" expanded="true" visible="true" />
    <AgentVisualization name="io" className="com.dejima.core.agents.InteractionAgent" domainName="openEndedSearch" xLocation="224" yLocation="87" expanded="true" visible="true" />
    <AgentVisualization name="log" className="com.dejima.core.agents.LogAgent" domainName="openEndedSearch" xLocation="113" yLocation="170" expanded="true" visible="true" />
    <AgentVisualization name="OpenEndedSearch" className="com.dejima.core.agents.XMLBasedInterpretationAgent" domainName="openEndedSearch" xLocation="346" yLocation="176" expanded="true" visible="true" />
    <AgentVisualization name="POST_URL" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="645" yLocation="362" expanded="true" visible="true" />
    <AgentVisualization name="THESAURUS" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="522" yLocation="426" expanded="true" visible="true" />
    <AgentVisualization name="UrlRequest" className="com.dejima.core.agents.XMLBasedInterpretationAgent" domainName="openEndedSearch" xLocation="541" yLocation="309" expanded="true" visible="true" />
    <AgentVisualization name="WebSearch" className="com.dejima.core.agents.XMLBasedInterpretationAgent" domainName="openEndedSearch" xLocation="238" yLocation="317" expanded="true" visible="true" />
    <AgentVisualization name="WordLookup" className="com.dejima.core.agents.XMLBasedInterpretationAgent" domainName="openEndedSearch" xLocation="412" yLocation="321" expanded="true" visible="true" />
    <AgentVisualization name="YAHOO" className="com.dejima.core.agents.AASAPAgent" domainName="openEndedSearch" xLocation="309" yLocation="439" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

