using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;
using System.Net;

using Ndapn.MyTool;
namespace Ndapn
{
	public partial class video_input : System.Web.UI.Page
	{
        	System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
		protected System.Web.UI.WebControls.CheckBox CheckBox1;
		public string s = "";
		public string VideoTimeStart,VideoTimeEnd,MediaStart,MediaEnd,Playlist;
		public int MediaStart_s,MediaEnd_s;
		protected System.Web.UI.WebControls.ListBox VideoLs;
		protected System.Web.UI.WebControls.Button btnDEL;
		protected System.Web.UI.WebControls.TextBox txtVideoTime_End;
		protected System.Web.UI.WebControls.TextBox timetest;
		protected System.Web.UI.WebControls.TextBox ChooseVideo_;	

		API myAPI = null;
	
                public int get_ML_MAXUID()
		{
			string TempCmd="";
			int max_ml_uid=0, curr_ml_uid=0;

			TempCmd="SELECT * FROM MediaListTemplate";
			
			SqlDataReader myDataReader = myAPI.Create_Rd(TempCmd);
			while(myDataReader.Read()){
                           curr_ml_uid = Convert.ToInt32(myDataReader["ML_UID"].ToString());
                           if (curr_ml_uid > max_ml_uid)
                              max_ml_uid = curr_ml_uid;
                        }
                        myDataReader.Close();
			return max_ml_uid;
		}		


                protected void Page_Load(object sender, System.EventArgs e)
		{
			myAPI = new API(Session["DBName"].ToString());
			if(!IsPostBack){
				if(Request.Params["leafID"]==null)
					Response.Redirect("./welcome.aspx");
				txtItemName.Text = Request.Params["leafName"];			
				txtItemImgName.Text = Request.Params["leafImg"];
				if(Request.Params["leafImg"]!=""){
					ItemImg.ImageUrl = "./LibraryMOD/Images/" + Request.Params["leafImg"];
					ItemImg.Visible=true;
				}
				txtItemSDate.SetDateTimeValue(Request.Params["leafSDate"]);
				txtItemEDate.SetDateTimeValue(Request.Params["leafEDate"]);
				txtItemID.Text = Request.Params["leafID"];
	            
				string SelectCmd = "Select * from MediaListTemplate where ML_PID = " + Request.Params["leafID"];
				SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
				if(myDataReader.Read()){	
					txtVideoID.Text = myDataReader["ML_UID"].ToString();
					txtVideoName.Text = myDataReader["ML_Title"].ToString();
					txtVideoImgName.Text = myDataReader["ML_Note1"].ToString();
					if(myDataReader["ML_Note1"].ToString()!=""){
						VideoImg.ImageUrl = "./LibraryMOD/Images/" + myDataReader["ML_Note1"].ToString();
						VideoImg.Visible = true;
					}
					if(myDataReader["ML_OrderYN"].ToString()=="1")
						cbOrder.Checked=true;
					else
						cbOrder.Checked=false;

					txtVideoTime.Text = myDataReader["ML_Note2"].ToString();

					if(myDataReader["ML_MediaStart"].ToString()!="" && myDataReader["ML_MediaEnd"].ToString()!=""){
						VideoTimeStart = myDataReader["ML_MediaStart"].ToString();
						VideoTimeEnd = myDataReader["ML_MediaEnd"].ToString();
						txtVideoTimeStartHour.Text = VideoTimeStart.Substring(0,VideoTimeStart.IndexOf("h"));
						txtVideoTimeStartMin.Text = VideoTimeStart.Substring(VideoTimeStart.IndexOf("h")+1,VideoTimeStart.IndexOf("m")-VideoTimeStart.IndexOf("h")-1);
						txtVideoTimeStartSec.Text = VideoTimeStart.Substring(VideoTimeStart.IndexOf("n")+1,VideoTimeStart.IndexOf("s")-VideoTimeStart.IndexOf("n")-1);
						txtVideoTimeEndHour.Text = VideoTimeEnd.Substring(0,VideoTimeEnd.IndexOf("h"));
						txtVideoTimeEndMin.Text = VideoTimeEnd.Substring(VideoTimeEnd.IndexOf("h")+1,VideoTimeEnd.IndexOf("m")-VideoTimeEnd.IndexOf("h")-1);
						txtVideoTimeEndSec.Text = VideoTimeEnd.Substring(VideoTimeEnd.IndexOf("n")+1,VideoTimeEnd.IndexOf("s")-VideoTimeEnd.IndexOf("n")-1);
					}

					ChooseVideo.Text = myDataReader["ML_Content"].ToString();
					txtDescription.Text = myDataReader["ML_Description"].ToString();
				}
				else
					txtVideoID.Text="new";

				btnUpdateItem.Attributes.Add("onclick", "JavaScript:parent.leftFrame_reload();");	
				btnDelItem.Attributes.Add("onclick", "JavaScript:parent.leftFrame_reload();");	
				btnUpdateVideo.Attributes.Add("onclick","JavaScript:parent.leftFrame_reload();");
				string ShowArea = myAPI.SqlExeSca("SELECT [Cate_ShowArea] FROM [CategoryTemplate] WHERE [Cate_UID] = "+this.Request.Params["leafID"] );
				this.rbShowArea1.SelectedIndex = 3-Int32.Parse(ShowArea);
				this.txtSort1.Text = myAPI.SqlExeSca("select [Cate_SortNum] FROM [CategoryTemplate] WHERE [Cate_UID] = "+this.Request.Params["leafID"] );
			}

		}

