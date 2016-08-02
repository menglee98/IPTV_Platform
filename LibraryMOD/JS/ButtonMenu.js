
function ButtonMaker(name,width,height,value,bgimage,selimage,classname,onfocus,onblur,onclick)//triger1=onfocus;triger2=onblur;triger3=onclick
{	   //document.write(ButtonMaker("List1",303,48,"實踐資訊台","./Images/s1-0.jpg","./Images/s1-1.jpg","list","btnOnFocus(1);","","eventCalled(1);"));


	if(top.STBVersion=="MOD202"||top.STBVersion=="MSIE" || top.STBVersion=="MSD580")
	{
		onfocus+="this.style.backgroundImage='url(" +selimage+ ")';";
		onblur+="this.style.backgroundImage='url("  +bgimage+  ")';";
	}
//alert(focus);
//alert( '<INPUT class="'+ classname + '" tabIndex="-1" type="button" id="'+name+'" name="'+name+'" borderimage="'+bgimage+'" selimage="'+selimage+'" style="BACKGROUND-IMAGE: url(\''+bgimage+'\');  BORDER-STYLE: none; WIDTH: '+width+'px ;HEIGHT: '+height+'px; BACKGROUND-COLOR: transparent;" value="'+value+'" onfocus="'+onfocus+'" onblur="'+onblur+'" onclick="'+onclick+'" >');
return '<INPUT class="'+ classname + '" tabIndex="-1" type="button" id="'+name+'" name="'+name+'" borderimage="'+bgimage+'" selimage="'+selimage+'" style="BACKGROUND-IMAGE: url(\''+bgimage+'\');  BORDER-STYLE: none; WIDTH: '+width+'px ;HEIGHT: '+height+'px; BACKGROUND-COLOR: transparent; cursor:hand ;  top :focus { outline: none }   " value="'+value+'" onfocus="'+onfocus+'" onblur="'+onblur+'" onclick="'+onclick+'" onmouseover="this.focus(); " >';

}

