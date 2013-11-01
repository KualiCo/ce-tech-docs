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

## XML Schema Versioning
1.  Version numbers will be recorded using both major and minor numbers:

    ```
      <schema version="1.0"
        targetNamespace="https://github.com/rSmart/ce-tech-docs/tree/master/v1_0">
    ```

2.  When building your HR manifest XML, be sure to indicate which version of the
    schema your data is compatible with:

    ```
      <hrmanifest schemaVersion="1.0">
    ```

3.  Backwards compatibility will be maintained within the same *major* version number.
    When backwards compatibility is not possible, then the major version will be
    incremented and the targetNamespace will also change.

    ```
      <schema version="2.0"
        targetNamespace="https://github.com/rSmart/ce-tech-docs/tree/master/v2_0">
    ```

[hrmanifest.xsd]:    https://github.com/rSmart/ce-tech-docs/blob/master/v1_0/hrmanifest.xsd
[exampleImport.xml]: https://github.com/rSmart/ce-tech-docs/blob/master/v1_0/exampleImport.xml
