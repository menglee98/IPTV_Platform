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

using Ndapn.MyTool;


namespace Ndapn
{
	public partial class redirector : System.Web.UI.Page
	{
		API myAPI = null;
		public string onload = "";

		protected void Page_Load(object sender, System.EventArgs e)
		{
			try{
				myAPI = new API(Session["DBName"].ToString());
			}
			catch{
				onload = "alert('½Ð¥ýµn¤J');top.location.href='./default.aspx';";
			}
			if(!IsPostBack)	{
				if(Request.Params["ID"]==null || Request.Params["TypeOfNode"]==null || Request.Params["Name"]==null || Request.Params["aSDate"]==null || Request.Params["aEDate"]==null){
					Response.Redirect("./welcome.aspx");
				}else{
					if(Request.QueryString["TypeOfNode"].ToString()!="leaf"){	
						string nowDate = DateTime.Today.ToShortDateString();
						txtStartDate.CalendarUrl = "./MyTool/Calendar.aspx";
						txtEndDate.CalendarUrl = "./MyTool/Calendar.aspx";
						txtID.Text = Request.QueryString["ID"].ToString();
						txtFolderName.Text = Server.UrlDecode(Request.Params["Name"]).ToString();
						txtStartDate.SetDateTimeValue(Request.Params["aSDate"].ToString());
						txtEndDate.SetDateTimeValue(Request.Params["aEDate"].ToString());
						txtImgName.Text = Request.Params["NodeImg"].ToString();
						if(txtImgName.Text!="")
							imgFolder.ImageUrl = "../LibraryMOD/Images/" + txtImgName.Text.ToString();
						else
							imgFolder.Visible=false;
						if(Request.Params["ShowMode"]=="2")
							rblistShowMode.Items[1].Selected=true;
						else
							rblistShowMode.Items[0].Selected=true;
					}
				}
				btnSend.Attributes.Add("onclick", "JavaScript:parent.leftFrame_reload();");	
				btnDel.Attributes.Add("onclick", "JavaScript:parent.leftFrame_reload();");	
				this.txtSort1.Text = myAPI.SqlExeSca("select [Cate_SortNum] FROM [CategoryTemplate] WHERE [Cate_UID] = "+txtID.Text );
			}
		}

		#region Web Form ³]­p¤u¨ã²£¥Íªºµ{¦¡½X
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent()
		{    

		}
		#endregion

		protected void btnSend_Click(object sender, System.EventArgs e)
		{
			if(txtImgUp.Value!=""){
				if(txtImgUp.PostedFile.ContentType.IndexOf("image")==-1)// only accept image format file
				{
					labImgAlert.Visible=true;
					return;
				}
				else{
					int UpImgIndex;
					string newImgName, ServerPath=Server.MapPath("./LibraryMOD/Images");

					UpImgIndex = txtImgUp.Value.LastIndexOf("\\") + 1;
					newImgName = txtID.Text + "_" + txtImgUp.Value.Substring(UpImgIndex,txtImgUp.Value.Length-UpImgIndex);
					txtImgUp.PostedFile.SaveAs(ServerPath + "\\" + newImgName);
					
					if((txtImgName.Text!="") && (txtImgName.Text != newImgName)){
						try{
							string path = ServerPath + "\\" + txtImgName.Text;	
							string fileName = Path.GetFileName(path);									
							FileInfo file = new FileInfo(path);
							file.Delete();						
						}
						catch (Exception ex){
							labImgAlert.Text = ex.ToString();
						}						
					}
					txtImgName.Text = newImgName;
				}
			}

            string UpdateCmd = "Update CategoryTemplate Set Cate_Name = N'" + myAPI.Check_Str(txtFolderName.Text) + "', Cate_StartDate = '" + txtStartDate.GetDateTimeValue + "', ";
            UpdateCmd += "Cate_EndDate = '" + txtEndDate.GetDateTimeValue + "', Cate_ImgUrl=N'" + txtImgName.Text + "', Cate_ShowMode=" + rblistShowMode.SelectedValue+
            ", Cate_SortNum = " + txtSort1.Text +
            " where Cate_UID = " + txtID.Text;
			myAPI.Edit_Data(UpdateCmd);
		}

		protected void lbNodeAddLink_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("./node_add.aspx?txtID="+ txtID.Text.ToString());
		}

		protected void btnDel_Click(object sender, System.EventArgs e)
		{
			string DelCmd = "Delete From CategoryTemplate where Cate_UID=" + txtID.Text + " OR Cate_ParentUID =" + txtID.Text;
			myAPI.Edit_Data(DelCmd);
			DelCmd = "Delete From MediaListTemplate where ML_PID=" + txtID.Text;
			myAPI.Edit_Data(DelCmd);
			Response.Redirect("./welcome.aspx");
		}		
			
	}
		
}
