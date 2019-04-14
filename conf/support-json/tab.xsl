<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" 
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" 
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
    xmlns:b="urn:X:everis:sembu:blyter:0.1"
    xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/"
    exclude-result-prefixes="xs office style table text b" 
    version="2.0">

    <xsl:import href="./methods.xsl"/>
    
    <xsl:template name="tab">        
        <xsl:param name="tabName"/>
        "<xsl:value-of select="$tabName"/>":
        [
        <xsl:for-each select="./table:table-row">
            
            <xsl:for-each select="./table:table-cell">
                <xsl:if test="contains(., '${')">
                        {
                           "symbol"      : "<xsl:value-of select="b:getCellContent(., 6)"/>",
                           "value"       : "<xsl:value-of select="b:getCellContent(., 3)"/>",
                           "name"        : "<xsl:value-of select="b:getCellContent(., 2)"/>",
                           "description" : "<xsl:value-of select="b:getCellContent(., 4)"/>",
                           "type"        : "<xsl:value-of select="b:getCellContent(., 5)"/>"
                        },                    
                </xsl:if>                
            </xsl:for-each>
        </xsl:for-each>  
        ],
    </xsl:template>
</xsl:stylesheet>