		private void btnPlay_Click(int MediaStart_s,int MediaEnd_s,String ChooseVideo,String Playlist)
		{
		   try{
                	FileStream fs = new FileStream(@"\\" + sever_ip + "\\wmpub\\WMRoot\\playlist\\" + Playlist, FileMode.Create, FileAccess.Write);
			StreamWriter sw = new StreamWriter(fs);
			sw.WriteLine("<?wsx version=\"1.0\"?>");
			sw.WriteLine("<smil>");
                	sw.WriteLine("<media src=\"../" + ChooseVideo + "\" clipBegin=\"" + MediaStart_s + "s\" clipEnd=\"" + MediaEnd_s + "s\" />");
                	sw.WriteLine("</smil>");
			sw.Close();
			fs.Close();
		   }
		   catch(Exception e){	Console.WriteLine(e);	}
		}

		#region Web Form 設計工具產生的程式碼
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void btnDelItem_Click(object sender, System.EventArgs e)
		{
			string DelCmd = "Delete From CategoryTemplate where Cate_UID=" + txtItemID.Text ;
			myAPI.Edit_Data(DelCmd);
			DelCmd = "Delete From MediaListTemplate where ML_PID=" + txtItemID.Text ;
			myAPI.Edit_Data(DelCmd);
			Response.Redirect("./welcome.aspx");
		}

		protected void btnUpdateItem_Click(object sender, System.EventArgs e)
		{
			ItemUpdate();
		}

		private void ShowMsg(string msgStr)	
		{
			lblMsg.Text=msgStr;
		}		

