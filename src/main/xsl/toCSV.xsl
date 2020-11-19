<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                extension-element-prefixes="util"
                xmlns:util="imalento.hsdata.Util">
    <xsl:output method="text" encoding="utf-8"/>

    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <xsl:text>Id,Numbers,NameJa,NameEn,Cost,Attack,Health,Durability,CardText,Standard,CardSet,Rarity,CardClass,CardType
</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="Entity">
        <xsl:variable name="collectible" select="number(Tag[@name='COLLECTIBLE']/@value)"/>

        <xsl:if test="$collectible=1">

            <!--
            CARD_SET
            1463: 新参デーモンハンター
            1466: サイラス
            -->
            <xsl:variable name="cardSet" select="number(Tag[@name='CARD_SET']/@value)"/>

            <xsl:variable name="standard">
                <xsl:choose>
                    <xsl:when test="$cardSet=2
            or $cardSet=3
            or $cardSet=1130
            or $cardSet=1158
            or $cardSet=1347
            or $cardSet=1403
            or $cardSet=1403
            or $cardSet=1414
            or $cardSet=1443
            or $cardSet=1463
            or $cardSet=1466">
                        <xsl:value-of select="number(1)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="number(0)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:if test="$standard=1 or 1=1">

                <xsl:variable name="id" select="number(@ID)"/>

                <xsl:variable name="nameJa" select="string(Tag[@name='CARDNAME']/jaJP/text())"/>
                <xsl:variable name="nameEn" select="string(Tag[@name='CARDNAME']/enUS/text())"/>
                <!--
                CARDTYPE
                  3: Hero
                  4: Minion
                  7: Weapon
                -->
                <xsl:variable name="cardType" select="number(Tag[@name='CARDTYPE']/@value)"/>
                <xsl:variable name="cardClass" select="number(Tag[@name='CLASS']/@value)"/>

                <xsl:variable name="cost">
                    <xsl:choose>
                        <xsl:when test="count(Tag[@name='COST']) = 1">
                            <xsl:value-of select="number(Tag[@name='COST']/@value)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="rarity" select="number(Tag[@name='RARITY']/@value)"/>
                <xsl:variable name="cardText" select="string(Tag[@name='CARDTEXT']/jaJP/text())"/>

                <xsl:variable name="attack">
                    <xsl:choose>
                        <xsl:when test="count(Tag[@name='ATK']) = 1">
                            <xsl:value-of select="number(Tag[@name='ATK']/@value)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="health">
                    <xsl:choose>
                        <xsl:when test="count(Tag[@name='HEALTH']) = 1">
                            <xsl:value-of select="number(Tag[@name='HEALTH']/@value)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="durability">
                    <xsl:choose>
                        <xsl:when test="count(Tag[@name='DURABILITY']) = 1">
                            <xsl:value-of select="number(Tag[@name='DURABILITY']/@value)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="race" select="number(Tag[@name='CARDRACE']/@value)"/>

                <xsl:value-of select="$id"/>
                <xsl:text>,</xsl:text>
                <xsl:choose>
                    <xsl:when test="$cardType=7">
                        <!--Weapon-->
                        <xsl:value-of select="concat($cost, '/', $attack, '/', $durability)"/>
                    </xsl:when>
                    <xsl:when test="$cardType=4">
                        <!--Minion-->
                        <xsl:value-of select="concat($cost, '/', $attack, '/', $health)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$cost"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>,</xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="$nameJa"/>
                <xsl:text>"</xsl:text>
                <xsl:text>,</xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="$nameEn"/>
                <xsl:text>"</xsl:text>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$cost"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$attack"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$health"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$durability"/>
                <xsl:text>,</xsl:text>
                <xsl:text>"</xsl:text>
                <xsl:choose>
                    <xsl:when test="$race=8">
                        <xsl:text>【オーク】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=14">
                        <xsl:text>【マーロック】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=15">
                        <xsl:text>【悪魔】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=17">
                        <xsl:text>【メカ】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=18">
                        <xsl:text>【エレメンタル】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=20">
                        <xsl:text>【獣】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=21">
                        <xsl:text>【トーテム】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=23">
                        <xsl:text>【海賊】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=26">
                        <xsl:text>【全て】</xsl:text>
                    </xsl:when>
                    <xsl:when test="$race=24">
                        <xsl:text>【ドラゴン】</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:value-of select="util:sanitize($cardText)"/>
                <xsl:text>"</xsl:text>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$standard"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$cardSet"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$rarity"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$cardClass"/>
                <xsl:text>,</xsl:text>
                <xsl:value-of select="$cardType"/>
                <xsl:text>
</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
