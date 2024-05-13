<!--- logout.cfc --->
<cfcomponent>

  <cffunction name="logout" access="remote" returntype="void">
    <cfset structClear(session)>
  </cffunction>

</cfcomponent>
