<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="4.0.2.148 " SDKVersion="4.0.2.148 " locale="en_US">
  <DejimaAgentNetworkDefaults>
    <CommonWords filename="..\date\common.txt" minimumNonNoiseTokenSize="3" />
    <TokenMatchers>
      <TokenMatcher type="numeric" />
      <TokenMatcher type="substring" />
    </TokenMatchers>
  </DejimaAgentNetworkDefaults>
  <DejimaAgentNetworkAgentList TopAgent="Date.com.dejima.templates.TemplatizedAgent@date" extendsOPAL="date.opal" extendsPath="..\date\">
    <Agent>
      <Properties Type="com.dejima.templates.TemplatizedAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.templates.TemplatizedAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[date]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[Date]]></Name>
          </Properties>
        </Address>
        <TemplateProperties Type="java.util.List">
          <Properties Type="java.util.ArrayList">
            <Value>
              <Properties Type="com.dejima.templates.BooleanTemplateProperty">
                <Name Type="java.lang.String"><![CDATA[defaultDayToFuture]]></Name>
                <Value Type="java.lang.Boolean"><![CDATA[true]]></Value>
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
      </Properties>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING">
    <AgentVisualization name="AbsoluteDate" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="583" yLocation="482" expanded="true" visible="true" />
    <AgentVisualization name="actuator" className="com.dejima.core.agents.ActuationAgent" domainName="date" xLocation="508" yLocation="120" expanded="true" visible="true" />
    <AgentVisualization name="AfterDate" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="477" yLocation="320" expanded="true" visible="true" />
    <AgentVisualization name="BeforeDate" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="316" yLocation="316" expanded="true" visible="true" />
    <AgentVisualization name="Date" className="com.dejima.templates.TemplatizedAgent" domainName="date" xLocation="399" yLocation="220" expanded="true" visible="true" />
    <AgentVisualization name="DATE_DAY" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="710" yLocation="532" expanded="true" visible="true" />
    <AgentVisualization name="DATE_MONTH_NUMERIC" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="716" yLocation="601" expanded="true" visible="true" />
    <AgentVisualization name="DATE_MONTH_TEXT" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="633" yLocation="676" expanded="true" visible="true" />
    <AgentVisualization name="DATE_ONES" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="890" yLocation="581" expanded="true" visible="true" />
    <AgentVisualization name="DATE_QUALIFIER" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="577" yLocation="702" expanded="true" visible="true" />
    <AgentVisualization name="DATE_RANGE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="419" yLocation="553" expanded="true" visible="true" />
    <AgentVisualization name="DATE_TENS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="789" yLocation="557" expanded="true" visible="true" />
    <AgentVisualization name="FOUR_DIGIT_YEAR_VALUE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="698" yLocation="628" expanded="true" visible="true" />
    <AgentVisualization name="io" className="com.dejima.core.agents.InteractionAgent" domainName="date" xLocation="300" yLocation="113" expanded="true" visible="true" />
    <AgentVisualization name="Log" className="com.dejima.core.agents.LogAgent" domainName="date" xLocation="190" yLocation="158" expanded="true" visible="true" />
    <AgentVisualization name="OFFSETED_PERIOD" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="301" yLocation="738" expanded="true" visible="true" />
    <AgentVisualization name="ONE_AND_TWO_DIGIT_YEAR_VALUE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="673" yLocation="652" expanded="true" visible="true" />
    <AgentVisualization name="ONES_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="536" yLocation="1063" expanded="true" visible="true" />
    <AgentVisualization name="ORDINAL_PERIOD" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="151" yLocation="814" expanded="true" visible="true" />
    <AgentVisualization name="ORDINALS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="201" yLocation="950" expanded="true" visible="true" />
    <AgentVisualization name="PERIOD" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="432" yLocation="714" expanded="true" visible="true" />
    <AgentVisualization name="QUARTER_PERIOD" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="543" yLocation="803" expanded="true" visible="true" />
    <AgentVisualization name="RANGE_TENSE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="438" yLocation="601" expanded="true" visible="true" />
    <AgentVisualization name="RelativeDateRange" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="399" yLocation="502" expanded="true" visible="true" />
    <AgentVisualization name="RelativeSingleDate" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="316" yLocation="479" expanded="true" visible="true" />
    <AgentVisualization name="SINGLE_DATE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="297" yLocation="552" expanded="true" visible="true" />
    <AgentVisualization name="SINGLE_TENSE" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="243" yLocation="614" expanded="true" visible="true" />
    <AgentVisualization name="TEENS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="376" yLocation="1038" expanded="true" visible="true" />
    <AgentVisualization name="TENS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="609" yLocation="1008" expanded="true" visible="true" />
    <AgentVisualization name="TENS_NUMBERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="410" yLocation="826" expanded="true" visible="true" />
    <AgentVisualization name="TENS_NUMBERS_IN_LETTERS" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="526" yLocation="929" expanded="true" visible="true" />
    <AgentVisualization name="TheDate" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="403" yLocation="415" expanded="true" visible="true" />
    <AgentVisualization name="WEEKDAY" className="com.dejima.core.agents.AASAPAgent" domainName="date" xLocation="113" yLocation="693" expanded="true" visible="true" />
  </DejimaAgentNetworkLocations>
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

