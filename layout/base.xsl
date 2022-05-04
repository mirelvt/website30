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
            <meta name="theme-color" content="#5d9464" />
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

            <svg viewBox="0 0 512 512" width="0" height="0" xmlns="http://www.w3.org/2000/svg" class="svg-sprite">
                <symbol id="readmore">
                    <path d="M32 0h447.8c17.7 0 32.1 14.4 32.1 32.1v447.8c0 17.7-14.4 32.1-32.1 32.1H32C14.3 512-.1 497.6-.1 479.9V32.1C-.1 14.3 14.3 0 32 0z"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" fill="currentColor" d="M170.6 350.8l94.8-94.8-94.8-94.8 47.4-47.4L360.2 256 218 398.2z"/>
                </symbol>
                <symbol id="blog">
                    <path d="M177.6 112.4v63.7c41.1 0 80.9 15.9 110.1 45.1 29.2 29.2 45.1 69 45.1 110.1h63.7c0-120.7-98.1-218.9-218.9-218.9zm0-112.7v63.7c147.2 0 267.9 120.7 267.9 269.3h63.7c.1-184.4-148.5-333-331.6-333zm-35.8 228.1c-13.3 0-22.5 4-30.5 11.9-6.8 8.2-10.5 18.5-10.6 29.2 0 11.9 4 21.2 10.6 27.9 8 9.3 17.2 13.3 30.5 13.3 17.2 0 31.8 4 42.4 13.3 10.6 9.3 15.9 22.5 15.9 38.5 0 17.2-5.3 30.5-17.2 42.5-10.6 11.9-25.2 17.2-39.8 17.2-15.9 0-29.2-5.3-39.8-17.2-10.6-11.9-17.2-25.2-17.2-42.5v-203c0-13.3-4-23.9-11.9-31.8-9.3-8-19.9-10.6-30.5-10.6s-21.2 4-29.2 11.9c-8 8-11.9 18.6-11.9 31.8v205.6c0 39.8 13.3 74.3 41.1 103.5 27.9 27.9 59.7 42.4 99.5 42.4 38.5 0 71.6-14.6 98.2-42.4 27.9-27.9 41.1-62.3 41.1-102.1s-13.3-73-39.8-98.2c-27.9-27.9-61.1-41.2-100.9-41.2z" />
                </symbol>
                <symbol id="chevron-left">
                    <path d="M33.8 2h444.3c17.6 0 31.8 14.3 31.8 31.8v444.3c0 17.6-14.3 31.8-31.8 31.8H33.8C16.2 509.9 2 495.6 2 478.1V33.8C1.9 16.2 16.2 2 33.8 2z" />
                    <path fill="currentColor" d="M349.3 353.5l-94.1-94.1 94.1-94.1-47.1-47-141.1 141.1 141.1 141.1z"/>
                </symbol>
                <symbol id="chevron-right">
                    <path d="M33.8 2h444.3c17.6 0 31.8 14.3 31.8 31.8v444.3c0 17.6-14.3 31.8-31.8 31.8H33.8C16.2 509.9 2 495.6 2 478.1V33.8C1.9 16.2 16.2 2 33.8 2z" />
                    <path fill="currentColor" d="M171.3 350.1l94-94.1-94-94.1 47-47L359.4 256 218.3 397.1z"/>
                </symbol>
                <symbol id="home">
                    <path d="M205.6 456.4H81.375V256h-75l249.6-225 249.6 225h-75v200.4H306.35v-150H205.575v150z"/>
                </symbol>
                <symbol id="mvt">
                    <path d="M179 182.72h19.84l2.17 19.84h.93c3.72-7.027 8.112-12.71 13.175-17.05 5.063-4.34 11.935-6.51 20.615-6.51 15.293 0 24.8 8.68 28.52 26.04 4.547-7.853 9.507-14.157 14.88-18.91 5.373-4.753 12.297-7.13 20.77-7.13 10.54 0 18.652 3.978 24.335 11.935 5.683 7.957 8.525 19.478 8.525 34.565v107.88h-24.49V227.67c0-17.773-5.477-26.66-16.43-26.66-5.373 0-10.023 1.912-13.95 5.735-3.927 3.823-7.853 9.662-11.78 17.515v109.12h-20.46V227.67c0-17.773-5.683-26.66-17.05-26.66-5.373 0-9.92 1.912-13.64 5.735-3.72 3.823-7.543 9.662-11.47 17.515v109.12H179V182.72zM385.81 374.72c7.853 0 14.312-.517 19.375-1.55 5.063-1.033 9.042-2.635 11.935-4.805 2.893-2.17 4.857-5.063 5.89-8.68 1.033-3.617 1.55-7.905 1.55-12.865 0-9.507-.31-18.6-.93-27.28-.62-8.68-.93-18.29-.93-28.83 0-10.127 1.963-17.825 5.89-23.095 3.927-5.27 11.263-8.835 22.01-10.695v-1.24c-10.747-1.86-18.083-5.425-22.01-10.695-3.927-5.27-5.89-12.968-5.89-23.095 0-9.713.31-19.272.93-28.675.62-9.403.93-18.548.93-27.435 0-4.96-.517-9.248-1.55-12.865-1.033-3.617-2.997-6.51-5.89-8.68s-6.872-3.772-11.935-4.805c-5.063-1.033-11.522-1.55-19.375-1.55H370V123h18.91c9.713 0 18.135.672 25.265 2.015 7.13 1.343 13.072 3.565 17.825 6.665s8.267 7.285 10.54 12.555c2.273 5.27 3.41 11.935 3.41 19.995 0 10.747-.465 20.925-1.395 30.535a303.983 303.983 0 00-1.395 29.295c0 3.1.62 6.045 1.86 8.835 1.24 2.79 3.513 5.322 6.82 7.595 3.307 2.273 7.905 4.133 13.795 5.58s13.382 2.17 22.475 2.17v16.12c-9.093 0-16.585.723-22.475 2.17-5.89 1.447-10.488 3.307-13.795 5.58-3.307 2.273-5.58 4.805-6.82 7.595a21.513 21.513 0 00-1.86 8.835c0 5.167.155 10.127.465 14.88l.93 14.26c.31 4.753.62 9.662.93 14.725.31 5.063.465 10.385.465 15.965 0 8.06-1.137 14.725-3.41 19.995-2.273 5.27-5.787 9.455-10.54 12.555-4.753 3.1-10.695 5.322-17.825 6.665-7.13 1.343-15.552 2.015-25.265 2.015H370v-14.88h15.81zM65.16 348.37c0-5.58.155-10.902.465-15.965.31-5.063.62-9.972.93-14.725l.93-14.26c.31-4.753.465-9.713.465-14.88 0-3.1-.62-6.045-1.86-8.835-1.24-2.79-3.513-5.322-6.82-7.595-3.307-2.273-7.905-4.133-13.795-5.58S32.093 264.36 23 264.36v-16.12c9.093 0 16.585-.723 22.475-2.17 5.89-1.447 10.488-3.307 13.795-5.58 3.307-2.273 5.58-4.805 6.82-7.595a21.513 21.513 0 001.86-8.835c0-9.92-.465-19.685-1.395-29.295-.93-9.61-1.395-19.788-1.395-30.535 0-8.06 1.137-14.725 3.41-19.995 2.273-5.27 5.787-9.455 10.54-12.555 4.753-3.1 10.747-5.322 17.98-6.665 7.233-1.343 15.707-2.015 25.42-2.015h18.91v14.88H125.3c-7.853 0-14.312.517-19.375 1.55-5.063 1.033-8.99 2.635-11.78 4.805-2.79 2.17-4.702 5.063-5.735 8.68-1.033 3.617-1.55 7.905-1.55 12.865 0 8.887.31 18.032.93 27.435.62 9.403.93 18.962.93 28.675 0 10.127-2.015 17.825-6.045 23.095-4.03 5.27-11.418 8.835-22.165 10.695v1.24c10.747 1.86 18.135 5.425 22.165 10.695 4.03 5.27 6.045 12.968 6.045 23.095 0 10.54-.31 20.15-.93 28.83-.62 8.68-.93 17.773-.93 27.28 0 4.96.517 9.248 1.55 12.865 1.033 3.617 2.945 6.51 5.735 8.68 2.79 2.17 6.717 3.772 11.78 4.805s11.522 1.55 19.375 1.55h16.12v14.88h-18.91c-9.713 0-18.187-.672-25.42-2.015-7.233-1.343-13.227-3.565-17.98-6.665s-8.267-7.285-10.54-12.555c-2.273-5.27-3.41-11.935-3.41-19.995z" />
                </symbol>
                <symbol id="plus">
                    <path d="M263.644 56c18.778 0 34 15.222 34 34l-.001 124.356H422c18.778 0 34 15.222 34 34v15.288c0 18.778-15.222 34-34 34l-124.357-.001V422c0 18.778-15.221 34-34 34h-15.287c-18.778 0-34-15.222-34-34V297.643H90c-18.778 0-34-15.221-34-34v-15.287c0-18.778 15.222-34 34-34h124.356V90c0-18.778 15.222-34 34-34h15.288z"/>
                </symbol>
            </svg>

            <script src="/static/highlight-11.5.1.min.js" />
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
        <use xlink:href="#{$symbol}" />
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
