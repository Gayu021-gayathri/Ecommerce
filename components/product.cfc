<cfcomponent>
    <cffunction name="getAllProducts" access="remote" returntype="query">
        <cfquery name="qGetAllProducts">
            SELECT *
            FROM PRODUCT
        </cfquery>
        <cfreturn qGetAllProducts>
    </cffunction>

    <cffunction name="getProductDetailsByID" access="remote" returntype="query">
        <cfargument name="id" type="string" required="true">

        <cfquery name="qGetProducts">
            SELECT *
            FROM PRODUCT
            where product_id =<cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qGetProducts>
    </cffunction>
</cfcomponent>