		protected void btnUpdateVideo_Click(object sender, System.EventArgs e)
		{
			string name;
			name = Session["UserID"].ToString();

			if(txtDescription.Text.Length>195)	
			{	
				s = "alert('影片描述過長，請少於195字')";	
				ShowMsg("影片描述過長，請少於1195字");
				return;
			}			
			ItemUpdate();

			#region 上傳圖檔
			if(txtVideoImgUp.Value!="")
			{
				if(txtVideoImgUp.PostedFile.ContentType.IndexOf("image")==-1){
					labVideoImgAlert.Visible=true;
					return;
				}
				else{
					int UpImgIndex;
					string newImgName, ServerPath=Server.MapPath("./LibraryMOD/Images");

					UpImgIndex = txtVideoImgUp.Value.LastIndexOf("\\") + 1;
					newImgName = txtVideoID.Text + "_" + txtVideoImgUp.Value.Substring(UpImgIndex,txtVideoImgUp.Value.Length-UpImgIndex);
					txtVideoImgUp.PostedFile.SaveAs(ServerPath + "\\" + newImgName);
					
					if((txtVideoImgName.Text!="") && (txtVideoImgName.Text != newImgName)){
						try{
							string path = ServerPath + "\\" + txtVideoImgName.Text;	
							string fileName = Path.GetFileName(path);									
							FileInfo file = new FileInfo(path);
							file.Delete();						
						}
						catch (Exception ex){ labVideoImgAlert.Text = ex.ToString();	}						
					}
					txtVideoImgName.Text = newImgName;
				}
			}
			#endregion
			
			string SqlCmd;
			int OrderYN=0;
            		string playwsx = ChooseVideo.Text.Remove(0, ChooseVideo.Text.LastIndexOf("/") + 1);

                        int MLuID = get_ML_MAXUID()+1;

			if(cbOrder.Checked==true)	OrderYN=1;

			if(txtVideoID.Text=="new"){
                	   if (txtVideoTimeStartHour.Text + txtVideoTimeStartMin.Text + txtVideoTimeStartSec.Text == "" || txtVideoTimeEndHour.Text + txtVideoTimeEndMin.Text + txtVideoTimeEndSec.Text == "")
                           {
                              MediaStart = "";
                              MediaEnd = "";
                           }
                           else {
                              Playlist = ChooseVideo.Text.Remove(0, ChooseVideo.Text.LastIndexOf("/") + 1);
                              txtVideoTimeStartHour.Text = (txtVideoTimeStartHour.Text == "") ? "0" : txtVideoTimeStartHour.Text;
                              txtVideoTimeStartMin.Text = (txtVideoTimeStartMin.Text == "") ? "0" : txtVideoTimeStartMin.Text;
                              txtVideoTimeStartSec.Text = (txtVideoTimeStartSec.Text == "") ? "0" : txtVideoTimeStartSec.Text;
                              txtVideoTimeEndHour.Text = (txtVideoTimeEndHour.Text == "") ? "0" : txtVideoTimeEndHour.Text;
                              txtVideoTimeEndMin.Text = (txtVideoTimeEndMin.Text == "") ? "0" : txtVideoTimeEndMin.Text;
                              txtVideoTimeEndSec.Text = (txtVideoTimeEndSec.Text == "") ? "0" : txtVideoTimeEndSec.Text;
                              MediaStart = txtVideoTimeStartHour.Text + "h" + txtVideoTimeStartMin.Text + "min" + txtVideoTimeStartSec.Text + "s";
                              MediaEnd = txtVideoTimeEndHour.Text + "h" + txtVideoTimeEndMin.Text + "min" + txtVideoTimeEndSec.Text + "s";
                              MediaStart_s = int.Parse(txtVideoTimeStartHour.Text) * 3600 + int.Parse(txtVideoTimeStartMin.Text) * 60 + int.Parse(txtVideoTimeStartSec.Text);
                              MediaEnd_s = int.Parse(txtVideoTimeEndHour.Text) * 3600 + int.Parse(txtVideoTimeEndMin.Text) * 60 + int.Parse(txtVideoTimeEndSec.Text);
                              Playlist = playwsx.Substring(0, playwsx.LastIndexOf(".")) + "_B_" + MediaStart + "_E_" + MediaEnd + ".wsx";//DateTime.Now.ToString("yyyy-MM-dd-hh-mm-ss")
                              btnPlay_Click(MediaStart_s, MediaEnd_s, ChooseVideo.Text, Playlist);
                          }      
         		  SqlCmd = 
				"Insert into "+"MediaListTemplate "+"select " +	MLuID +","+ txtItemID.Text +",N'Video',N'" +
				myAPI.Check_Str(txtVideoName.Text) + "',N'"
                    		+ myAPI.Check_Str(ChooseVideo.Text) + "',N'"
				+ myAPI.Check_Str(txtDescription.Text) +"','"
				+ txtItemSDate.GetDateTimeValue + "','"
				+ txtItemEDate.GetDateTimeValue + "',N'" 
				+ OrderYN + "',N'"
				+ txtVideoImgName.Text + "','" 
				+ myAPI.Check_Str(txtVideoTime.Text) +"',N'"
                    		+ myAPI.Check_Str(MediaStart) + "',N'"
                    		+ myAPI.Check_Str(MediaEnd) + "' " +
				"where NOT EXISTS (SELECT ML_UID FROM MediaListTemplate WHERE ML_PID = " + txtItemID.Text + ") ";
			}
			else {
			   if(txtVideoTimeStartHour.Text+txtVideoTimeStartMin.Text+txtVideoTimeStartSec.Text==""||txtVideoTimeEndHour.Text+txtVideoTimeEndMin.Text+txtVideoTimeEndSec.Text=="")
			   {
			      MediaStart = "";
			      MediaEnd = "";
			   }
			   else	{
                              Playlist = ChooseVideo.Text.Remove(0, ChooseVideo.Text.LastIndexOf("/") + 1);
			      txtVideoTimeStartHour.Text = (txtVideoTimeStartHour.Text=="") ? "0" : txtVideoTimeStartHour.Text;
			      txtVideoTimeStartMin.Text = (txtVideoTimeStartMin.Text=="") ? "0" : txtVideoTimeStartMin.Text;
			      txtVideoTimeStartSec.Text = (txtVideoTimeStartSec.Text=="") ? "0" : txtVideoTimeStartSec.Text;
			      txtVideoTimeEndHour.Text = (txtVideoTimeEndHour.Text=="") ? "0" : txtVideoTimeEndHour.Text;
			      txtVideoTimeEndMin.Text = (txtVideoTimeEndMin.Text=="") ? "0" : txtVideoTimeEndMin.Text;
			      txtVideoTimeEndSec.Text = (txtVideoTimeEndSec.Text=="") ? "0" : txtVideoTimeEndSec.Text;
			      MediaStart = txtVideoTimeStartHour.Text+"h"+txtVideoTimeStartMin.Text+"min"+txtVideoTimeStartSec.Text+"s";
			      MediaEnd = txtVideoTimeEndHour.Text+"h"+txtVideoTimeEndMin.Text+"min"+txtVideoTimeEndSec.Text+"s";
			      MediaStart_s = int.Parse(txtVideoTimeStartHour.Text)*3600+int.Parse(txtVideoTimeStartMin.Text)*60+int.Parse(txtVideoTimeStartSec.Text);
			      MediaEnd_s = int.Parse(txtVideoTimeEndHour.Text)*3600+int.Parse(txtVideoTimeEndMin.Text)*60+int.Parse(txtVideoTimeEndSec.Text);
                              Playlist = playwsx.Substring(0, playwsx.LastIndexOf(".")) + "_B_" + MediaStart + "_E_" + MediaEnd + ".wsx";//DateTime.Now.ToString("yyyy-MM-dd-hh-mm-ss")
			      btnPlay_Click(MediaStart_s,MediaEnd_s,ChooseVideo.Text,Playlist);
			   }
                           SqlCmd = "Update MediaListTemplate Set ML_Title = N'" + myAPI.Check_Str(txtVideoName.Text) + "', ML_Content = N'" + myAPI.Check_Str(ChooseVideo.Text) + "', ";
			   SqlCmd += "ML_Description = N'" + myAPI.Check_Str(txtDescription.Text) + "', ML_StartDate='" + txtItemSDate.GetDateTimeValue + "', ML_EndDate='" + txtItemEDate.GetDateTimeValue + "',";
			   SqlCmd += "ML_Note2=N'" + myAPI.Check_Str(txtVideoTime.Text) + "', ML_Note1=N'" + txtVideoImgName.Text + "', ML_OrderYN=" + OrderYN + ",";
			   SqlCmd += "ML_MediaStart=N'" + MediaStart + "' , ML_MediaEnd=N'" + MediaEnd + "' where ML_UID = " + txtVideoID.Text;
			}
			//txtDescription.Text=SqlCmd;
			myAPI.Edit_Data(SqlCmd);
	                Page_Load(sender, e);
		}

