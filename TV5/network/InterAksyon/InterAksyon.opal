<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="5.0.0.358 " SDKVersion="5.2.0.358 " locale="en_US">
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
  <DejimaAgentNetworkAgentList TopAgent="System.com.dejima.templates.TemplatizedAgent@x">
    <Agent>
      <Properties Type="com.dejima.serviceProviders.ServiceProvidersActuationAgent">
        <AddAmbiguitiesToResult Type="java.lang.Boolean"><![CDATA[true]]></AddAmbiguitiesToResult>
        <AddKeywordAttributeToHints Type="java.lang.Boolean"><![CDATA[false]]></AddKeywordAttributeToHints>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <DefaultServiceProvider Type="com.dejima.serviceProviders.ServiceProviderInterface">
          <Properties Type="com.dejima.serviceProviders.DatabaseServiceProvider">
            <AddJoinedTables Type="java.lang.Boolean"><![CDATA[false]]></AddJoinedTables>
            <Datasource Type="java.lang.String" />
            <Driver Type="java.lang.String"><![CDATA[sun.jdbc.odbc.JdbcOdbcDriver]]></Driver>
            <ExecuteSQL Type="java.lang.Boolean"><![CDATA[true]]></ExecuteSQL>
            <ForBrowse Type="java.lang.Boolean"><![CDATA[false]]></ForBrowse>
            <MaxResults Type="java.lang.String"><![CDATA[50]]></MaxResults>
            <Name Type="java.lang.String"><![CDATA[DatabaseServiceProvider]]></Name>
            <ObjectDefinitions Type="java.util.List">
              <Properties Type="java.util.ArrayList" />
            </ObjectDefinitions>
            <Password Type="java.lang.String" />
            <PerformRelatedObjectSearch Type="java.lang.Boolean"><![CDATA[false]]></PerformRelatedObjectSearch>
            <QuoteSQL Type="java.lang.Boolean"><![CDATA[false]]></QuoteSQL>
            <SqlConfiguration Type="com.dejima.core.agents.FileProperty">
              <Properties Type="com.dejima.core.agents.FileProperty">
                <Directory Type="java.lang.String" />
                <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                <Name Type="java.lang.String" />
                <Source Type="java.lang.String" />
              </Properties>
            </SqlConfiguration>
            <Url Type="java.lang.String"><![CDATA[jdbc:odbc:]]></Url>
            <Username Type="java.lang.String" />
          </Properties>
        </DefaultServiceProvider>
        <Description Type="com.dejima.core.kernel.AgentDescription">
          <Properties Type="com.dejima.core.kernel.AgentDescription">
            <Functionality Type="java.lang.String" />
            <Icon Type="java.lang.String"><![CDATA[/resources/agent.gif]]></Icon>
          </Properties>
        </Description>
        <EnableAmbiguityHint Type="java.lang.Boolean"><![CDATA[false]]></EnableAmbiguityHint>
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
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.serviceProviders.XPathServiceProviderMatcher">
                <ServiceProvider Type="com.dejima.serviceProviders.ServiceProviderInterface">
                  <Properties Type="com.dejima.serviceProviders.DatabaseServiceProvider">
                    <AddJoinedTables Type="java.lang.Boolean"><![CDATA[true]]></AddJoinedTables>
                    <Datasource Type="java.lang.String"><![CDATA[mmda]]></Datasource>
                    <Driver Type="java.lang.String"><![CDATA[sybase.jdbc.sqlanywhere.IDriver]]></Driver>
                    <ExecuteSQL Type="java.lang.Boolean"><![CDATA[true]]></ExecuteSQL>
                    <ForBrowse Type="java.lang.Boolean"><![CDATA[false]]></ForBrowse>
                    <MaxResults Type="java.lang.String"><![CDATA[20]]></MaxResults>
                    <Name Type="java.lang.String"><![CDATA[DatabaseServiceProvider]]></Name>
                    <ObjectDefinitions Type="java.util.List">
                      <Properties Type="java.util.ArrayList">
                        <Value>
                          <Properties Type="com.dejima.core.serviceProviders.ObjectDefinition">
                            <Fields Type="java.util.List">
                              <Properties Type="java.util.ArrayList">
                                <Value>
                                  <Properties Type="com.dejima.core.serviceProviders.FieldDefinition">
                                    <Hint Type="java.lang.String" />
                                    <IncludesAllPossibleValues Type="boolean"><![CDATA[false]]></IncludesAllPossibleValues>
                                    <Mandatory Type="boolean"><![CDATA[false]]></Mandatory>
                                    <Path Type="java.lang.String"><![CDATA[RoadName]]></Path>
                                    <PossibleValues Type="java.util.List">
                                      <Properties Type="java.util.ArrayList" />
                                    </PossibleValues>
                                    <ValidationRegExp Type="java.lang.String" />
                                  </Properties>
                                </Value>
                              </Properties>
                            </Fields>
                            <Path Type="java.lang.String"><![CDATA[Road]]></Path>
                          </Properties>
                        </Value>
                      </Properties>
                    </ObjectDefinitions>
                    <Password Type="java.lang.String"><![CDATA[sql]]></Password>
                    <PerformRelatedObjectSearch Type="java.lang.Boolean"><![CDATA[false]]></PerformRelatedObjectSearch>
                    <QuoteSQL Type="java.lang.Boolean"><![CDATA[true]]></QuoteSQL>
                    <SqlConfiguration Type="com.dejima.core.agents.FileProperty">
                      <Properties Type="com.dejima.core.agents.FileProperty">
                        <Directory Type="java.lang.String" />
                        <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                        <Name Type="java.lang.String"><![CDATA[sql.xml]]></Name>
                        <Source Type="java.lang.String"><![CDATA[sql.xml]]></Source>
                      </Properties>
                    </SqlConfiguration>
                    <Url Type="java.lang.String"><![CDATA[jdbc:sqlanywhere:]]></Url>
                    <Username Type="java.lang.String"><![CDATA[dba]]></Username>
                  </Properties>
                </ServiceProvider>
                <XPath Type="com.dejima.core.nlp.text.action.XPath">
                  <Properties Type="com.dejima.core.nlp.text.action.XPath">
                    <Expression Type="java.lang.String"><![CDATA[Inquire/Road]]></Expression>
                  </Properties>
                </XPath>
              </Properties>
            </Value>
          </Properties>
        </ServiceProviders>
        <UpdateContextForAmbiguityHint Type="java.lang.Boolean"><![CDATA[false]]></UpdateContextForAmbiguityHint>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Bound]]></Name>
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
            <Name Type="java.lang.String"><![CDATA[bound.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[bound.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Bound]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[booleanField.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[booleanField.template]]></Source>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[trueStateKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[south]]></Value>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Bound]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[Bound]]></Value>
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
                <Name Type="java.lang.String"><![CDATA[endsWith]]></Name>
                <Value Type="java.lang.String"><![CDATA[[preposition] ~ (kwd|adjacentReference) ~ ('endsWith'|'ends with'|'ending with'|'which end with'|'that end with'|'which ends with'|'that ends with')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[noiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[common.txt]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[falseStateKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[north]]></Value>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preposition]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[gtCondition]]></Name>
                <Value Type="java.lang.String"><![CDATA[(['is'] ~ ('gt'|'&gt;') ~ value)]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[syncFile]]></Name>
                <Value Type="java.lang.String" />
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
                <Name Type="java.lang.String"><![CDATA[defaultSlotFilling]]></Name>
                <Value Type="java.lang.String" />
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[trueStateOutput]]></Name>
                <Value Type="java.lang.String"><![CDATA[sb]]></Value>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[falseStateOutput]]></Name>
                <Value Type="java.lang.String"><![CDATA[nb]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[andKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA['and']]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.IntegerTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[fieldValueSelector]]></Name>
                <Value Type="java.lang.Integer"><![CDATA[3]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/object_agent.gif]]></Icon>
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
        <Tag Type="java.lang.String"><![CDATA[Exit]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[object.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[object.template]]></Source>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[primaryKey]]></Name>
                <Value Type="java.lang.String"><![CDATA[ID]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Exit]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[object]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[Exit]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Bound]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Flow]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Bound]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Flow]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Bound]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Flow]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Bound]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitName]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Flow]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitName]]></Name>
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
            <Name Type="java.lang.String"><![CDATA[exits.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[exits.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[ExitName]]></Tag>
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
                <Value Type="java.lang.String"><![CDATA[exits]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[ExitName]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[ExitName]]></Value>
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
                <Value Type="java.lang.String"><![CDATA['']]></Value>
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
                <Value Type="java.lang.String"><![CDATA[noise]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[orKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[true, 'or']]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/relation_agent.gif]]></Icon>
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
        <Tag Type="java.lang.String"><![CDATA[ExitTo]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[relation.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[relation.template]]></Source>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[relevance]]></Name>
                <Value Type="java.lang.String"><![CDATA[0]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[ExitTo]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[useQuotesInSql]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[relation]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Flow]]></Name>
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
            <Name Type="java.lang.String"><![CDATA[flow.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[flow.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Flow]]></Tag>
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
                <Value Type="java.lang.String"><![CDATA[flow]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[Flow]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[Flow]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Exit]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/command_agent.gif]]></Icon>
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
        <Tag Type="java.lang.String"><![CDATA[Inquire]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[command.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[command.template]]></Source>
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
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[enableFilterSubsetDownChainClaims]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportAmbiguity]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.FileTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[variableNoiseFile]]></Name>
                <Value Type="java.lang.String"><![CDATA[variable_noise.txt]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[type]]></Name>
                <Value Type="java.lang.String"><![CDATA[command]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[equalsTo]]></Name>
                <Value Type="java.lang.String"><![CDATA[kwd]]></Value>
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
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportGuess]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Inquire]]></Value>
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
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportJoin]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.interaksyon.formatter.SMSFormatter">
                <AddAmbiguousFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddAmbiguousFieldsQuestion>
                <AddExplanation Type="java.lang.Boolean"><![CDATA[false]]></AddExplanation>
                <AddHints Type="java.lang.Boolean"><![CDATA[false]]></AddHints>
                <AddInvalidFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddInvalidFieldsQuestion>
                <AddMissingFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddMissingFieldsQuestion>
                <AddResults Type="java.lang.Boolean"><![CDATA[true]]></AddResults>
                <AddResultsHeader Type="java.lang.Boolean"><![CDATA[false]]></AddResultsHeader>
                <AddResultsNoOfRecordsFound Type="java.lang.Boolean"><![CDATA[false]]></AddResultsNoOfRecordsFound>
                <AddXml Type="java.lang.Boolean"><![CDATA[false]]></AddXml>
                <AssignNumbersToAmbiguityChoices Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToAmbiguityChoices>
                <AssignNumbersToPossibleValues Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToPossibleValues>
                <DisplayPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[display2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[display2.xml]]></Source>
                  </Properties>
                </DisplayPropertyFile>
                <DisplayResultsInTable Type="java.lang.Boolean"><![CDATA[false]]></DisplayResultsInTable>
                <ExplanationPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[explanation2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[explanation2.xml]]></Source>
                  </Properties>
                </ExplanationPropertyFile>
                <MinResultsForAmbiguityHintMessage Type="java.lang.String"><![CDATA[5]]></MinResultsForAmbiguityHintMessage>
                <Name Type="java.lang.String"><![CDATA[traffic]]></Name>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.core.io.HTMLPresentationFormatter">
                <AddAmbiguousFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddAmbiguousFieldsQuestion>
                <AddExplanation Type="java.lang.Boolean"><![CDATA[false]]></AddExplanation>
                <AddHints Type="java.lang.Boolean"><![CDATA[false]]></AddHints>
                <AddInvalidFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddInvalidFieldsQuestion>
                <AddMissingFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddMissingFieldsQuestion>
                <AddResults Type="java.lang.Boolean"><![CDATA[true]]></AddResults>
                <AddResultsHeader Type="java.lang.Boolean"><![CDATA[true]]></AddResultsHeader>
                <AddResultsNoOfRecordsFound Type="java.lang.Boolean"><![CDATA[true]]></AddResultsNoOfRecordsFound>
                <AddXml Type="java.lang.Boolean"><![CDATA[false]]></AddXml>
                <AssignNumbersToAmbiguityChoices Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToAmbiguityChoices>
                <AssignNumbersToPossibleValues Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToPossibleValues>
                <DisplayPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[display2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[display2.xml]]></Source>
                  </Properties>
                </DisplayPropertyFile>
                <DisplayResultsInTable Type="java.lang.Boolean"><![CDATA[true]]></DisplayResultsInTable>
                <ExplanationPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[explanation2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[explanation2.xml]]></Source>
                  </Properties>
                </ExplanationPropertyFile>
                <MinResultsForAmbiguityHintMessage Type="java.lang.String"><![CDATA[5]]></MinResultsForAmbiguityHintMessage>
                <Name Type="java.lang.String"><![CDATA[html]]></Name>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.core.io.XMLPresentationFormatter">
                <AddAmbiguousFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddAmbiguousFieldsQuestion>
                <AddExplanation Type="java.lang.Boolean"><![CDATA[true]]></AddExplanation>
                <AddHints Type="java.lang.Boolean"><![CDATA[true]]></AddHints>
                <AddInvalidFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddInvalidFieldsQuestion>
                <AddMissingFieldsQuestion Type="java.lang.Boolean"><![CDATA[true]]></AddMissingFieldsQuestion>
                <AddResults Type="java.lang.Boolean"><![CDATA[true]]></AddResults>
                <AddResultsHeader Type="java.lang.Boolean"><![CDATA[true]]></AddResultsHeader>
                <AddResultsNoOfRecordsFound Type="java.lang.Boolean"><![CDATA[true]]></AddResultsNoOfRecordsFound>
                <AssignNumbersToAmbiguityChoices Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToAmbiguityChoices>
                <AssignNumbersToPossibleValues Type="java.lang.Boolean"><![CDATA[true]]></AssignNumbersToPossibleValues>
                <DisplayPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[display2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[display2.xml]]></Source>
                  </Properties>
                </DisplayPropertyFile>
                <ExplanationPropertyFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[explanation2.xml]]></Name>
                    <Source Type="java.lang.String"><![CDATA[explanation2.xml]]></Source>
                  </Properties>
                </ExplanationPropertyFile>
                <Name Type="java.lang.String"><![CDATA[xml]]></Name>
                <PrettyPrintOutput Type="java.lang.Boolean"><![CDATA[true]]></PrettyPrintOutput>
              </Properties>
            </Value>
          </Properties>
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
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.SynonymLearningAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
        <AllSynonymsTag Type="java.lang.String"><![CDATA[AllSynonyms]]></AllSynonymsTag>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/top_agent.gif]]></Icon>
            <UseDefaultIcon Type="java.lang.Boolean"><![CDATA[true]]></UseDefaultIcon>
          </Properties>
        </Description>
        <DisplayTag Type="java.lang.String"><![CDATA[DisplayingSynonyms]]></DisplayTag>
        <ForgetTag Type="java.lang.String"><![CDATA[Forget]]></ForgetTag>
        <LearnTag Type="java.lang.String"><![CDATA[Learn]]></LearnTag>
        <LearntSynonymsTag Type="java.lang.String"><![CDATA[LearntSynonyms]]></LearntSynonymsTag>
        <Policies Type="java.lang.String" />
        <RelationTag Type="java.lang.String"><![CDATA[Relation]]></RelationTag>
        <SourceTag Type="java.lang.String"><![CDATA[Source]]></SourceTag>
        <SynonymTable Type="com.dejima.core.nlp.text.SynonymTable">
          <Properties Type="com.dejima.core.nlp.text.FileBasedSynonymTable">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[Interpretation]]></Tag>
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
                <Value Type="java.lang.String"><![CDATA[true]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
        <UsedSynonymsTag Type="java.lang.String"><![CDATA[UsedSynonyms]]></UsedSynonymsTag>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InitiateInterpretationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.serviceProviders.ServiceProvidersActuationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Actuator]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[LiveInterpretation]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[System]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.liveInterpretation.LiveInterpretationAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.liveInterpretation.LiveInterpretationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
              <Properties Type="com.dejima.liveInterpretation.LiveDatabaseMatcher">
                <AddNoiseForAgent Type="java.lang.String" />
                <AgentKeywordGroups Type="java.lang.Boolean"><![CDATA[false]]></AgentKeywordGroups>
                <DataSourceName Type="java.lang.String"><![CDATA[DSN=mmda]]></DataSourceName>
                <DatabaseURL Type="java.lang.String"><![CDATA[jdbc:sqlanywhere:]]></DatabaseURL>
                <ForceCaseInsensitive Type="java.lang.Boolean"><![CDATA[true]]></ForceCaseInsensitive>
                <IncludeDownchainKeywords Type="java.lang.Boolean"><![CDATA[true]]></IncludeDownchainKeywords>
                <InexactMatch Type="java.lang.Boolean"><![CDATA[true]]></InexactMatch>
                <JDBCDriver Type="java.lang.String"><![CDATA[sybase.jdbc.sqlanywhere.IDriver]]></JDBCDriver>
                <LiveInterpretationDefintionStore Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                  <Properties Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                    <AllowDuplicates Type="boolean"><![CDATA[false]]></AllowDuplicates>
                    <IdbDataStoreNames Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[RoadName]]></Value>
                      </Properties>
                    </IdbDataStoreNames>
                    <ReturnFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[road_name]]></Value>
                      </Properties>
                    </ReturnFields>
                    <SearchFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[road_name]]></Value>
                      </Properties>
                    </SearchFields>
                  </Properties>
                </LiveInterpretationDefintionStore>
                <MatchType Type="int"><![CDATA[0]]></MatchType>
                <MatcherName Type="java.lang.String"><![CDATA[Road]]></MatcherName>
                <MaxAdjacentTokens Type="int"><![CDATA[4]]></MaxAdjacentTokens>
                <MaximumResults Type="java.lang.Integer"><![CDATA[50]]></MaximumResults>
                <MinTokenSize Type="int"><![CDATA[2]]></MinTokenSize>
                <NoiseFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String" />
                    <Source Type="java.lang.String" />
                  </Properties>
                </NoiseFile>
                <TableName Type="java.lang.String"><![CDATA[tbl_main]]></TableName>
                <UseDistinct Type="java.lang.Boolean"><![CDATA[true]]></UseDistinct>
                <UsePreparedStatement Type="java.lang.Boolean"><![CDATA[true]]></UsePreparedStatement>
                <UseSoundex Type="java.lang.Boolean"><![CDATA[false]]></UseSoundex>
                <UserName Type="java.lang.String"><![CDATA[dba]]></UserName>
                <UserPassword Type="java.lang.String"><![CDATA[sql]]></UserPassword>
                <WordBoundaryMatch Type="java.lang.Boolean"><![CDATA[true]]></WordBoundaryMatch>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.liveInterpretation.LiveDatabaseMatcher">
                <AddNoiseForAgent Type="java.lang.String" />
                <AgentKeywordGroups Type="java.lang.Boolean"><![CDATA[false]]></AgentKeywordGroups>
                <DataSourceName Type="java.lang.String"><![CDATA[DSN=mmda]]></DataSourceName>
                <DatabaseURL Type="java.lang.String"><![CDATA[jdbc:sqlanywhere:]]></DatabaseURL>
                <ForceCaseInsensitive Type="java.lang.Boolean"><![CDATA[true]]></ForceCaseInsensitive>
                <IncludeDownchainKeywords Type="java.lang.Boolean"><![CDATA[true]]></IncludeDownchainKeywords>
                <InexactMatch Type="java.lang.Boolean"><![CDATA[true]]></InexactMatch>
                <JDBCDriver Type="java.lang.String"><![CDATA[sybase.jdbc.sqlanywhere.IDriver]]></JDBCDriver>
                <LiveInterpretationDefintionStore Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                  <Properties Type="com.dejima.liveInterpretation.LiveInterpretationDefintionStore">
                    <AllowDuplicates Type="boolean"><![CDATA[false]]></AllowDuplicates>
                    <IdbDataStoreNames Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[ExitName]]></Value>
                      </Properties>
                    </IdbDataStoreNames>
                    <ReturnFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[exit_name]]></Value>
                      </Properties>
                    </ReturnFields>
                    <SearchFields Type="java.util.Vector">
                      <Properties Type="java.util.Vector">
                        <Value Type="java.lang.String"><![CDATA[exit_name]]></Value>
                      </Properties>
                    </SearchFields>
                  </Properties>
                </LiveInterpretationDefintionStore>
                <MatchType Type="int"><![CDATA[0]]></MatchType>
                <MatcherName Type="java.lang.String"><![CDATA[Exit]]></MatcherName>
                <MaxAdjacentTokens Type="int"><![CDATA[4]]></MaxAdjacentTokens>
                <MaximumResults Type="java.lang.Integer"><![CDATA[50]]></MaximumResults>
                <MinTokenSize Type="int"><![CDATA[2]]></MinTokenSize>
                <NoiseFile Type="com.dejima.core.agents.FileProperty">
                  <Properties Type="com.dejima.core.agents.FileProperty">
                    <Directory Type="java.lang.String" />
                    <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
                    <Name Type="java.lang.String"><![CDATA[exit_noise.txt]]></Name>
                    <Source Type="java.lang.String"><![CDATA[exit_noise.txt]]></Source>
                  </Properties>
                </NoiseFile>
                <TableName Type="java.lang.String"><![CDATA[tbl_exit]]></TableName>
                <UseDistinct Type="java.lang.Boolean"><![CDATA[true]]></UseDistinct>
                <UsePreparedStatement Type="java.lang.Boolean"><![CDATA[true]]></UsePreparedStatement>
                <UseSoundex Type="java.lang.Boolean"><![CDATA[false]]></UseSoundex>
                <UserName Type="java.lang.String"><![CDATA[dba]]></UserName>
                <UserPassword Type="java.lang.String"><![CDATA[sql]]></UserPassword>
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
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InteractionMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.PresentationAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interaction]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.core.agents.LogAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.LogAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
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
            <Icon Type="java.lang.String"><![CDATA[/resources/object_agent.gif]]></Icon>
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
        <Tag Type="java.lang.String"><![CDATA[Road]]></Tag>
        <TemplateInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String" />
            <IsLibraryCopy Type="boolean"><![CDATA[true]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[object.template]]></Name>
            <Source Type="java.lang.String"><![CDATA[object.template]]></Source>
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
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[primaryKey]]></Name>
                <Value Type="java.lang.String"><![CDATA[ID]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.StringTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[keyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[Road]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[object]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[Road]]></Value>
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
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
              </Properties>
            </Value>
          </Properties>
        </TemplateProperties>
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RoadName]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RoadName]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RoadName]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[ExitTo]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RoadName]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[RoadName]]></Name>
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
            <Name Type="java.lang.String"><![CDATA[roads.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[roads.synonym]]></Source>
          </Properties>
        </SynonymTable>
        <Tag Type="java.lang.String"><![CDATA[RoadName]]></Tag>
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
                <Value Type="java.lang.String"><![CDATA[roads]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[RoadName]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[RoadName]]></Value>
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
                <Value Type="java.lang.String"><![CDATA['']]></Value>
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
                <Value Type="java.lang.Integer"><![CDATA[2]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[true, 'or']]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.SetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Road]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
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
            <Name Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Name>
            <Source Type="java.lang.String"><![CDATA[agentNetwork.synonym]]></Source>
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
                <Value Type="java.lang.String"><![CDATA[/BOI (('+'|'add'|'and'|'&amp;') ~ 'new')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.ConditionTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[addKeyword]]></Name>
                <Value Type="java.lang.String"><![CDATA[/BOI ('+'|'add'|'and'|'&amp;'|'plus')]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[/BOI ('-'|'not'|'remove'|'delete')]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[supportMultipleCommands]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[false]]></Value>
              </Properties>
            </Value>
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[preferExplicitReferences]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
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
                <Value Type="java.lang.String"><![CDATA[/BOI ('make that'|'make it')]]></Value>
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
        <Uri Type="java.lang.String"><![CDATA[x]]></Uri>
        <UseFullAgentNames Type="boolean"><![CDATA[false]]></UseFullAgentNames>
      </Properties>
      <SendsTo messageType="com.dejima.core.messages.ActuationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.ClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.DelegationMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.GetMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.InterpretItMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.NoClaimMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
      <SendsTo messageType="com.dejima.core.messages.StandardMessage">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Inquire]]></Name>
          </Properties>
        </Address>
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.SynonymLearningAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[x]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Interpretation]]></Name>
          </Properties>
        </Address>
      </SendsTo>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="Actuator" className="com.dejima.serviceProviders.ServiceProvidersActuationAgent" domainName="x" xLocation="469" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="Bound" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="195" yLocation="663" expanded="true" visible="true" />
    <AgentVisualization name="Exit" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="211" yLocation="593" expanded="true" visible="true" />
    <AgentVisualization name="ExitName" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="279" yLocation="662" expanded="true" visible="true" />
    <AgentVisualization name="ExitTo" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="286" yLocation="537" expanded="true" visible="true" />
    <AgentVisualization name="Flow" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="113" yLocation="660" expanded="true" visible="true" />
    <AgentVisualization name="Inquire" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="360" yLocation="400" expanded="true" visible="true" />
    <AgentVisualization name="Interaction" className="com.dejima.core.agents.PresentationAgent" domainName="x" xLocation="259" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="Interpretation" className="com.dejima.core.agents.SynonymLearningAgent" domainName="x" xLocation="362" yLocation="257" expanded="true" visible="true" />
    <AgentVisualization name="LiveInterpretation" className="com.dejima.liveInterpretation.LiveInterpretationAgent" domainName="x" xLocation="311" yLocation="177" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="x" xLocation="224" yLocation="219" expanded="true" visible="true" />
    <AgentVisualization name="Road" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="331" yLocation="465" expanded="true" visible="true" />
    <AgentVisualization name="RoadName" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="373" yLocation="537" expanded="true" visible="true" />
    <AgentVisualization name="System" className="com.dejima.templates.TemplatizedAgent" domainName="x" xLocation="360" yLocation="322" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay>
    <Message>StandardMessage</Message>
  </SelectedMessagesToDisplay>
</DejimaAgentNetwork>

