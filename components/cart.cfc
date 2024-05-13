<cfcomponent>
  <cffunction name="getProductIdsForUser" access="public" returntype="array">
    <cfargument name="user_id" type="numeric" required="true">
    <cfquery name="local.productsQuery" >
        SELECT p.product_id
        FROM CART c
        JOIN PRODUCT p ON c.product_id = p.product_id
        WHERE c.user_id = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfset var productIdsArray = []>
    <cfloop query="local.productsQuery">
        <cfset arrayAppend(productIdsArray, local.productsQuery.product_id)>
    </cfloop>
    <cfreturn productIdsArray>
</cffunction>



  <cffunction name="insertIntoCart" access="remote" returnformat="json" returntype="struct">
    <cfargument name="productid" type="numeric" required="true">
    <cfset var result = {}>
    <cftry>
        <cfquery name="local.qryGetCart">
            SELECT *
            FROM CART
            WHERE user_id = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
            AND product_id = <cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfif NOT local.qryGetCart.recordCount>
            <cfquery name="queryinsert">
                INSERT INTO CART (user_id, product_id, quantity)
                VALUES (
                    <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="1" cfsqltype="cf_sql_integer">
                );
            </cfquery>
            <cfset result.action = 1>
            <cfset result.success = true>
            <cfset result.message = "Product added to cart.">
        <cfelse>
            <cfquery name="local.qryDeleteFromCart">
                DELETE FROM CART
                WHERE user_id = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
                AND product_id = <cfqueryparam value="#arguments.productid#" cfsqltype="cf_sql_integer">
            </cfquery>
            <cfset result.action = 2>
            <cfset result.success = true>
            <cfset result.message = "Product removed from cart.">
        </cfif>
        <cfcatch type="any">
            <cfset result.success = false>
            <cfset result.message = "An error occurred while processing your request.">
        </cfcatch>
    </cftry>
    <cfreturn result>
  </cffunction>

   <cffunction name="getUserCartProductDetails" returntype="query">
    <cfargument name="user_id" type="numeric" required="true">
    <cfquery name="local.productsQuery" >
        SELECT p.*,c.quantity, c.cart_id 
        FROM CART c
        JOIN PRODUCT p ON c.product_id = p.product_id
        where c.user_id  = <cfqueryparam value="#arguments.user_id#" cfsqltype="cf_sql_integer">
    </cfquery>   
    <cfreturn local.productsQuery>
</cffunction>

 <cffunction name="updateQuantity" returntype="boolean" returnformat="json" access="remote">
    <cfargument name="cart_id" type="numeric" required="true">
    <cfargument name="quantity" type="numeric" required="true">

    <cfset local.result = true>
    <cftry>
        <cfquery name="local.productsQuery" >
            update cart c
                set quantity=<cfqueryparam value="#arguments.quantity#" cfsqltype="cf_sql_integer">        
            where c.cart_id  = <cfqueryparam value="#arguments.cart_id#" cfsqltype="cf_sql_integer">
        </cfquery>   
    <cfcatch>
        <cfset local.result = false>
    </cfcatch>
    </cftry>
    
    <cfreturn local.result>
</cffunction>
  
</cfcomponent>
