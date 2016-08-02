<%@ Page Language="c#" Inherits="Ndapn.treemenu" CodeFile="treemenu.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<STYLE>BODY { BACKGROUND-COLOR: white }
	TD { FONT-SIZE: 10pt; FONT-FAMILY: verdana,helvetica; WHITE-SPACE: nowrap; TEXT-DECORATION: none }
	A { COLOR: black; TEXT-DECORATION: none }
	</STYLE>
<!-- Infrastructure code for the tree -->
<SCRIPT src="ftiens4.js"></SCRIPT>
<SCRIPT src="ua.js"></SCRIPT>
<SCRIPT Language="javascript">
function DoReload()
{	
	setTimeout('location.reload();',1500);
}
USETEXTLINKS = 1  //replace 0 with 1 for hyperlinks

// Decide if the tree is to start all open or just showing the root folders
STARTALLOPEN = 0 //replace 0 with 1 to show the whole tree

HIGHLIGHT = 1

<%=MakeMenu()%>

//foldersTree = gFld("<strong>Smart iTV 基本設定版</strong>", "../redirector.aspx");
//aux1 = insFld(foldersTree, gFld("Europe", "../redirector.aspx"));
//aux2 = insFld(aux1, gFld("Italy", "../redirector.aspx"));
//insDoc(aux2, gLnk("R", "Rome", "../redirector.aspx"));
//insDoc(aux1, gLnk("R", "London", "../redirector.aspx"));
//insDoc(aux1, gLnk("R", "Paris", "../redirector.aspx"));
//aux3 = insFld(foldersTree, gFld("USA", "../redirector.aspx"));
//insDoc(aux3, gLnk("R", "New York", "../redirector.aspx"));

</SCRIPT>

<META content="MSHTML 6.00.2900.2523" name="GENERATOR">
<BODY topMargin="16" marginheight="16" onload="<%=onload%>">
	<DIV style="LEFT: 0px; POSITION: absolute; TOP: 0px">
		<TABLE border="0">
			<TBODY>
				<TR>
					<TD>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</DIV>
	<SCRIPT>initializeDocument()</SCRIPT>
	<NOSCRIPT>
		A tree for site navigation will open here if you enable JavaScript in your browser. 
	</NOSCRIPT>
</BODY>