		private void ItemUpdate()
		{
			if(txtItemImgUp.Value!=""){
				if(txtItemImgUp.PostedFile.ContentType.IndexOf("image")==-1){
					labItemImgAlert.Visible=true;
					return;
				}
				else{
					int UpImgIndex;
					string newImgName, ServerPath=Server.MapPath("./LibraryMOD/Images");

					UpImgIndex = txtItemImgUp.Value.LastIndexOf("\\") + 1;
					newImgName = txtItemID.Text + "_" + txtItemImgUp.Value.Substring(UpImgIndex,txtItemImgUp.Value.Length-UpImgIndex);
					txtItemImgUp.PostedFile.SaveAs(ServerPath + "\\" + newImgName);
					
					if((txtItemImgName.Text!="") && (txtItemImgName.Text != newImgName)){
						try{
							string path = ServerPath + "\\" + txtItemImgName.Text;	
							string fileName = Path.GetFileName(path);									
							FileInfo file = new FileInfo(path);
							file.Delete();						
						}
						catch (Exception ex){
							labItemImgAlert.Text = ex.ToString();
						}						
					}
					txtItemImgName.Text = newImgName;
				}
			}
			
			string UpdateCmd = "Update CategoryTemplate Set Cate_Name = N'" + myAPI.Check_Str(txtItemName.Text) +"', Cate_StartDate = '"+ txtItemSDate.GetDateTimeValue +"', ";
			UpdateCmd += "Cate_EndDate = '" + txtItemEDate.GetDateTimeValue + "', Cate_ImgUrl=N'" + txtItemImgName.Text + "', Cate_ShowArea='" + this.rbShowArea1.SelectedValue +
			"'"+", Cate_SortNum = "+txtSort1.Text +	" where Cate_UID = " + txtItemID.Text;
			myAPI.Edit_Data(UpdateCmd);
		}
	}
}
