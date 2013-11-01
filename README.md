## Human Resources Data Import Service

1.  HR data will be sent to CE via a REST interface. The URL will be
    provided by your project manager during implementation.
2.  To import a data file, the customer will perform a multi-part file upload (HTTP POST),
    of an XML file. For example:

    ```
      curl -F file=@exampleImport.xml https://final.url.com/hr/import
    ```

3.  The format of the XML file is defined by the schema: [hrmanifest.xsd][hrmanifest.xsd].
    The schema will be used to validate the XML file upon upload to ensure it
    is a valid HR manifest.
4.  A sample HR manifest XML file is provided for reference: [exampleImport.xml][exampleImport.xml].
5.  The service expects that you will be sending a full dump of all active users
    from your HR system. All users included in the manifest will be either added
    or updated as appropriate. Existing users in CE that are *not* in the
    manifest will be disabled.

[hrmanifest.xsd]:    https://github.com/rSmart/CE-tech-docs/blob/master/hrmanifest.xsd
[exampleImport.xml]: https://github.com/rSmart/CE-tech-docs/blob/master/exampleImport.xml
