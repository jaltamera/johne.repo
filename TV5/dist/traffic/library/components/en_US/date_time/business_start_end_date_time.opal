<?xml version="1.0" encoding="UTF-8"?>
<DejimaAgentNetwork CoreVersion="4.5.0.44 " SDKVersion="4.5.0.44 " locale="en_US">
  <DejimaAgentNetworkDefaults>
    <TokenMatchers>
      <TokenMatcher type="numeric" />
      <TokenMatcher type="substring" />
    </TokenMatchers>
  </DejimaAgentNetworkDefaults>
  <DejimaAgentNetworkAgentList TopAgent="DateTimeRange.com.dejima.templates.TemplatizedAgent@date_time_range" extendsOPAL="start_end_date_time.opal" extendsPath="." extendsLibrary="false">
    <Agent>
      <Properties Type="com.dejima.core.agents.ComponentNetworkAgent">
        <Address Type="com.dejima.core.kernel.AgentAddress">
          <Properties Type="com.dejima.core.kernel.AgentAddress">
            <ClassName Type="java.lang.String"><![CDATA[com.dejima.core.agents.ComponentNetworkAgent]]></ClassName>
            <DomainName Type="java.lang.String"><![CDATA[date_time_range]]></DomainName>
            <Name Type="java.lang.String"><![CDATA[DateTime]]></Name>
          </Properties>
        </Address>
        <ComponentNetworkInfo Type="com.dejima.core.agents.FileProperty">
          <Properties Type="com.dejima.core.agents.FileProperty">
            <Directory Type="java.lang.String"><![CDATA[.]]></Directory>
            <IsLibraryCopy Type="boolean"><![CDATA[false]]></IsLibraryCopy>
            <Name Type="java.lang.String"><![CDATA[business_date_time.opal]]></Name>
            <Source Type="java.lang.String"><![CDATA[business_date_time.opal]]></Source>
          </Properties>
        </ComponentNetworkInfo>
      </Properties>
    </Agent>
  </DejimaAgentNetworkAgentList>
  <DejimaAgentNetworkLocations AgentEditorType="SWING" />
  <SelectedMessagesToDisplay />
</DejimaAgentNetwork>

