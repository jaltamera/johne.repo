<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="5.0.0.139 " SDKVersion="5.0.0.139 " locale="en_US">
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
  <DejimaAgentNetworkAgentList TopAgent="StreetAddress.com.dejima.templates.TemplatizedAgent@streetAddress">
    <Agent>
      <Properties Type="com.dejima.serviceProviders.ServiceProvidersActuationAgent">
        <AddAmbiguitiesToResult Type="java.lang.Boolean"><![CDATA[false]]></AddAmbiguitiesToResult>
        <AddKeywordAttributeToHints Type="java.lang.Boolean"><![CDATA[false]]></AddKeywordAttributeToHints>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Address]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Address]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLeftGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Address]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[Address]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preference]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with'|'which starts with'|'that starts with')]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing'|'include'|'including')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[AptNumber]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA[Number]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[AptNumber]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[AptNumber]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with')]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[andKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA['and']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.SynonymLearningAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
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
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[top.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[top.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Tag>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[followupCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[/BOI ('+'|'-'|';'|'..')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLearning]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxLearningVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[20]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
        <UsedSynonymsTag Type="java.lang.String"><![CDATA[UsedSynonyms]]></UsedSynonymsTag>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.PresentationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Latitude]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Latitude]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLeftGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Latitude]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[Latitude]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with'|'which starts with'|'that starts with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing'|'include'|'including')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.liveInterpretation.LiveInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.liveInterpretation.TestLiveInterpretationMatcher">
                <Enabled Type="java.lang.Boolean"><![CDATA[true]]></Enabled>
                <InexactMatch Type="java.lang.Boolean"><![CDATA[false]]></InexactMatch>
                <LiveInterpretationDefintionStore Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                  <Properties Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                    <IdbDataStoreNames Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[StreetName]]></Value>
                        <Value Type="java.lang.String"><![CDATA[StreetName]]></Value>
                      </Properties>
                    </IdbDataStoreNames>
                    <ReturnFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[Almaden blvd]]></Value>
                        <Value Type="java.lang.String"><![CDATA[Central expwy]]></Value>
                      </Properties>
                    </ReturnFields>
                    <SearchFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[test]]></Value>
                      </Properties>
                    </SearchFields>
                  </Properties>
                </LiveInterpretationDefintionStore>
                <MatchType Type="int"><![CDATA[2]]></MatchType>
                <MatcherName Type="java.lang.String"><![CDATA[test]]></MatcherName>
                <MaxAdjacentTokens Type="int"><![CDATA[4]]></MaxAdjacentTokens>
                <MinTokenSize Type="int"><![CDATA[2]]></MinTokenSize>
                <NoiseFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[common.txt]]></Name>
                    <Source Type="java.lang.String"><![CDATA[common.txt]]></Source>
                  </Properties>
                </NoiseFile>
                <WordBoundaryMatch Type="java.lang.Boolean"><![CDATA[true]]></WordBoundaryMatch>
              </Properties>
            </Value>
          </Properties>
        </Matchers>
        <MaxWaitTime Type="long"><![CDATA[60000]]></MaxWaitTime>
        <PerformMatchesInParallel Type="java.lang.Boolean"><![CDATA[true]]></PerformMatchesInParallel>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Log]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Longitude]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Longitude]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportLeftGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Longitude]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[Longitude]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with'|'which starts with'|'that starts with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing'|'include'|'including')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Neighborhood]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Neighborhood]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('is' ~ ['equal' ~ ['to']]|'isEqualTo'|'=')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
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
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Neighborhood]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[Neighborhood]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.AASAPAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
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
        <Policies Type="java.lang.String"><![CDATA[number:
   /NUMBER:CARD
   {attributes: 'private'}
   {action: *.number} 
;

numbers:
  number+
;]]></Policies>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
          </Properties>
        </SynonymTable>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[PostCode]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
                <Value Type="java.lang.String"><![CDATA[with]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA[PostCodeNumber]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[PostCode]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[PostCode]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preference]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with'|'which starts with'|'that starts with')]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing'|'include'|'including')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.regularexpression.RegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCodeNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.regularexpression.RegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCodeNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.regularexpression.RegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCodeNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.regularexpression.RegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCodeNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.library.regularexpression.RegularExpressionAgent">
        <AddCData Type="java.lang.Boolean"><![CDATA[true]]></AddCData>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.library.regularexpression.RegularExpressionAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCodeNumber]]></Name>
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
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <RegularExpression Type="java.lang.String"><![CDATA[\b[0-9]{5}\b]]></RegularExpression>
        <Tag Type="java.lang.String" />
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
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
        <ExplanationFile Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String"><![CDATA[address]]></Directory>
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddressExplanation.xml]]></Name>
            <Source Type="java.lang.String"><![CDATA[address\streetAddressExplanation.xml]]></Source>
          </Properties>
        </ExplanationFile>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[StreetAddress]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.template]]></Source>
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
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ (['is'] ~ ['equal' ~ ['to']]|'isEqualTo')]]></Value>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[primaryKey]]></Name>
                <Value Type="java.lang.String"><![CDATA[ID]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[StreetAddress]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
                <Value Type="java.lang.String" />
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
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Address]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Latitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Longitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Neighborhood]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Address]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Latitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Longitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Neighborhood]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Address]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Latitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Longitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Neighborhood]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Address]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[AptNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Latitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Longitude]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Neighborhood]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[PostCode]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetName]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[StreetName]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetName.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetName.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA['']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
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
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[StreetName]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[StreetName]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[4]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with'|'which starts with'|'that starts with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing'|'include'|'including')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetNumber]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/field_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <Policies Type="java.lang.String" />
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[StreetNumber]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[field.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[field.template]]></Source>
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
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseMinTokenLength]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[file]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportContextLookup]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[datasourceAgent]]></Name>
                <Value Type="java.lang.String"><![CDATA[Number]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[afterValue]]></Name>
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
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportRightGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isPartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isPartOf' | ('is part of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportValueRange]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[StreetNumber]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[leCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('le'|'&lt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[liveInterpretationTable]]></Name>
                <Value Type="java.lang.String"><![CDATA[StreetNumber]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isStartOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isStartOf' | ('is start of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMiddleGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maxVariableSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[minVariableNonNoiseTokenSize]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[1]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[startsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('startsWith'|'starts with'|'starting with'|'which start with'|'that start with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[contains]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('contains'|'containing')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[field]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isValueOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isValueOf' | ('is' ~ ['the'] ~ 'value of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportKeywordOnlyMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[implicitMatch]]></Name>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[ltCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('lt'|'&lt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[adjacentReference]]></Name>
                <Value Type="java.lang.String"><![CDATA['this'|'that'|'those'|'the'|'these']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[geCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('ge'|'&gt;=') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[columnName]]></Name>
                <Value Type="java.lang.String"><![CDATA[Address]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[maybeExplicitMatch]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[isEndOf]]></Name>
                <Value Type="java.lang.String"><![CDATA[('isEndOf' | ('is end of')) (kwd|adjacentReference)]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.AASAPAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Number]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
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
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[streetAddress.synonym]]></Source>
          </Properties>
        </SynonymTable>
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
                <Name Type="java.lang.String"><![CDATA[addNewKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[(('+'|'add'|'and'|'&amp;') ~ 'new')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[addKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[('+'|'add'|'and'|'&amp;')]]></Value>
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
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportNarrowDown]]></Name>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[ignoredTag]]></Name>
                <Value Type="java.lang.String"><![CDATA[Ignored]]></Value>
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
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[replaceKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[('make that'|'make it')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[ignoreUnrelatedPreviousCommandsOnNarrowDown]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[streetAddress]]></Uri>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DejimaInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[streetAddress]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[StreetAddress]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="Actuator" className="com.dejima.serviceProviders.ServiceProvidersActuationAgent" domainName="streetAddress" xLocation="564" yLocation="117" expanded="true" visible="true" />
    <AgentVisualization name="Address" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="227" yLocation="506" expanded="true" visible="true" />
    <AgentVisualization name="AptNumber" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="321" yLocation="515" expanded="true" visible="true" />
    <AgentVisualization name="DejimaInterpretation" className="com.dejima.core.agents.SynonymLearningAgent" domainName="streetAddress" xLocation="476" yLocation="230" expanded="true" visible="true" />
    <AgentVisualization name="Interaction" className="com.dejima.core.agents.PresentationAgent" domainName="streetAddress" xLocation="346" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="Latitude" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="949" yLocation="453" expanded="true" visible="true" />
    <AgentVisualization name="LiveInterpretation" className="com.dejima.liveInterpretation.LiveInterpretationAgent" domainName="streetAddress" xLocation="402" yLocation="164" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="streetAddress" xLocation="315" yLocation="200" expanded="true" visible="true" />
    <AgentVisualization name="Longitude" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="875" yLocation="490" expanded="true" visible="true" />
    <AgentVisualization name="Neighborhood" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="113" yLocation="510" expanded="true" visible="true" />
    <AgentVisualization name="Number" className="com.dejima.core.agents.AASAPAgent" domainName="streetAddress" xLocation="325" yLocation="617" expanded="true" visible="true" />
    <AgentVisualization name="PostCode" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="730" yLocation="496" expanded="true" visible="true" />
    <AgentVisualization name="PostCodeNumber" className="com.dejima.library.regularexpression.RegularExpressionAgent" domainName="streetAddress" xLocation="760" yLocation="604" expanded="true" visible="true" />
    <AgentVisualization name="StreetAddress" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="476" yLocation="387" expanded="true" visible="true" />
    <AgentVisualization name="StreetName" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="607" yLocation="566" expanded="true" visible="true" />
    <AgentVisualization name="StreetNumber" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="414" yLocation="548" expanded="true" visible="true" />
    <AgentVisualization name="System" className="com.dejima.templates.TemplatizedAgent" domainName="streetAddress" xLocation="476" yLocation="314" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

