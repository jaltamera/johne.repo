<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="4.5.1.10 " SDKVersion="4.5.1.10 " locale="en_US">
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
    <LibraryRoot path="library" />
  </DejimaAgentNetworkDefaults>
  <DejimaAgentNetworkAgentList TopAgent="Ordinal.com.dejima.templates.TemplatizedAgent@orinals">
    <Agent>
      <Properties Type="com.dejima.serviceProviders.ServiceProvidersActuationAgent">
        <AddAmbiguitiesToResult Type="java.lang.Boolean"><![CDATA[false]]></AddAmbiguitiesToResult>
        <AddKeywordAttributeToHints Type="java.lang.Boolean"><![CDATA[false]]></AddKeywordAttributeToHints>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <EnableAmbiguityHint Type="java.lang.Boolean"><![CDATA[true]]></EnableAmbiguityHint>
        <EnableApplicableObjectsHint Type="java.lang.Boolean"><![CDATA[false]]></EnableApplicableObjectsHint>
        <EnableGeneralHint Type="java.lang.Boolean"><![CDATA[false]]></EnableGeneralHint>
        <EnableRelevantCommandsHint Type="java.lang.Boolean"><![CDATA[false]]></EnableRelevantCommandsHint>
        <EnableRelevantFieldsHint Type="java.lang.Boolean"><![CDATA[false]]></EnableRelevantFieldsHint>
        <GenerateResults Type="java.lang.Boolean"><![CDATA[true]]></GenerateResults>
        <MaxRelevantDistance Type="java.lang.Integer"><![CDATA[1]]></MaxRelevantDistance>
        <MaximumResults Type="java.lang.Integer"><![CDATA[50]]></MaximumResults>
        <NoActuationText Type="java.lang.String"><![CDATA[No response!]]></NoActuationText>
        <NoInterpretationText Type="java.lang.String"><![CDATA[Unable to interpret input]]></NoInterpretationText>
        <ServiceProviders Type="java.util.List">
          <Properties Type="java.util.ArrayList" />
        </ServiceProviders>
        <UpdateContextForAmbiguityHint Type="java.lang.Boolean"><![CDATA[true]]></UpdateContextForAmbiguityHint>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[hundredthStandalone:
	&lt;exact&gt; 'hundredth'
	{action: '100'}
;

hundredStandalone:
	&lt;exact&gt; 'hundred'
	{action: '100'}
;


P2:
	(ONES | TEENS /*| TENS*/) hundredthStandalone
	{action: '(',ONES, /*TENS,*/ TEENS,')' , '*' , hundredthStandalone}
;

P3:
	(hundredStandalone | P2) ['and'] TENS_ORDINAL
	{action: hundredStandalone,P2, '+ ',TENS_ORDINAL}
;

P4:
	(hundredStandalone | P2) ['and'] TEENS_ORDINAL
	{action: hundredStandalone, P2 ,'+ ',TEENS_ORDINAL}
;


CATCH:
	(hundredthStandalone, P2, P3, P4, TENS_ORDINAL)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
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
	HUNDREDS_ORDINAL
	{action: com.dejima.library.evaluate.EvaluateActuation: evaluateExpression(HUNDREDS_ORDINAL)}
	{ambiguity action: com.dejima.library.evaluate.EvaluateActuation: evaluateExpression(HUNDREDS_ORDINAL)}
;

DIGIT:
	/NUMBER:ORD(0,100000,1)
	{action: *.number}
	{ambiguity action: *.number}
;

CATCH:
	(LETTERS | DIGIT)+
	{action: LETTERS,DIGIT}
	{ambiguity action: LETTERS,DIGIT}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.PresentationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
        <DefaultUserName Type="java.lang.String"><![CDATA[DefaultUser]]></DefaultUserName>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/presentation_agent.gif]]></Icon>
          </Properties>
        </Description>
        <FormatException Type="java.lang.String"><![CDATA[Requested formatter does not exist]]></FormatException>
        <Formatters Type="java.util.List">
          <Properties Type="java.util.ArrayList" />
        </Formatters>
        <HistoryCleanupInterval Type="long"><![CDATA[1000]]></HistoryCleanupInterval>
        <HistoryCleanupThreadPriority Type="int"><![CDATA[1]]></HistoryCleanupThreadPriority>
        <InteractionHistoryDepth Type="int"><![CDATA[10]]></InteractionHistoryDepth>
        <InteractionTimeOut Type="java.lang.Long"><![CDATA[600000]]></InteractionTimeOut>
        <KeepContext Type="boolean"><![CDATA[true]]></KeepContext>
        <MaxConcurrentQueries Type="int"><![CDATA[-1]]></MaxConcurrentQueries>
        <MaxConcurrentQueriesText Type="java.lang.String"><![CDATA[Maximum number of queries that system can handle reliably is achieved. Please wait a couple of minutes and then resubmit your query.]]></MaxConcurrentQueriesText>
        <MaxInputLength Type="int"><![CDATA[100]]></MaxInputLength>
        <MaxInputLengthText Type="java.lang.String"><![CDATA[Your query was too long to be processed. Please shorten and resubmit your query.]]></MaxInputLengthText>
        <NoInputText Type="java.lang.String"><![CDATA[No input found]]></NoInputText>
        <NoResultText Type="java.lang.String"><![CDATA[No result found]]></NoResultText>
        <ProfileManager Type="com.dejima.core.agents.ProfileManager">
          <Properties Type="com.dejima.core.agents.DefaultProfileManager" />
        </ProfileManager>
        <PromptText Type="java.lang.String"><![CDATA[How can I help you?]]></PromptText>
        <TimeOutText Type="java.lang.String"><![CDATA[Time out expired]]></TimeOutText>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.liveInterpretation.LiveInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/dbase_icon.gif]]></Icon>
          </Properties>
        </Description>
        <Enabled Type="java.lang.Boolean"><![CDATA[true]]></Enabled>
        <Matchers Type="java.util.List">
          <Properties Type="java.util.ArrayList" />
        </Matchers>
        <MaxWaitTime Type="long"><![CDATA[60000]]></MaxWaitTime>
        <PeformMatchesInParallel Type="java.lang.Boolean"><![CDATA[true]]></PeformMatchesInParallel>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
	&lt;exact&gt; ('one')
   {attributes: 'private'}
	{action:  '1'}
