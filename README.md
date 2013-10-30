## Human Resources Data Import Service

1. HR data will be sent to Cloud Express via a REST interface (URL TBD).
2. To import a data file, the customer will perform a multi-part file upload (HTTP POST),
   of an XML file to the URL: ```/import```.
3. The format of the XML file is defined by the schema: [hrmanifest.xsd][hrmanifest.xsd].
   The schema will be used to validate the XML file upon upload to ensure it
   is a valid HR manifest.
4. A sample HR manifest XML file is provided for reference: [exampleImport.xml][exampleImport.xml].

[hrmanifest.xsd]:    https://github.com/rSmart/CE-tech-docs/blob/master/hrmanifest.xsd
[exampleImport.xml]: https://github.com/rSmart/CE-tech-docs/blob/master/exampleImport.xml
