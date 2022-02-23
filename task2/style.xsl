<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/root">
        <html lang="en">
        <body>
            <xsl:apply-templates/>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="графика">
        <svg width="{@ширина}" height="{@высота}"><xsl:apply-templates/></svg>
    </xsl:template>

    <xsl:template match="эллипс">
        <ellipse id="{@id}" style="fill: {@заливка}" stroke="{@ободок}" stroke-width="{@ширина-ободка}"
                 cx="{@cx}" cy="{@cy}" rx="{@rx}" ry="{@ry}"/>
    </xsl:template>

</xsl:stylesheet>