;

P2:
	&lt;exact&gt; ('two')
   {attributes: 'private'}
	{action:  '2'}
;

P3:
	&lt;exact&gt; ('three')
   {attributes: 'private'}
	{action:  '3'}
;

P4:
	&lt;exact&gt; ('four')
   {attributes: 'private'}
	{action:  '4'}
;

P5:
	&lt;exact&gt; ('five')
   {attributes: 'private'}
	{action:  '5'}
;

P6:
	&lt;exact&gt; ('six')
   {attributes: 'private'}
	{action:  '6'}
;

P7:
	&lt;exact&gt; ('seven')
   {attributes: 'private'}
	{action:  '7'}
;

P8:
	&lt;exact&gt; ('eight')
   {attributes: 'private'}
	{action:  '8'}
;

P9:
	&lt;exact&gt; ('nine')
   {attributes: 'private'}
	{action:  '9'}
;

P0:
	'zero'
   {attributes: 'private'}
	{action:  '0'}
;

main:
	(P1|P2|P3|P4|P5|P6|P7|P8|P9|P0)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
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
	&lt;exact&gt; ('first'|'1st')
   {attributes: 'private'}
	{action:  '1'}
;

P2:
	&lt;exact&gt; ('second'|'2nd')
   {attributes: 'private'}
	{action:  '2'}
;

P3:
	&lt;exact&gt; ('third'|'3rd')
   {attributes: 'private'}
	{action:  '3'}
;

P4:
	&lt;exact&gt; ('fourth'|'4th')
   {attributes: 'private'}
	{action:  '4'}
;

P5:
	&lt;exact&gt; ('fifth'|'5th')
   {attributes: 'private'}
	{action:  '5'}
;

P6:
	&lt;exact&gt; ('sixth'|'6th')
   {attributes: 'private'}
	{action:  '6'}
;

P7:
	&lt;exact&gt; ('seventh'|'7th')
   {attributes: 'private'}
	{action:  '7'}
;

P8:
	&lt;exact&gt; ('eighth'|'8th')
   {attributes: 'private'}
	{action:  '8'}
;

