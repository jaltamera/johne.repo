Description:
  This agent provides a customizable constant value. 
  The constant value is defined in an external configuration file, and the file format is described in ConstantAgent.xsd.
  It is obtained by get() method of policies.

  - Elements in Configuration File

  "ConstantList"
    This element contains one or more Constant element.

  "Constant"
    This element provides constant values for a ConstantAgent. This requires a "name" attribute with which an agent
    looks up constants.

  "Value"
    This element provides a constant value. This requires a "name" atribute with which a get() method accesses the
    value. The following policy code obtains the value from ConstantAgent which has the name "expensive".

    {action: get(CONST_PRICE_RANGE,'expensive') }

Files:
- constant1.opal
  OPAL file.
- constant1.smp
  sample file.
- testconst.xml
  The constant value configuration file. 
- ConstantAgent.xsd
  The format of configuration file.

Integration Notes:
  None.

Custom Agent:
- com.dejima.library.constant.ConstantAgent




