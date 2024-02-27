<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="delimiter" select="delimiter"/>

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
