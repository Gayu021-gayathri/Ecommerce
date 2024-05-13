<cfcomponent>
  <cffunction name="insertUser" access="remote" returntype="struct" returnformat="json">
		<cfargument name="firstName" type="string" required="true">
		<cfargument name="lastName" type="string" required="true">
		<cfargument name="email" type="string" required="true">
		<cfargument name="password" type="string" required="true">
		<cfset  local.result = {}>
		<cfif emailExists(arguments.email)>
				<cfset local.result.success = false>
				<cfset local.result.message = "Email already exists.">
				<cfreturn local.result>
		<cfelse>
			<cftry>
				<cfset  local.salt = generateSalt()>
				<!--- Hash the password using bcrypt --->
				<cfset var hashedPassword = hashPassword(arguments.password, salt)>
				<cfquery name="queryinsert" result="result">
					INSERT INTO USER (firstname, lastname, email, password, salt)
						VALUES (
								<cfqueryparam value="#arguments.firstName#" cfsqltype="varchar">,
								<cfqueryparam value="#arguments.lastName#" cfsqltype="varchar">,
								<cfqueryparam value="#arguments.email#" cfsqltype="varchar">,
								<cfqueryparam value="#hashedPassword#" cfsqltype="varchar">,
								<cfqueryparam value="#local.salt#" cfsqltype="varchar">
						)
				</cfquery>
				<cfset local.userid = result.generatedKey>
				<cfset session.isLoggedin = true>
				<cfset session.username =  arguments.firstName &" "& arguments.lastName >
				<cfset session.userid = local.userid>
				<cfset local.result.success = true>
				<cfset local.result.message = "User inserted successfully.">
			<cfcatch type="any">
				<cfdump  var='#cfcatch#'>
				<cfset local.result.success = false>
				<cfset local.result.message = "An error occurred while inserting user data.">
			</cfcatch>
			</cftry>
		</cfif>
		<cfreturn local.result>
  </cffunction>

	<cffunction name="emailExists" returntype="boolean" access="remote">
			<cfargument name="email" type="string" required="true">
	
			<cfquery name="queryCheckEmail">
					SELECT COUNT(*) AS emailCount
					FROM USER
					WHERE email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar">
			</cfquery>
			<cfreturn queryCheckEmail.emailCount GT 0>
	</cffunction>

	<cffunction name="generateSalt" returntype="string">
		<cfset var salt = "" />
		<cfloop index="i" from="1" to="16">
				<cfset salt = salt & chr(randRange(33, 126))>
		</cfloop>
		<cfreturn salt />
	</cffunction>

	<cffunction name="hashPassword" returntype="string">
		<cfargument name="password" type="string" required="true">
		<cfargument  name="salt" type="string" required="true">
		<cfset var hashedPassword = hash(arguments.password & arguments.salt, "SHA-512")>
		<cfreturn hashedPassword />
	</cffunction>


	<cffunction name="loginUser" access="remote" returntype="struct" returnformat="json">
		<cfargument name="email" type="string" required="true">
		<cfargument name="password" type="string" required="true">

		<cfset var result = {
				success = false,
				message = ""
		}>

		<cfquery name="getUser" >
				SELECT *
				FROM USER
				WHERE email = <cfqueryparam value="#arguments.email#" cfsqltype="varchar">
		</cfquery>

		<cfif getUser.recordCount>
				<cfset var storedPassword = getUser.password>
				<cfset var salt = getUser.salt>

				<cfset var hashedPassword = hashPassword(arguments.password, salt)>

				<cfif hashedPassword EQ storedPassword>
						<cfset session.isLoggedin = true>
						<cfset session.username =  getUser.firstName &" "& getUser.lastName>
						<cfset session.userid = getuser.user_id>
						<cfset result.success = true>
						<cfset result.message = "Login successful.">
				<cfelse>
						<cfset result.message = "Incorrect  password.">
				</cfif>
		<cfelse>
				<cfset result.message = "User with the provided email doesn't exist.">
		</cfif>
	<cfreturn result>
</cffunction>
    


</cfcomponent>

