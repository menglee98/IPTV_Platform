<%@ Page language="c#" Inherits="LibraryMOD.Info" CodeFile="Info.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
   <head>
      <title></title>
         <meta content="MODE=online; TOOLBAR=off; NOSCROLL" name="ncbrowsermode" />
	 <meta http-equiv="PRAGMA" content="NO-CACHE" />
		
	<%=GetContentScript()%>

<script type="text/javascript">

function PlayMovie( MediaName )
{		
   var MediaUrl;	
   MediaUrl =  './msplayer/msplayer.aspx?' + MediaName ;			
   window.location.href = MediaUrl; 
}

</script>		

<script type="text/javascript">

function eventCalled(i)
{
   switch( i )
   {
      case "SELECT":
         if(arrMenu[0].MediaStart==""||arrMenu[0].MediaEnd=="")
	    var MovieName = arrMenu[0].Content;
	 else{
	    var MovieName =  arrMenu[0].Content.substring(0,arrMenu[0].Content.lastIndexOf("."))+"_B_"+arrMenu[0].MediaStart+"_E_"+arrMenu[0].MediaEnd+".wsx";
	    var lon =MovieName.length;
	    MovieName = MovieName.substring(MovieName.lastIndexOf('/')+1,lon);				
	 }
	 var ContentID = arrMenu[0].UID;			
	 //parent.UpdateContentLog(ContentID);
         //alert(MovieName);				
	 parent.PlayMovie(MovieName);
	 break;		
      case "RED":
	 break;
      case "GREEN":
	 break;
      case "YELLOW":
	 break;
      case "HOME":
	 break;
      default:
         return false;
    }
    return false;
}

function BackByHistory()
{
   window.location.href = "./main.aspx";
}

function popToMain()
{
   window.location.href = "./main.aspx";
}

</script>	
   
   </head>

   <body bgcolor='black'>
		<form id="Form1" method="post" runat="server">
			<table id="test" width="1024" height="683"  cellpadding="0" cellspacing="0" style="background:url('Images/sys_img/BG_1024_video.jpg')">
				<tr>
					<td style="width:61 ; height:41" ></td>
					<td style="width:147 ; height:41"></td>
					<td style="width:183 ; height:41" ></td>
					<td style="width:127 ; height:41" ></td>
					<td style="width:40 ; height:41" ></td>
					<td style="width:388 ; height:41" ></td>
					<td style="width:81 ; height:41" ></td>
				</tr>
				<tr>
					<td style="width:61 ; height:63" ></td>
					<td style="height:63"  colspan="3" class="metadata3"><script type="text/javascript">document.write(arrMenu[0].Title);</script></td>
					<td style="width:40 ; height:63" ></td>
					<td style="width:388 ; height:63"></td>
					<td style="width:81 ; height:63" ></td>
				</tr>
				<tr>
					<td style="width:61 ; height:43" ></td>
					<td style="width:147 ; height:43" ></td>
					<td style="width:183 ; height:43"></td>
					<td style="width:127 ; height:43"></td>
					<td style="width:40 ; height:43" ></td>
					<td style="width:388 ; height:43"></td>
					<td style="width:81 ; height:43"></td>
				</tr>
				<tr>
					<td style="width:61 ; height:23" ></td>
					<td colspan="3" rowspan="2" ><img id="video_img" name="video_img" src="Images/sys_img/space.gif" style="width:457 ; height:320" alt="sorry for the image" /></td>
					<td style="width:40 ; height:23" ></td>
					<td style="width:388 ; height:23"></td>
					<td style="width:81 ; height:23" ></td>
				</tr>
				<tr>
                                        <td style="width:61 ; height:320"></td>
					<td style="width:40 ; height:320"> </td>
                                       	<td style="width:388 ; height:320" valign="top" align="justify" class="metadata"><script type="text/javascript">document.write(arrMenu[0].Description);</script></td>
					<td style="width:81 ; height:320"></td>
				</tr>
				<tr>
					<td style="width:61 ; height:101"></td>
					<td style="height:101" colspan="3">
                                           <table style="width:457 ; height:87"  border="0" cellspacing="0" cellpadding="0">
					      <tr>
						<td style="width:96 ; height:40"></td>
						<td colspan="2" class="metadata2"><script type="text/javascript">document.write(arrMenu[0].Times);</script></td>
					      </tr>
					      <tr>
						<td style="height:47"></td>
						<td style="width:32"></td>
						<td style="width:303" class="metadata2"><script type="text/javascript">document.write(arrMenu[0].EDate);</script></td>
					      </tr>
					   </table>
					</td>
					<td style="width:40 ; height:101"></td>
					<td style="width:388 ; height:101" ></td>
					<td style="width:81 ; height:101"></td>
				</tr>
                                <tr>
					<td style="width:61 ; height:40"></td>
					<td style="width:147 ; height:40" ><img src="./images/sys_img/info_play.jpg" style="CURSOR:pointer" alt="sorry for the image" onclick="javascript:eventCalled('SELECT');" /></td>
					<td style="width:183 ; height:40" ><img src="./images/sys_img/info_home.jpg" style="CURSOR:pointer" alt="sorry for the image" onclick="javascript:popToMain();" /></td>
					<td style="height:40"  colspan="2"><img src="./images/sys_img/info_back.jpg" style="CURSOR:pointer" alt="sorry for the image" onclick="javascript:BackByHistory();" /></td>
					<td style="width:388 ; height:40"> </td>
					<td style="width:81 ; height:40"></td>
				</tr>
				<tr>
					<td style="width:61 ; height:54" ></td>
					<td style="width:147 ; height:54"></td>
					<td style="width:183 ; height:54" ></td>
					<td style="width:127 ; height:54"></td>
					<td style="width:40 ; height:54"></td>
					<td style="width:388 ; height:54" ></td>
					<td style="width:81 ; height:54" ></td>
				</tr>
			</table>
		</form>
   </body>
</html>
