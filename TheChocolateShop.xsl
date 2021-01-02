<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
    <html>
        <head>
            <title>The Chocolate Shop's Online Shop</title>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <link rel="stylesheet" href="css/TheChocolateShop.css" />
            <script type="text/javascript" src="js/TheChocolateShop.js">x</script>
        </head>
            <body>
                <h2>The Chocolate Shop</h2>
                <p>Select your opts from the menu below. To calculate the amount of the bill, click the Calculate Bill button. Check the "Highlight Vegetarian Meals" box to highlight vegetarian dishes.</p>
                <table id="menuTable" border="1" class="indent">
                    <thead>
                        <tr>
                            <th colspan="3">The Chocolate Shop's Online Shop</th>
                        </tr>
                        <tr>
                            <th>Select</th>
                            <th>Description</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="/chocolatedescs/section">
                            <tr>
                                <td colspan="3">
                                    <xsl:value-of select="@name" />
                                </td>
                            </tr>
                            <xsl:for-each select="opt">
                                <tr id = "{position()}">
                                    <xsl:attribute name="vegetarian">
                                        <xsl:value-of select="boolean(@vegetarian)" />
                                    </xsl:attribute>
                                    <td align="center">
                                        <input name="desc0" type="checkbox" />
                                    </td>
                                    <td>
                                        <xsl:value-of select="desc" />
                                    </td>
                                    <td align="right">
                                        <xsl:value-of select="prc" />
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:for-each>
                    </tbody>
                </table>
                <form class="indent">
                    <p>
                        <input type="button" name="btnCalcBill" value="Calculate Bill" id="calcBill" />
                Total: €
                <input type="text" name="txtBillAmt" /><input type="checkbox" name="cbOpts" value="isVeg" id="showVeg" /><label for="showVeg">Highlight Vegetarian Meals</label></p>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
