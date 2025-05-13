//if !(settings("nolemonsound")) sound("lemonclick")
var i=0;
var j=1;
var parobj=lemongrab.objdat[$ obj][3]
if parobj==-1
parobj=obj

repeat(9) {
	i=wrap_val(i,0,array_length(lemongrab.objfamily[$ parobj])-1)
	hotbar.obj[j]=lemongrab.objfamily[$ parobj][i]
	hotbar.cur=array_get_index(lemongrab.objfamily[$ parobj],obj)+1
	
	i++;
	j++;
}

//hotbar.cur+=editcursor.shift
if (editcursor.tool!=0 && editcursor.tool!=2) editcursor.tool=0