P9:
	&lt;exact&gt; ('ninth'|'9th')
   {attributes: 'private'}
	{action:  '9'}
;

P11:
	(P1|P2|P3|P4|P5|P6|P7|P8|P9)+
	{action: P1,P2,P3,P4,P5,P6,P7,P8,P9}
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
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
        <Tag Type="java.lang.String"><![CDATA[Ordinal]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[number.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[number.template]]></Source>
          </Properties>
        </TemplateInfo>
        <TemplateProperties Type="java.util.List">
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[minVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preposition]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[variableNoiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[variable_noise.txt]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[equalsTo]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ (['is'] ~ ['equal' ~ ['to']]|'isEqualTo'|'=')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[enableFilterDownChainClaimsWithMoreRelations]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[explicitReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[beforeValue]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLeftGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[primaryKey]]></Name>
                <Value Type="java.lang.String"><![CDATA[ID]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[singleSlot]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preference]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRecency]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[downChainColumn]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportAmbiguity]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) ~ (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[domainKeyword]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[orMatch]]></Name>
                <Value Type="java.lang.String"><![CDATA[object ~^ ('+' object)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[enableFilterNonFieldSubclaims]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[enableFilterDownChainAtomicSubclaims]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[andKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA['and']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[tableName]]></Name>
                <Value Type="java.lang.String"><![CDATA[Ordinal]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[downChainJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultColumnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[groups]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[enableFilterDownChainClaims]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[orKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA['or']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[itKeyword]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportOR]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[orinals]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINALS]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[false]]></AutoApplyXmlTags>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.templates.TemplatizedAgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/system_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <Tag Type="java.lang.String"><![CDATA[System]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[system.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[system.template]]></Source>
          </Properties>
        </TemplateInfo>
        <TemplateProperties Type="java.util.List">
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRemove]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[addKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[('+'|'add'|'and'|'&amp;')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[addNewKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[(('+'|'add'|'and'|'&amp;') ~ 'new')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportAmbiguity]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[intent]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportAddNew]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[removeKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[('-'|'not')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMultipleCommands]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preferExplicitReferences]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportAdd]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[ignoredTag]]></Name>
                <Value Type="java.lang.String"><![CDATA[Ignored]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[replaceKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[('make that'|'make it')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportReplace]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRecency]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[orinals]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Ordinal]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
	'ten'
   {attributes: 'private'}
	{action:  '10'}
;

P2:
	'eleven'
   {attributes: 'private'}
	{action:  '11'}
;

P3:
	'twelve'
   {attributes: 'private'}
	{action:  '12'}
;

P4:
	'thirteen'
   {attributes: 'private'}
	{action:  '13'}
;

P5:
	'fourteen'
   {attributes: 'private'}
	{action:  '14'}
;

P6:
	'fifteen'
   {attributes: 'private'}
	{action:  '15'}
;

P7:
	'sixteen'
   {attributes: 'private'}
	{action:  '16'}
;

P8:
	'seventeen'
   {attributes: 'private'}
	{action:  '17'}
;

P9:
	'eighteen'
   {attributes: 'private'}
	{action:  '18'}
;

P10:
	'nineteen'
   {attributes: 'private'}
	{action:  '19'}
;

main:
	(P1|P2|P3|P4|P5|P6|P7|P8|P9|P10)+
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
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
	&lt;exact&gt; ('tenth' | '10th')
   {attributes: 'private'}
	{action:  '10'}
;

P2:
	&lt;exact&gt; ('eleventh' | '11th')
   {attributes: 'private'}
	{action:  '11'}
;

P3:
	&lt;exact&gt; ('twelvth'|'12th')
   {attributes: 'private'}
	{action:  '12'}
;

P4:
	&lt;exact&gt; ('thirteenth'|'13th')
   {attributes: 'private'}
	{action:  '13'}
;

P5:
	&lt;exact&gt; ('fourteenth'|'14th')
   {attributes: 'private'}
	{action:  '14'}
;

P6:
	&lt;exact&gt; ('fifteenth'|'15th')
   {attributes: 'private'}
	{action:  '15'}
;

P7:
	&lt;exact&gt; ('sixteenth'|'16th')
   {attributes: 'private'}
	{action:  '16'}
;

P8:
	&lt;exact&gt; ('seventeenth'|'17th')
   {attributes: 'private'}
	{action:  '17'}
;

P9:
	&lt;exact&gt; ('eighteenth'|'18th')
   {attributes: 'private'}
	{action:  '18'}
;

P10:
	&lt;exact&gt; ('nineteenth'|'19th')
   {attributes: 'private'}
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
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
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
   {attributes: 'private'}
	{action: '20'}
;

P3:
	'thirty'
   {attributes: 'private'}
	{action: '30'}
;

P4:
	'forty'
   {attributes: 'private'}
	{action: '40'}
;

P5:
	'fifty'
   {attributes: 'private'}
	{action: '50'}
;

P6:
	'sixty'
   {attributes: 'private'}
	{action: '60'}
;

P7:
	'seventy'
   {attributes: 'private'}
	{action: '70'}
;

P8:
	'eighty'
   {attributes: 'private'}
	{action: '80'}
;

P9:
	'ninety'
   {attributes: 'private'}
	{action: '90'}
;

tensStandalone:
	P2|P3|P4|P5|P6|P7|P8|P9
   {attributes: 'private'}
;

tens:
	( tensStandalone ONES)
   {attributes: 'private'}
	{action: tensStandalone ,'+' ,ONES}
;

main:
	( tensStandalone, ONES, TEENS, tens) +
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TENS_ORDINAL]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[P2th:
	&lt;exact&gt; 'twentieth'
   {attributes: 'private'}
	{action: '20'}
;

P3th:
	&lt;exact&gt; 'thirtieth'
   {attributes: 'private'}
	{action: '30'}
;

P4th:
	&lt;exact&gt; 'fortieth'
   {attributes: 'private'}
	{action: '40'}
;

P5th:
	&lt;exact&gt; 'fiftieth'
   {attributes: 'private'}
	{action: '50'}
;

P6th:
	&lt;exact&gt; 'sixtieth'
   {attributes: 'private'}
	{action: '60'}
;

P7th:
	&lt;exact&gt; 'seventieth'
   {attributes: 'private'}
	{action: '70'}
;

P8th:
	&lt;exact&gt; 'eightieth'
   {attributes: 'private'}
	{action: '80'}
;

P9th:
	&lt;exact&gt; 'ninetieth'
   {attributes: 'private'}
	{action: '90'}
;

tensStandaloneOrdinal:
	P2th|P3th|P4th|P5th|P6th|P7th|P8th|P9th
   {attributes: 'private'}
;

P2:
	&lt;exact&gt; 'twenty'
   {attributes: 'private'}
	{action: '20'}
;

P3:
	&lt;exact&gt; 'thirty'
   {attributes: 'private'}
	{action: '30'}
;

P4:
	&lt;exact&gt; 'forty'
   {attributes: 'private'}
	{action: '40'}
;

P5:
	&lt;exact&gt; 'fifty'
   {attributes: 'private'}
	{action: '50'}
;

P6:
	&lt;exact&gt; 'sixty'
   {attributes: 'private'}
	{action: '60'}
;

P7:
	&lt;exact&gt; 'seventy'
   {attributes: 'private'}
	{action: '70'}
;

P8:
	&lt;exact&gt; 'eighty'
   {attributes: 'private'}
	{action: '80'}
;

P9:
	&lt;exact&gt; 'ninety'
   {attributes: 'private'}
	{action: '90'}
;

tensStandaloneInteger:
	P2|P3|P4|P5|P6|P7|P8|P9
   {attributes: 'private'}
;

tensOrdinal:
	(tensStandaloneInteger ONES_ORDINAL)
	{action: tensStandaloneInteger ,'+' ,ONES_ORDINAL}
;

main:
	( tensStandaloneOrdinal, ONES_ORDINAL, TEENS_ORDINAL, tensOrdinal) +
;]]></Policies>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[HUNDREDS_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ONES_ORDINAL]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[TEENS_ORDINAL]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.SynonymLearningAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Top]]></Name>
          </Properties>
        </Address>
        <AllSynonymsTag Type="java.lang.String"><![CDATA[AllSynonyms]]></AllSynonymsTag>
        <AmbiguityTag Type="java.lang.String"><![CDATA[Ambiguity]]></AmbiguityTag>
        <AutoApplyXmlTags Type="java.lang.Boolean"><![CDATA[false]]></AutoApplyXmlTags>
        <Criteria Type="com.dejima.core.nlp.text.MatchCriteria">
          <Properties Type="com.dejima.core.nlp.text.MatchCriteria">
            <CriteriaPriority Type="java.lang.String"><![CDATA[1,2,3,5,7,8,9,10,11]]></CriteriaPriority>
          </Properties>
        </Criteria>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.templates.TemplatizedAgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/top_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <DisplayTag Type="java.lang.String"><![CDATA[DisplayingSynonyms]]></DisplayTag>
        <ForgetTag Type="java.lang.String"><![CDATA[Forget]]></ForgetTag>
        <LearnTag Type="java.lang.String"><![CDATA[Learn]]></LearnTag>
        <LearntSynonymsTag Type="java.lang.String"><![CDATA[LearntSynonyms]]></LearntSynonymsTag>
        <Policies Type="java.lang.String" />
        <RelationTag Type="java.lang.String"><![CDATA[Synonym]]></RelationTag>
        <SourceTag Type="java.lang.String"><![CDATA[Source]]></SourceTag>
        <Tag Type="java.lang.String"><![CDATA[Top]]></Tag>
        <TargetTag Type="java.lang.String"><![CDATA[Target]]></TargetTag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[top.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[top.template]]></Source>
          </Properties>
        </TemplateInfo>
        <TemplateProperties Type="java.util.List">
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[minLearningVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[interpretation]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[inputTag]]></Name>
                <Value Type="java.lang.String"><![CDATA[Input]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[addRecencyAttribute]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxLearningVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[20]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLearning]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[followupCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[/BOI ('+'|'-'|';'|'..')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[LearningVariableNoiseFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[minLearningVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[understoodTag]]></Name>
                <Value Type="java.lang.String"><![CDATA[Understood]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[orinals]]></Uri>
        <UsedSynonymsTag Type="java.lang.String"><![CDATA[UsedSynonyms]]></UsedSynonymsTag>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[orinals]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="Actuator" className="com.dejima.serviceProviders.ServiceProvidersActuationAgent" domainName="orinals" xLocation="413" yLocation="117" expanded="true" visible="true" />
    <AgentVisualization name="HUNDREDS_ORDINAL" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="321" yLocation="520" expanded="true" visible="true" />
    <AgentVisualization name="HUNDREDS_ORDINALS" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="317" yLocation="459" expanded="true" visible="true" />
    <AgentVisualization name="Interaction" className="com.dejima.core.agents.PresentationAgent" domainName="orinals" xLocation="195" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="LiveInterpretation" className="com.dejima.liveInterpretation.LiveInterpretationAgent" domainName="orinals" xLocation="246" yLocation="167" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="orinals" xLocation="113" yLocation="271" expanded="true" visible="true" />
    <AgentVisualization name="ONES" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="727" yLocation="659" expanded="true" visible="true" />
    <AgentVisualization name="ONES_ORDINAL" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="387" yLocation="652" expanded="true" visible="true" />
    <AgentVisualization name="Ordinal" className="com.dejima.templates.TemplatizedAgent" domainName="orinals" xLocation="317" yLocation="387" expanded="true" visible="true" />
    <AgentVisualization name="System" className="com.dejima.templates.TemplatizedAgent" domainName="orinals" xLocation="317" yLocation="323" expanded="true" visible="true" />
    <AgentVisualization name="TEENS" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="579" yLocation="659" expanded="true" visible="true" />
    <AgentVisualization name="TEENS_ORDINAL" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="246" yLocation="654" expanded="true" visible="true" />
    <AgentVisualization name="TENS" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="642" yLocation="604" expanded="true" visible="true" />
    <AgentVisualization name="TENS_ORDINAL" className="com.dejima.core.agents.AASAPAgent" domainName="orinals" xLocation="317" yLocation="601" expanded="true" visible="true" />
    <AgentVisualization name="Top" className="com.dejima.core.agents.SynonymLearningAgent" domainName="orinals" xLocation="317" yLocation="255" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay>
    <Message>ClaimMessage</Message>
  </SelectedMessagesToDisplay>
</DejimaAgentNetwork>

