<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="https://www.w3.org/1999/xlink" version="1.0">

    <xsl:output
        method="html"
        media-type="text/html"
        omit-xml-declaration="yes"
        encoding="utf-8"
        indent="yes" />

<xsl:variable  name="html_title" select="/html/head/title" />
<xsl:variable name="meta_descr" select="/html/head/meta[@name='description']/@content" />
<xsl:variable name="extra_js" select="/html/head/extra_js" />
<xsl:variable name="extra_css" select="/html/head/extra_css" />

<xsl:variable name="section" select="/html/head/meta[@name='section']/@content" />

<xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <html lang="en" class="no-js">
        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta name="apple-mobile-web-app-capable" content="yes" />
            <link rel="manifest" href="/static/manifest.json" />
            <link rel="icon" type="image/png" href="/static/app-icons/icon-96x96.png" sizes="96x96" />
            <link rel="apple-touch-icon" sizes="58x58" href="/static/app-icons/ios-58.png" />
            <link rel="apple-touch-icon" sizes="120x120" href="/static/app-icons/ios-120.png" />
            <link rel="apple-touch-icon" sizes="152x152" href="/static/app-icons/ios-152.png" />
            <link rel="apple-touch-icon" sizes="167x167" href="/static/app-icons/ios-167.png" />
            <link rel="apple-touch-icon" sizes="180x180" href="/static/app-icons/ios-180.png" />
            <meta name="theme-color" content="#7cb342" />
            <xsl:choose>
                <xsl:when test="$meta_descr">
                    <meta name="description" content="{$meta_descr}" />
                </xsl:when>
                <xsl:otherwise>
                    <meta name="description" content="Mirella van Teulingen is a Dutch front end developer and this is her professional blog." />
                </xsl:otherwise>
            </xsl:choose>
            <title><xsl:value-of select="$html_title" /></title>
            <link rel="stylesheet" href="/static/base.min.css" />
            <xsl:if test="$extra_css">
                <xsl:for-each select="/html/head/extra_css">
                    <link rel="stylesheet" href="{.}" />
                </xsl:for-each>
            </xsl:if>
        </head>
        <body>
            <main class="page-{$section}" >
                <xsl:if test="/html/head/link[@rel='next' or @rel='prev']">
                    <div class="nav-arrows">
                        <xsl:apply-templates select="/html/head/link[@rel='next' or @rel='prev']" mode="pager" />
                    </div>
                </xsl:if>

                <xsl:apply-templates select="/html/body/node()" />

                <xsl:if test="/html/head/link[@rel='next' or @rel='prev']">
                    <div class="nav-arrows">
                        <xsl:apply-templates select="/html/head/link[@rel='next' or @rel='prev']" mode="pager" />
                    </div>
                </xsl:if>
            </main>

            <xsl:if test="$section != 'home'">
                <nav>
                    <input type="checkbox" name="toggle-nav" id="toggle-nav" tabindex="1" />
                    <a href="/" role="menuitem" title="home">
                        <xsl:if test="$section = 'home'">
                            <xsl:attribute name="class">selected</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="icon">
                            <xsl:with-param name="symbol">home</xsl:with-param>
                        </xsl:call-template>
                    </a>
                    <a href="/blog/" role="menuitem" class="nav-item-1" title="blog">
                        <xsl:if test="$section = 'blog'">
                            <xsl:attribute name="class">selected</xsl:attribute>
                        </xsl:if>
                         <xsl:call-template name="icon">
                            <xsl:with-param name="symbol">blog</xsl:with-param>
                        </xsl:call-template>
                    </a>
                    <a href="/about.html" role="menuitem" class="nav-item-2" title="about">
                        <xsl:if test="$section = 'about'">
                            <xsl:attribute name="class">selected</xsl:attribute>
                        </xsl:if>
                        <xsl:call-template name="icon">
                            <xsl:with-param name="symbol">mvt</xsl:with-param>
                        </xsl:call-template>
                    </a>
                    <label for="toggle-nav" arial-label="open navigation">
                        <xsl:call-template name="icon">
                            <xsl:with-param name="symbol">plus</xsl:with-param>
                        </xsl:call-template>
                    </label>
                </nav>
            </xsl:if>


            <script async="" src="//www.google-analytics.com/analytics.js"></script>
            <script src="/static/highlight-9.15.10.min.js" />
            <script src="/static/base.min.js" />
            <xsl:if test="$extra_js">
                <xsl:for-each select="/html/head/extra_js">
                    <script src="{.}" />
                </xsl:for-each>
            </xsl:if>
        </body>
    </html>
</xsl:template>

<xsl:template match="icon" name="icon">
    <xsl:param name="symbol" select="symbol" />
    <xsl:param name="icon_title" select="icon_title" />
    <svg viewBox="0 0 512 512" width="10" height="10" class="icon-{$symbol}">
        <xsl:if test="$icon_title !=''">
            <title><xsl:value-of select="$icon_title" /></title>
        </xsl:if>
        <use xlink:href="/static/icons-sprite.svg#{$symbol}" />
    </svg>
</xsl:template>

<xsl:template match="blog_list">
    <xsl:for-each select="blog_item">
        <div role="listitem" class="blog-item">
            <h3><a href="{@url}"><xsl:value-of select="blog_title" /></a></h3>
            <div class="blog-date"><xsl:value-of select="@date" /></div>
            <xsl:apply-templates select="blog_descr/node()" />
            <a href="{@url}" class="read-more">
                <span>Read more</span>
                <xsl:call-template name="icon">
                    <xsl:with-param name="symbol">readmore</xsl:with-param>
                </xsl:call-template>
            </a>
        </div>
    </xsl:for-each>
</xsl:template>

<xsl:template match="link" mode="pager">
    <a href="{@href}">
        <xsl:call-template name="icon">
            <xsl:with-param name="symbol">
                <xsl:if test="@rel = 'prev'">chevron-left</xsl:if>
                <xsl:if test="@rel = 'next'">chevron-right</xsl:if>
            </xsl:with-param>
            <xsl:with-param name="icon_title">
                <xsl:if test="@rel = 'prev'">previous article</xsl:if>
                <xsl:if test="@rel = 'next'">next article</xsl:if>
            </xsl:with-param>
        </xsl:call-template>
    </a>
</xsl:template>

<xsl:template match="code_esc">
    <xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

<!--identity template, copy everything-->
<xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
