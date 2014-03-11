## Human Resources Provisioning Service

1.  HR data will be sent to CE via a REST interface. The URL will be
    provided by your project manager during implementation.
2.  To import a data file, the customer will perform a multi-part file upload (HTTP POST), of an XML file. For example:

    ```
      curl -F file=@hrExampleImport.xml https://final.url.com/hr/import
    ```

3.  The format of the XML file is defined by the schema: [hrimport.xsd][hrimport.xsd].
    The schema will be used to validate the XML file upon upload to ensure it
    is a valid HR manifest.
4.  A sample HR manifest XML file is provided for reference: [hrExampleImport.xml][hrExampleImport.xml].
5.  The service expects that you will be sending a full dump of ALL active users
    from your HR system. Users will be treated differently based on their current status in the system:
    * New users will be created. The record for each new user will be validated to ensure all required fields are provided.
    * Existing users who are in the import will be updated. Each user record contains sub-records for names, phones, addresses, emails, degrees, and appointments. If these sub-records are present in the import the system will be updated to match. If these sub-records are not present in the import no change will be made to these values in the system. If these sub-records are present but empty all sub-records for that type will be deleted (eg. an empty <degrees/> sub-record will remove all degrees for the person within the system).
    * Existing users who are omitted from the import will be disabled in the system.
6.  The import will run asynchronously. If the import is able to start successfully the HTTP POST will return with a status code of 200. The import will continue to process on the server.
7.  Only one import can run on the server at a time. If an import is in process when the HTTP POST request is made the new import will not start and a status code of 400 will be returned.
8.  Status of the current import can be checked with the command:
    ```
      curl -F file=@hrExampleImport.xml https://final.url.com/hr/import/status/{id}
    ```
9.  The current import can be aborted with the command:
    ```
      curl -F file=@hrExampleImport.xml https://final.url.com/hr/import/abort/{id}
    ```

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
    incremented and the targetNamespace will also change. For example:

    ```
      <schema version="2.0"
        targetNamespace="https://github.com/rSmart/ce-tech-docs/tree/master/v2_0">
    ```

4.  Note: Changes to the schema that would require a compatibility change, will
    be tied to a new version of the REST API as well. We will do our best to
    keep older versions of both the REST APIs and corresponding XML schemas
    working as long as possible. This will help minimize any impact to the
    customer as much as possible.

[hrmanifest.xsd]:      https://github.com/rSmart/ce-tech-docs/blob/master/v1_0/hrmanifest.xsd
[hrExampleImport.xml]: https://github.com/rSmart/ce-tech-docs/blob/master/v1_0/hrExampleImport.xml
