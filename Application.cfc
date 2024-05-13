component {

  this.datasource = "ecommerce";
  this.pth=getCurrentTemplatePath();
	this.dir=getDirectoryFromPath(this.pth);
	this.mappings["/component"]="#this.dir#components/";
  this.sessionManagement=true;
	this.sessionTimeout=createTimespan(0,0,20,0);
}
