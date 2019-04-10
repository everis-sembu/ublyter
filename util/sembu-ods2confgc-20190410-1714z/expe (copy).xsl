<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0" 
    xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" 
    xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0" 
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0" 
    xmlns:b="urn:X:everis:sembu:blyter:0.1"
    xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/"
    exclude-result-prefixes="office" 
    version="2.0">

    <xsl:include href="./support/tableIdentification.xsl"/>

    <xsl:function name="b:getCellContent">
        <xsl:param name="node"/>
        <xsl:param name="colpos"/>
        <xsl:value-of select="$node/ancestor::table:table-row/table:table-cell[sum(preceding-sibling::*/@table:number-columns-repeated) + position() - count(preceding-sibling::*/@table:number-columns-repeated) &lt;= $colpos][last()]/text:p/text()"/>	
    </xsl:function>


    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="office:body">
		<gc:CodeList>
            <!--xsl:call-template name="tableIdentification"/-->
            <xsl:apply-templates select="office:spreadsheet/table:table"/>
		</gc:CodeList>
	</xsl:template>

    <!-- Tab control -->
    <xsl:template match="office:spreadsheet/table:table">
        <xsl:if test="@table:name='conf'">
            <xsl:apply-templates select="table:table-row/table:table-cell"/>
		</xsl:if>
	</xsl:template>


    <xsl:template match="table:table-row/table:table-cell">
        dins
            <xsl:choose>
                <xsl:when test="text:p = '${modelName}'">
                    <modelName><xsl:value-of select="b:getCellContent(., 3)"/></modelName>                    
            </xsl:when>
            </xsl:choose>
    </xsl:template>

</xsl:stylesheet>