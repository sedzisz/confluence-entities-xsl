<?xml version="1.0" encoding="UTF-8" ?>
<!--
    XML transformation based on official documentation.
    https://www.3gpp.org/ftp/specs/archive/32_series/32.435/32435-g00.zip
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="delimiter" select="delimiter"/>
    <xsl:param name="mapDelimiter" select="mapDelimiter"/>

    <xsl:variable name="map-Delimiter">
        <xsl:choose>
            <xsl:when test="string-length($mapDelimiter) != 0">
                <xsl:value-of select="$mapDelimiter"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'|'"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="newline" select="'&#xa;'"/>
    <xsl:variable name="quotes" select="'&quot;'"/>
    <xsl:variable name="space" select="' '"/>

    <xsl:output method="text" media-type="text/csv" encoding="utf-8" omit-xml-declaration="no"/>

    <xsl:template match="//*[local-name()='hibernate-generic']">
        <xsl:for-each select="*[local-name()='object' and @class = 'BodyContent' and property/@name='body']">
            <xsl:variable name="cdata" select="property"/>
            <xsl:call-template name="parseXML">
                <xsl:with-param name="text" select="$cdata"/>
            </xsl:call-template>
            <xsl:value-of select="$newline"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="parseXML">
        <xsl:param name="text"/>
        <xsl:value-of select="$text"/>
    </xsl:template>

</xsl:stylesheet>