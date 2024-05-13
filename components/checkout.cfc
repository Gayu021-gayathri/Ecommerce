<cfcomponent>
    <cffunction name="proceedToBuy" access="remote" returntype="boolean" returnformat="json">
        <cfargument name="productIds" type="string" required="true">
        <cfargument name="shipping" type="string" required="true">
        <cfargument name="billing" type="string" required="true">
        <cfargument name="totalamount" type="numeric" required="true">


        <cfset local.productIdsArray = deserializeJSON(arguments.productIds)>
        <cfset local.result = true>
        <cftry>
            <cfquery name="qInsertOrder" result="qresult">
                INSERT INTO orders (user_id, shipping_address, billing_address, total_amount)
                VALUES (
                    <cfqueryparam value="#session.userid#" cfsqltype="numeric">,
                    <cfqueryparam value="#arguments.shipping#" cfsqltype="varchar">,
                    <cfqueryparam value="#arguments.billing#" cfsqltype="varchar">,
                    <cfqueryparam value="#arguments.totalamount#" cfsqltype="numeric">
                )
            </cfquery>
            <cfset local.cartid = qresult.generatedKey>
            <cfloop array="#local.productIdsArray#" index="product_id">
                <cfquery name="qInsertOrderItem">
                    INSERT INTO order_Item (order_id, product_id)
                    VALUES (
                        <cfqueryparam value="#local.cartid#" cfsqltype="numeric">,
                        <cfqueryparam value="#product_id#" cfsqltype="numeric">
                    )
                </cfquery>
            </cfloop>
            <cfset local.productlist = arrayToList(productIdsArray)>
            <cfquery>
                Delete from cart 
                where product_id in (<cfqueryparam value="#local.productlist#" cfsqltype="numeric" list="true">)
            </cfquery>
            <cfset items = getOrderdItems(local.cartid)>
            <cfset session.orderedItems = arrayNew(1)>
            <cfloop query="items" >
                <cfset arrayAppend(session.orderedItems, title)>
            </cfloop>
        <cfcatch>
            <cfdump var="#cfcatch#">
            <cfset local.result = false>
        </cfcatch>
        </cftry>
        <cfreturn local.result>
    </cffunction>

    <cffunction name="getOrderdItems" access="remote" returntype="query">
        <cfargument name="orderid" type="string" required="true">

        <cfquery name="qOrderItem">
           SELECT p.product_id, p.title, p.price, p.description, p.thumbnail
            FROM product p
            JOIN order_item oi ON p.product_id = oi.product_id
            WHERE oi.order_id = <cfqueryparam value=#arguments.orderid# cfsqltype="numeric">
        </cfquery>
        <cfreturn qOrderItem>

    </cffunction>
</cfcomponent>
