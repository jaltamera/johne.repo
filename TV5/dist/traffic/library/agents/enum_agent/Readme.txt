Description:
  The agent that categorizes tokens into pre-defined categories described as enum values. For example, the EC application
  has order status. Its possible values are OPEN, IN_PROCESS, CLOSE, and so on. Users may describe this status in
  several expressions, "open", "just started", and "new", with all of them meaning that the status is OPEN. EnumAgent can implement
  these token to value mappings in a simple way. The mapping is defined in external configuration file.

  - Elements in configuration file

  "EnumList"
    This element contains one or more Enum element.

  "Enum"
    This element provides enum values for a EnumAgent. This requires a "name" attribute with which an agent
    looks up enum values.

  "Value"
    This element provides an enum value. This requires a "name" atribute. The agent returns this name in following
    styled XML element when it claims.

    <enum><value>open</value><enum>

Files:
- enum1.opal
  OPAL file.
- enum1.smp
  sample file.
- testenum.xml
  The enum value configuration file. 
- EnumAgent.xsd
  The format of configuration file.

Integration Notes:
  None.

Custom Agent:
- com.dejima.library.enum.EnumAgent



