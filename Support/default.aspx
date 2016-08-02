<%@ Page language="c#" Inherits="Support._default" CodeFile="default.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="PRAGMA" content="NO-CACHE">
		<TITLE>台灣夢工場 Smart iTV 頻道產生器</TITLE>
	</head>
<script>
netscape = (navigator.appName == "Netscape");
n4 = netscape && (parseInt(navigator.appVersion) >= 4);
explorer = (navigator.appName == "Microsoft Internet Explorer");
ie4 = explorer && (parseInt(navigator.appVersion) >= 4);

function shake(n) 
{
	if (n4 || ie4) 
	{
		for (i = 10; i > 0; i--) 
		{
			for (j = n; j > 0; j--) 
			{
				self.moveBy(0,i);
				self.moveBy(i,0);
				self.moveBy(0,-i);
				self.moveBy(-i,0);
			}
		}
	}
}
</script>	
	<frameset rows="97,82%" frameborder="no" border="0" framespacing="0">
              <frame src="../Ndap/top.aspx" name="top" id="top" noresize title="topFrm" scrolling="no">
		<frameset cols="800,*" frameborder="no" border="0" framespacing="0">
			<frame src="Main.aspx?ReportType=content" name="baseFrm" id="baseFrm" title="basefrm">
		</frameset>
	</frameset>
</html>