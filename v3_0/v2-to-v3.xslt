<?xml version="1.0"?>
<!-- Copyright © 2013-2025 Kuali, Inc. - All Rights Reserved -->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:g="https://github.com/rSmart/ce-tech-docs/tree/master/v2_0"
                xmlns:h="https://github.com/KualiCo/ce-tech-docs/tree/master/v3_0"
                exclude-result-prefixes="g h">
  <xsl:output method="xml"
              indent="yes"/>
  <xsl:template match="/">
    <hrmanifest xmlns="https://github.com/KualiCo/ce-tech-docs/tree/master/v3_0"
                schemaVersion="3.0">
      <xsl:attribute name="statusEmailRecipient">
        <xsl:value-of
          select="/*/@statusEmailRecipient"></xsl:value-of>
      </xsl:attribute>
      <xsl:attribute
        name="recordCount">
        <xsl:value-of select="/*/@recordCount"></xsl:value-of>
      </xsl:attribute>
      <xsl:for-each select="g:hrmanifest/g:records/g:record">
        <h:record>
          <xsl:attribute name="entityId">
            <xsl:value-of select="@entityId"/>
          </xsl:attribute>
          <xsl:attribute name="principalId">
            <xsl:value-of select="@principalId"/>
          </xsl:attribute>
          <xsl:attribute name="principalName">
            <xsl:value-of select="@principalName"/>
          </xsl:attribute>
          <xsl:attribute name="active">
            <xsl:value-of select="@active"/>
          </xsl:attribute>
          <xsl:apply-templates select="g:addresses/g:address[@default='true']"/>
          <xsl:apply-templates select="g:affiliations/g:affiliation[@default='true']"/>
          <xsl:apply-templates select="g:emails/g:email[@default='true']"/>
          <xsl:apply-templates select="g:names/g:name[@default='true']"/>
          <xsl:apply-templates select="g:phones/g:phone[@default='true']"/>
        </h:record>
      </xsl:for-each>
    </hrmanifest>
  </xsl:template>
  
  <xsl:template match="g:addresses/g:address[@default='true']">
    <xsl:if test="@addressTypeCode">
      <h:addressTypeCode>
        <xsl:value-of select="@addressTypeCode"/>
      </h:addressTypeCode>
    </xsl:if>
    <xsl:if test="@addressLine1">
      <h:addressLine1>
        <xsl:value-of select="@addressLine1"/>
      </h:addressLine1>
    </xsl:if>
    <xsl:if test="@addressLine2">
      <h:addressLine2>
        <xsl:value-of select="@addressLine2"/>
      </h:addressLine2>
    </xsl:if>
    <xsl:if test="@addressLine3">
      <h:addressLine3>
        <xsl:value-of select="@addressLine3"/>
      </h:addressLine3>
    </xsl:if>
    <xsl:if test="@city">
      <h:city>
        <xsl:value-of select="@city"/>
      </h:city>
    </xsl:if>
    <xsl:if test="@stateOrProvince">
      <h:stateOrProvince>
        <xsl:value-of select="@stateOrProvince"/>
      </h:stateOrProvince>
    </xsl:if>
    <xsl:if test="@postalCode">
      <h:postalCode>
        <xsl:value-of select="@postalCode"/>
      </h:postalCode>
    </xsl:if>
    <xsl:if test="@country">
      <h:country>
        <xsl:value-of select="@country"/>
      </h:country>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="g:affiliations/g:affiliation[@default='true']">
    <h:affiliationType>
      <xsl:value-of select="@affiliationType"/>
    </h:affiliationType>
    <h:campus>
      <xsl:value-of select="@campus"/>
    </h:campus>
    <xsl:choose>
      <xsl:when test="g:employment[@primaryEmployment='true']">
        <h:employeeStatus>
          <xsl:value-of select="g:employment[@primaryEmployment='true']/@employeeStatus"/>
        </h:employeeStatus>
        <h:employeeType>
          <xsl:value-of select="g:employment[@primaryEmployment='true']/@employeeType"/>
        </h:employeeType>
        <h:baseSalaryAmount>
          <xsl:value-of select="g:employment[@primaryEmployment='true']/@baseSalaryAmount"/>
        </h:baseSalaryAmount>
        <h:primaryDepartment>
          <xsl:value-of select="g:employment[@primaryEmployment='true']/@primaryDepartment"/>
        </h:primaryDepartment>
        <h:employeeId>
          <xsl:value-of select="g:employment[@primaryEmployment='true']/@employeeId"/>
        </h:employeeId>
      </xsl:when>
      <xsl:otherwise>
        <h:employeeStatus>
          <xsl:value-of select="g:employment[1]/@employeeStatus"/>
        </h:employeeStatus>
        <h:employeeType>
          <xsl:value-of select="g:employment[1]/@employeeType"/>
        </h:employeeType>
        <h:baseSalaryAmount>
          <xsl:value-of select="g:employment[1]/@baseSalaryAmount"/>
        </h:baseSalaryAmount>
        <h:primaryDepartment>
          <xsl:value-of select="g:employment[1]/@primaryDepartment"/>
        </h:primaryDepartment>
        <h:employeeId>
          <xsl:value-of select="g:employment[1]/@employeeId"/>
        </h:employeeId>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="g:emails/g:email[@default='true']">
    <xsl:if test="@emailAddress">
      <h:emailAddress>
        <xsl:value-of select="@emailAddress"/>
      </h:emailAddress>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="g:names/g:name[@default='true']">
    <xsl:if test="@firstName">
      <h:firstName>
        <xsl:value-of select="@firstName"/>
      </h:firstName>
    </xsl:if>
    <xsl:if test="@middleName">
      <h:middleName>
        <xsl:value-of select="@middleName"/>
      </h:middleName>
    </xsl:if>
    <xsl:if test="@lastName">
      <h:lastName>
        <xsl:value-of select="@lastName"/>
      </h:lastName>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="g:phones/g:phone[@default='true']">
    <xsl:if test="@phoneNumber">
      <h:phoneNumber>
        <xsl:value-of select="@phoneNumber"/>
      </h:phoneNumber>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
