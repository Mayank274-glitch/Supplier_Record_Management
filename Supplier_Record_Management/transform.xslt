<?xml version="1.0" encoding="utf-8" ?>
<xsl:transform  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="Supplier_Record">
		<Supplier_Record>
				<xsl:apply-templates/>
			</Supplier_Record>
		</xsl:template>
	
		<xsl:template match="supplier">
			<supplier>
				<xsl:for-each select="*">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="text()"/>
				</xsl:attribute>	
			</xsl:for-each>
			</supplier>
	</xsl:template>
</xsl:transform>
