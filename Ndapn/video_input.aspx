<%@ Register TagPrefix="uc1" TagName="DatePicker" Src="MyTool/DatePicker.ascx" %>
<%@ Page language="c#" Inherits="Ndapn.video_input" CodeFile="video_input.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>video_input</title> 
		<!--#include file="./welcome.htm"! -->
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
		<meta content="C#" name="CODE_LANGUAGE" />
		<meta content="JavaScript" name="vs_defaultClientScript" />
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
		<link href="mm_lodging1.css" type="text/css" rel="stylesheet">
		<meta http-equiv="PRAGMA" content="NO-CACHE" />
		<script language="JavaScript">
			function timecheck(id,time){ //黃奕誠新增
				var re = /^[0-9]+$/;
				if (!re.test(time.value)){
					document.getElementById(id).value="";
				}
				if(parseInt(time.value) >= 60){
					alert("時間格式錯誤");
					document.getElementById(id).value="";
				}
			}
			function video_lock(myvalue){ //黃奕誠新增
				document.getElementById('ChooseVideo').value=myvalue;
			}
		</script>
		
		<script language="javascript" type="text/javascript" >	
                   function openwin(){
                      window.open('VideoMgm/VideoUpload.aspx','_blank','height=500, width=500, scrollbars=yes, menubar=yes');
               }
               </script>
	</head>
	<body onload="<%=s%>">
		<form id="Form1" method="post" enctype="multipart/form-data" runat="server">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td nowrap style="width:15">&nbsp;</td>
					<td class="logo" nowrap colspan="2" style="height:60"><br>
						Video選項管理</td>
					<td style="width:100%">&nbsp;</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="4"><img style="height:1; width:1" alt="" src="mm_spacer.gif" border="0"></td>
				</tr>
				<tr bgcolor="#a4c2c2">
					<td nowrap style="width:15">&nbsp;</td>
					<td class="navText" id="navigation" style="height:36"><a href="javascript:;"></a></td>
					<td>&nbsp;</td>
					<td width="100%">&nbsp;</td>
				</tr>
				<tr bgcolor="#ffffff">
					<td colspan="4"><img height="1" alt="" src="mm_spacer.gif" width="1" border="0"></td>
				</tr>
				<tr bgcolor="#ffffff">
					<td valign="middle" style="width:15"><img height="1" alt="" src="mm_spacer.gif" width="15" border="0"></td>
					<td valign="middle" style="width:5"><img height="1" alt="" src="mm_spacer.gif" width="35" border="0"></td>
					<td valign="middle" align="center" style="width:710"><br>
						<table id="calendar" height="574" cellspacing="1" cellpadding="2" width="710" border="0">
							<tr>
								<td class="subHeader" align="left" colspan="6">選項資訊
									<asp:textbox id="txtItemID" runat="server" visible="False"></asp:textbox>排列
									<asp:textbox id="txtSort1" runat="server" width="40px"></asp:textbox></td>
							</tr>
							<tr>
								<td colspan="5"  style="width: 411px ; height:10">
									<div align="left">
										<asp:radiobuttonlist id="rbShowArea1" runat="server" repeatdirection="Horizontal">
											<asp:listitem value="3">KIOSK</asp:listitem>
											<asp:listitem value="2">MOD</asp:listitem>
											<asp:listitem value="1">PC</asp:listitem>
											<asp:listitem value="0">All</asp:listitem>
										</asp:radiobuttonlist><
                                                                         /div>
								</td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td class="calendarText" style="width: 181px" valign="middle" align="center"><strong>選項名稱：</strong></td>
								<td class="calendarText" style="width: 360px" valign="middle" align="left" colspan="2"><asp:textbox id="txtItemName" runat="server"></asp:textbox></td>
								<td class="calendarText" valign="middle" align="center" colspan="3">
									<div align="left"><strong>原選項圖檔：
											<asp:textbox id="txtItemImgName" runat="server" width="64px" visible="False"></asp:textbox></strong>
                                                                        </div>
								</td>
							</tr>
							<tr bgcolor="#ededde">
								<td class="calendarText" style="width: 181px ; height:28" valign="middle" align="center" ><strong>選項圖檔：</strong></td>
								<td class="calendarText" style="width: 360px ; 	height:28" valign="middle" align="left" colspan="2">
                                                                   <input id="txtItemImgUp" style="width: 296px; height: 22px" type="file" size="30" name="txtFileUp" runat="server">
								   <asp:label id="labItemImgAlert" runat="server" style="width:272px" visible="False" forecolor="#C00000" font-size="X-Small">僅接收圖片檔案格式，例如JPG、GIF...等</asp:label>
                                                                </td>
								<td class="calendarText" valign="top" align="left" colspan="3" rowspan="4">
									<div align="center"></div>
									<div align="center"></div>
									<div align="left"></div>
									<div align="center"></div>
									<div align="left"></div>
									<div align="left">
                                                                           <font face="新細明體">
                                                                              <asp:image id="ItemImg" runat="server" style="height:160px; width:240px" visible="False"></asp:image>
                                                                           </font>
                                                                        </div>
									<br>
								</td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td class="calendarText" style="width: 181px" valign="middle" align="center"><strong>開始時間：</strong></td>
								<td class="calendarText" style="width: 360px" valign="middle" align="left" colspan="2"><uc1:datepicker id="txtItemSDate" runat="server"></uc1:datepicker></td>
							</tr>
							<tr bgcolor="#ededde">
								<td class="calendarText" style="width: 181px" valign="middle" align="center"><strong>終止時間：</strong></td>
								<td class="calendarText" style="width: 360px; height:18" valign="middle" align="left" colspan="2"><uc1:datepicker id="txtItemEDate" runat="server"></uc1:datepicker></td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td class="calendarText" style="width: 181px" valign="middle" align="center">&nbsp;</td>
								<td class="calendarText" style="width: 360px" valign="middle" colSpan="2"><asp:button id="btnUpdateItem" runat="server" Text="確認更新" onclick="btnUpdateItem_Click"></asp:button><asp:button id="btnDelItem" runat="server" Text="刪除選項" onclick="btnDelItem_Click"></asp:button></td>
							</tr>
							<tr id="calheader">
								<td class="calendarText" style="width: 181px" vAlign="middle" align="center">&nbsp;</td>
								<td class="calendarText" valign="middle" align="center" style="width:134">&nbsp;</td>
								<td class="calendarText" style="width: 129px" vAlign="middle" align="center" width="129">&nbsp;</td>
								<td class="calendarText" valign="middle" align="center" style="width:128">&nbsp;</td>
								<td class="calendarText" valign="middle" align="center" style="width:12" style="width: 12px">&nbsp;</td>
								<td class="calendarText" valign="middle" align="center" style="width:195">&nbsp;</td>
							</tr>
							<tr>
								<td class="subHeader" align="left" colspan="6">影音資訊	<asp:textbox id="txtVideoID" runat="server" visible="False"></asp:textbox></td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
								<td class="calendarText" style="width: 181px" valign="middle" align="center"><strong>影音名稱：</strong></td>
								<td class="calendarText" style="width: 360px" valign="middle" align="left" colspan="2"><asp:textbox id="txtVideoName" runat="server" Width="176px"></asp:textbox></td>
								<td class="calendarText" valign="middle" colspan="3">
									<div align="left"><strong>原影音圖檔：<asp:textbox id="txtVideoImgName" runat="server" style="width:64px" visible="False"></asp:textbox></strong></div>
								</td>
							</tr>
							<tr bgcolor="#ededde">
							   <td align="center" valign="middle" bgcolor="#ededde" class="calendarText" style="width: 181px; height: 41px"><strong>影音圖檔：</strong></td>
							   <td style="height:28 ; width: 360px" colspan="2" align="left" valign="middle" bgcolor="#ededde" class="calendarText">
                                                                   <input id="txtVideoImgUp" style="width: 296px; height: 22px" type="file" size="30" name="txtFileUp"	runat="server"></font>
									<asp:label id="labVideoImgAlert" runat="server" style="width:280px" visible="False" forecolor="#C00000"
										font-size="X-Small">僅接收圖片檔案格式，例如JPG、GIF...等</asp:label></td>
								<td colspan="3" rowspan="7" align="left" valign="top" class="calendarText" style="height: 278px"><asp:image id="VideoImg" runat="server" Height="160px" Width="240px" Visible="False"></asp:image></td>
							</tr>
							<tr bgcolor="#cccc99">
							   <td  align="center" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 181px; height:24"><strong><strong>影音檔案：</strong></strong></td>
							   <td  colspan="2" align="left" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 360px ; height:24">
                                                              <font face="新細明體">
                                                                 <asp:textbox id="txtVideoPath" runat="server" width="176px" visible="False"></asp:textbox>
								 <asp:textbox id="ChooseVideo" onclick="sPath = './VideoMgm/videomgm.aspx';strFeatures = 'dialogWidth=325px;dialogHeight=400px;center=yes;help=no;scroll=yes;';showModalDialog(sPath,this,strFeatures);" runat="server" width="200px">點擊選擇影音</asp:textbox>
                                                              </font>
										<!--<asp:button id="Upload" runat="server" Text="上傳影片" OnClientClick="openwin();return flase;"></asp:button></td> 20120210 Kenny -->										
							</tr>
							<tr id="calheader" bgcolor="#ededde">
							   <td align="center" valign="middle" bgcolor="#ededde" class="calendarText" style="width: 181px"><strong>影音片長：</strong></td>
							   <td colspan="2" align="left" valign="middle" bgcolor="#ededde" class="calendarText"	style="width: 360px">
                                                              <font face="新細明體"><asp:textbox id="txtVideoTime" runat="server" style="width:176px"></asp:textbox></font>
                                                           </td>
							</tr>
							<tr bgcolor="#cccc99">
							   <td align="center" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 181px"><strong>影音開始：</strong></td>
							      <td colspan="2" align="left" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 360px">
                                                                 <font face="新細明體">
                                                                    <asp:textbox id="txtVideoTimeStartHour" runat="server" style="width:60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>時</strong>
								    <asp:textbox id="txtVideoTimeStartMin" runat="server" style="width:60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>分</strong>
								    <asp:textbox id="txtVideoTimeStartSec" runat="server" style="width:60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>秒</strong>
								    <input type="button" value="影片預覽" onclick="sPath = './VideoMgm/VideoZone.aspx';strFeatures = 'dialogWidth=350px;dialogHeight=420px;center=yes;help=no;scroll=yes;';showModalDialog(sPath,window,strFeatures);">
                                                                 </font>
                                                              </td>
							</tr>
							<tr id="calheader" bgcolor="#ededde">
							   <td align="center" valign="middle" bgcolor="#ededde" class="calendarText" style="width: 181px"><strong>影音結束：</strong></td>
							   <td colspan="2" align="left" valign="middle" bgcolor="#ededde" class="calendarText" style="width: 360px">
                                                              <font face="新細明體">
                                                                 <asp:textbox id="txtVideoTimeEndHour" runat="server" width="60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>時</strong>
								 <asp:textbox id="txtVideoTimeEndMin" runat="server" width="60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>分</strong>
								 <asp:textbox id="txtVideoTimeEndSec" runat="server" width="60px" onkeyup="timecheck(this.id,this)"></asp:textbox><strong>秒</strong>
                                                              </font>
                                                           </td>
							</tr>
							<tr id="calheader" bgcolor="#cccc99">
							   <td align="center" valign="top" bgcolor="#cccc99" class="calendarText" style="width: 181px"><strong><strong>影音描述：</strong></strong></td>
							   <td colspan="2" align="left" valign="middle" bgcolor="#cccc99" class="calendarText"	style="width: 360px">
                                                              <font face="新細明體"><asp:textbox id="txtDescription" runat="server" style="height:146px; width:320px" maxlength="300" TextMode="MultiLine"></asp:textbox></font>
                                                           </td>
							</tr>
							<tr bgcolor="#ededde">
							   <td align="center" valign="middle" bgcolor="#ededde" class="calendarText" style="width: 181px; height: 24px"><strong>身份驗證：</strong></td>
							   <td height="24" colspan="2" align="left" valign="middle" bgcolor="#ededde" class="calendarText"	style="width: 360px; height: 24px">
						              <asp:checkbox id="cbOrder" runat="server"></asp:checkbox>
                                                              <font face="新細明體">一經勾選,使用者欲看此影片時,須經身份驗證成功後,再能觀賞.</font>
                                                            </td>
							</tr>
							<tr bgcolor="#ededde">
							   <td align="center" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 181px"><strong></strong></td>
							   <td  colspan="2" align="left" valign="middle" bgcolor="#cccc99" class="calendarText" style="width: 360px ; height:18">
							      <asp:button id="btnUpdateVideo" runat="server" text="確認更新" onclick="btnUpdateVideo_Click"></asp:button>
							      <asp:label id="lblMsg" runat="server" forecolor="Red"></asp:label>
                                                            </td>
							    <td colspan="3" align="left" valign="top" bgcolor="#cccc99" class="calendarText">&nbsp;</td>
							</tr>
						</table>
						<BR>
						<br>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td width="15">&nbsp;</td>
					<td width="35">&nbsp;</td>
					<td width="710">&nbsp;</td>
					<td width="100%">&nbsp;</td>
				</tr>
			</table>
		</form>
	</body>
</HTML>
