<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="sum">&#8721;</xsl:variable>
    <xsl:template match="/">
        <html lang="en">
        <head>
            <meta charset="utf-8"/>
            <title></title>
            <script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
            <script id="MathJax-script" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
        </head>
        <body>
        $${{
        <xsl:apply-templates/>
        }}$$
        </body>
        </html>
    </xsl:template>

    <xsl:template match="строка">
        <xsl:choose>

            <xsl:when test="name() = 'операнд'">
                <xsl:value-of select="@операнд"/>
            </xsl:when>

            <xsl:when test="name() = 'оператор'">
                <xsl:value-of select="@оператор"/>
            </xsl:when>

            <xsl:when test="name() = 'число'">
                <xsl:value-of select="@число"/>
            </xsl:when>

            <xsl:otherwise><xsl:apply-templates/></xsl:otherwise>

        </xsl:choose>

    </xsl:template>

    <xsl:template match="корень">
        \sqrt{<xsl:apply-templates select="строка"/>}
    </xsl:template>

    <xsl:template match="дробь">
        \frac {<xsl:apply-templates select="строка[1]"/>}{<xsl:apply-templates select="строка[2]"/>}
    </xsl:template>

    <xsl:template match="низверх">
        <xsl:apply-templates select="строка[1]"/>_{<xsl:apply-templates select="строка[2]"/>}^{<xsl:apply-templates select="строка[3]"/>}
    </xsl:template>

    <xsl:template match="верх">
        <xsl:apply-templates select="строка[1]"/>^{<xsl:apply-templates select="строка[2]"/>}
    </xsl:template>

    <xsl:template match="низ">
        <xsl:apply-templates select="строка[1]"/>_{<xsl:apply-templates select="строка[2]"/>}
    </xsl:template>


</xsl:stylesheet>