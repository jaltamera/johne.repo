<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="4.5.1.17 " SDKVersion="4.5.1.17 " locale="en_US">
  <DejimaAgentNetworkDefaults />
  <DejimaAgentNetworkAgentList TopAgent="Decimal.com.dejima.core.agents.AASAPAgent@decimals" extendsOPAL="integers.opal" extendsPath=".\" extendsLibrary="false">
    <Agent>
      <Properties Type="com.dejima.core.agents.ActuationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
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
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[main:
  (HUNDREDS_NUMERALS|DecimalNumber)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DecimalNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DecimalNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DecimalNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DecimalNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DecimalNumber]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[decimal:
   /NUMBER
   {action: *}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
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
	'hundred'
	{action: '100'}
;

P2:
	(ONES | TEENS | TENS) P1
	{action: '(',ONES, TENS, TEENS,')' , '*' , /P1}
;

P3:
	(P1 | P2) ['and'] TENS
	{action: P1,P2, '+ ',TENS}
;

P4:
	(P1 | P2) ['and'] TEENS
	{action: P1,P2 ,'+ ',TEENS}
;

P5:
	TEENS TENS
	{action: TEENS,'*','100','+',TENS}
;

CATCH:
	(P1, P2, P3, P4, P5, TENS)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[LETTERS:
	( HUNDREDS ) +
	{action: com.dejima.library.evaluate.EvaluateActuation: evaluateExpression(HUNDREDS)}
	{ambiguity action: com.dejima.library.evaluate.EvaluateActuation: evaluateExpression(HUNDREDS)}
;

DIGIT:
	/NUMBER(0,100000,1)
	{action: *.number}
	{ambiguity action: *.number}
;

CATCH:
	(LETTERS,DIGIT)+
	{action: LETTERS,DIGIT}
	{ambiguity action: LETTERS,DIGIT}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.InteractionAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.InteractionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
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
        <NoInputText Type="java.lang.String"><![CDATA[No input found]]></NoInputText>
        <NoResultText Type="java.lang.String"><![CDATA[No result found]]></NoResultText>
        <PromptText Type="java.lang.String"><![CDATA[How can I help you?]]></PromptText>
        <TimeOutText Type="java.lang.String"><![CDATA[Time out expired]]></TimeOutText>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Decimal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
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
	<exact> ('one' | 'first')
	{action:  '1'}
;

P2:
	<exact> ('two' | 'second')
	{action:  '2'}
;

P3:
	<exact> ('three' | 'third')
	{action:  '3'}
;

P4:
	<exact> ('four' | 'fourth')
	{action:  '4'}
;

P5:
	<exact> ('five' | 'fifth')
	{action:  '5'}
;

P6:
	<exact> ('six' | 'sixth')
	{action:  '6'}
;

P7:
	<exact> ('seven' | 'seventh')
	{action:  '7'}
;

P8:
	<exact> ('eight' | 'eighth')
	{action:  '8'}
;

P9:
	<exact> ('nine' | 'ninth')
	{action:  '9'}
;

P10:
	'zero'
	{action:  '0'}
;

P11:
	(P1|P2|P3|P4|P5|P6|P7|P8|P9|P10)+
	{action: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
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
	'ten' | 'tenth'
	{action:  '10'}
;

P2:
	'eleven' | 'eleventh'
	{action:  '11'}
;

P3:
	'twelve' | 'twelvth'
	{action:  '12'}
;

P4:
	'thirteen' | 'thirteenth'
	{action:  '13'}
;

P5:
	'fourteen' | 'fourteenth'
	{action:  '14'}
;

P6:
	'fifteen' | 'fifteenth'
	{action:  '15'}
;

P7:
	'sixteen' | 'sixteenth'
	{action:  '16'}
;

P8:
	'seventeen' | 'seventeenth'
	{action:  '17'}
;

P9:
	'eighteen' | 'eighteenth'
	{action:  '18'}
;

P10:
	'nineteen' | 'nineteenth'
	{action:  '19'}
;

P100:
	(P1|P2|P3|P4|P5|P6|P7|P8|P9|P10)+
	{action: P1,P2,P3,P4,P5,P6,P7,P8,P9,P10}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
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
	'twenty'
	{action: '20'}
;

P3:
	'thirty'
	{action: '30'}
;

P4:
	'forty'
	{action: '40'}
;

P5:
	'fifty'
	{action: '50'}
;

P6:
	'sixty'
	{action: '60'}
;

P7:
	'seventy'
	{action: '70'}
;

P8:
	'eighty'
	{action: '80'}
;

P9:
	'ninety'
	{action: '90'}
;

P10:
	P2|P3|P4|P5|P6|P7|P8|P9
	{action: P2,P3,P4,P5,P6,P7,P8,P9}
;

P20:
	( ONES )
	{action: ONES}
;

P30:
	( TEENS )
	{action: TEENS}
;

P40:
	( P10 P20 )
	{action: P10 ,'+' ,P20}
;

P50:
	( P10, P20, P30, P40 ) +
	{action: P10 ,P20 ,P30 ,P40}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[decimals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <DeletedAgents>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[HUNDREDS]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[HUNDREDS_NUMERALS]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[Integer]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[Log]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[System]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
        </Properties>
      </Address>
      <Address Type="com.dejima.core.kernel.AgentAddress">
        <Properties Type="com.dejima.core.kernel.AgentAddress">
          <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
          <DomainName Type="java.lang.String"><![CDATA[integers]]></DomainName>
          <Name Type="java.lang.String"><![CDATA[Top]]></Name>
        </Properties>
      </Address>
    </DeletedAgents>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="Actuator" className="com.dejima.core.agents.ActuationAgent" domainName="decimals" xLocation="401" yLocation="125" expanded="true" visible="true" />
    <AgentVisualization name="Decimal" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="317" yLocation="231" expanded="true" visible="true" />
    <AgentVisualization name="DecimalNumber" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="180" yLocation="311" expanded="true" visible="true" />
    <AgentVisualization name="HUNDREDS" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="317" yLocation="365" expanded="true" visible="true" />
    <AgentVisualization name="HUNDREDS_NUMERALS" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="317" yLocation="301" expanded="true" visible="true" />
    <AgentVisualization name="Interaction" className="com.dejima.core.agents.InteractionAgent" domainName="decimals" xLocation="240" yLocation="119" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="decimals" xLocation="113" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="ONES" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="394" yLocation="496" expanded="true" visible="true" />
    <AgentVisualization name="TEENS" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="246" yLocation="496" expanded="true" visible="true" />
    <AgentVisualization name="TENS" className="com.dejima.core.agents.AASAPAgent" domainName="decimals" xLocation="317" yLocation="443" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

