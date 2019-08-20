<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="https://www.w3.org/1999/xlink" version="1.0">

    <xsl:output
        method="html"
        media-type="text/html"
        omit-xml-declaration="yes"
        encoding="utf-8"
        indent="yes" />

<xsl:variable name="meta_descr" select="/html/head/meta[@name='description']/@content" />

<xsl:variable name="section" select="/html/head/meta[@name='section']/@content" />
<xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <html lang="en">
        <head>
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <meta name="description" content="{$meta_descr}" />
            <link rel="stylesheet" href="static/base.min.css" />
        </head>
        <body>
            <main class="page-{$section}">
                <xsl:apply-templates select="/html/body/node()" />
            </main>

            <input type="checkbox" name="menu" id="toggle-menu" class="toggle-menu" aria-hidden="true" />
            <header>
                <nav>
                    <div role="navigation">
                        <a href="#" role="menuitem">
                            <xsl:if test="$section = 'home'">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <span>home</span>
                        </a>
                        <a href="#" role="menuitem">
                            <xsl:if test="$section = 'blog'">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <span>blog</span>
                        </a>
                        <a href="#" role="menuitem">
                            <xsl:if test="$section = 'fronteers'">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <span>fronteers</span>
                        </a>
                        <a href="#" role="menuitem">
                            <xsl:if test="$section = 'about'">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <span>about</span>
                        </a>
                    </div>
                </nav>
                <label class="hamburger-wrapper" for="toggle-menu">
                    <div class="hamburger"></div>
                    <div class="menu-text">Menu</div>
                </label>
            </header>

            <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg" class="no-display">
                <symbol id="readmore">
                    <path d="M32 0h447.8c17.7 0 32.1 14.4 32.1 32.1v447.8c0 17.7-14.4 32.1-32.1 32.1H32C14.3 512-.1 497.6-.1 479.9V32.1C-.1 14.3 14.3 0 32 0z"/>
                    <path fill-rule="evenodd" clip-rule="evenodd" class="fill-color" d="M170.6 350.8l94.8-94.8-94.8-94.8 47.4-47.4L360.2 256 218 398.2z"/>
                </symbol>
                <symbol id="blog">
                    <path d="M177.6 112.4v63.7c41.1 0 80.9 15.9 110.1 45.1 29.2 29.2 45.1 69 45.1 110.1h63.7c0-120.7-98.1-218.9-218.9-218.9zm0-112.7v63.7c147.2 0 267.9 120.7 267.9 269.3h63.7c.1-184.4-148.5-333-331.6-333zm-35.8 228.1c-13.3 0-22.5 4-30.5 11.9-6.8 8.2-10.5 18.5-10.6 29.2 0 11.9 4 21.2 10.6 27.9 8 9.3 17.2 13.3 30.5 13.3 17.2 0 31.8 4 42.4 13.3 10.6 9.3 15.9 22.5 15.9 38.5 0 17.2-5.3 30.5-17.2 42.5-10.6 11.9-25.2 17.2-39.8 17.2-15.9 0-29.2-5.3-39.8-17.2-10.6-11.9-17.2-25.2-17.2-42.5v-203c0-13.3-4-23.9-11.9-31.8-9.3-8-19.9-10.6-30.5-10.6s-21.2 4-29.2 11.9c-8 8-11.9 18.6-11.9 31.8v205.6c0 39.8 13.3 74.3 41.1 103.5 27.9 27.9 59.7 42.4 99.5 42.4 38.5 0 71.6-14.6 98.2-42.4 27.9-27.9 41.1-62.3 41.1-102.1s-13.3-73-39.8-98.2c-27.9-27.9-61.1-41.2-100.9-41.2z" />
                </symbol>
            </svg>
        </body>
    </html>
</xsl:template>

<xsl:template match="icon">
    <svg viewBox="0 0 512 512" width="10" height="10" class="icon-{@symbol}">
        <use xlink:href="#{@symbol}" />
    </svg>
</xsl:template>

<!--identity template, copy everything-->
<xsl:template match="node() | @*">
    <xsl:copy>
        <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
