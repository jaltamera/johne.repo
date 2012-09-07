Description:
  The agent to connect an agent network to any kind of data source.
  The agent returns the key of matched data and the matched token as the result. The actuator can easily obtain
  matched data from database by the key. 

  - Elements in Configuration File

  "DataSourceList"
    This element contains one or more DataSource  element.

  "DataSource"
    This element describes a data source for a DataSourceAgent. This requires a "name" attribute with which an agent
    looks up the data source.

  "ClassName"
    This element provides a class name of a data source provider. The class implements the interface
    com.dejima.library.datasource.DataSource .

  "Config"
    This element provides a configuration for the data source class. This can contain any element.

Files:
- datasource1.opal
  OPAL file.
- datasource1.smp
  sample file.
- testds.xml
  The data source configuration file. 
- DataSourceAgent.xsd
  The format of configuration file.

Integration Notes:
Must provide Java code to access a custom data source. The simple implementation for a .CSV (MS-Excel CSV)
file, whose class name is com.dejima.library.datasource.util.CsvDataSource, is bundled in the library.

Custom Agent:
- com.dejima.library.datasource.DataSourceAgent
