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
	public partial class node_add : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
	

		API myAPI = null;
		protected System.Web.UI.WebControls.RadioButtonList Radiobuttonlist1;
		
		public string getUID()
		{
			string id="",TempCmd="";
			string Portal = Session["userGroup"].ToString();

			TempCmd="SELECT * FROM GroupN Where PortalName like '" + Portal + "'";
			
			SqlDataReader myDataReader = myAPI.Create_Rd(TempCmd);
			while(myDataReader.Read()){
				id = myDataReader["UID"].ToString();	
			}
                        myDataReader.Close();
			return id;
		}

                public int get_MAXUID()
		{
			string TempCmd="";
			int max_uid=0, curr_uid=0;

			TempCmd="SELECT * FROM CategoryTemplate";
			
			SqlDataReader myDataReader = myAPI.Create_Rd(TempCmd);
			while(myDataReader.Read()){
                           curr_uid = Convert.ToInt32(myDataReader["Cate_UID"].ToString());
                           if (curr_uid > max_uid)
                              max_uid = curr_uid;
                        }
                        myDataReader.Close();
			return max_uid;
		}
		
		protected void Page_Load(object sender, System.EventArgs e)
		{
			string id="";
			
			myAPI = new API(Session["DBName"].ToString());
          
			if(!IsPostBack)
			{
				if(Request.Params["txtID"]!=null)
					if(Request.Params["txtID"]=="1"){
						id=getUID();
						txtParentID.Text = id;
                                        }
					else
						txtParentID.Text = Request.Params["txtID"].ToString();
				else
					Response.Redirect("./default.htm");
				Button2.Attributes.Add("onclick","JavaScript:parent.leftFrame_reload();");
			}
		}

		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent() { }

		protected void Button2_Click(object sender, System.EventArgs e)
		{
			string ServerPath=Server.MapPath("./LibraryMOD/Images");
			
			InsertNode(rbKind1.SelectedValue.ToString(), myAPI.Check_Str(txtName1.Text.ToString()), txtSort1.Text.ToString(), txtFileUp1, txtStartDate1.GetDateTimeValue, txtEndDate1.GetDateTimeValue, ServerPath,  "0");
		}

		private void InsertNode(string iKind, string iName, string iSort, HtmlInputFile txtFileUp, string iSDate, string iEDate, string iSavePath, string iShowArea)
		{																																									
			int indexPos, Cate_ShowMode=0;			
			string iFileName="", WhereCmd, OkMsg;
                        string WhereCmd1;
			string Portal = Session["userGroup"].ToString();
			if(iName=="" || iSDate=="" || iEDate=="")
				return;
			else
			   if(txtFileUp.PostedFile.FileName!="")
			      if(txtFileUp.PostedFile.ContentType.IndexOf("image")==-1)  return;
			      else{
			         indexPos = txtFileUp.Value.LastIndexOf("\\") + 1;			
				 iFileName = txtParentID.Text.ToString() + "_" + txtFileUp.Value.Substring(indexPos,txtFileUp.Value.Length-indexPos);
				 txtFileUp.PostedFile.SaveAs(iSavePath + "\\" + iFileName);			
			      }

                        string UserID_ = Session["UserID"].ToString();
                        string InsertCmd = "Insert into CategoryTemplate(Cate_Name,Cate_UID,Cate_ParentUID,Cate_TypeOfNode,Cate_StartDate,Cate_EndDate,Cate_SortNum,Cate_ImgUrl,Cate_ShowMode,Cate_ShowArea,PortalName,UserSN)";

			if(iSort=="")   iSort="1";
			
			if(iKind=="1")//1-->Folder
			   Cate_ShowMode=1;

                        int uID = get_MAXUID()+1;
			
	                WhereCmd = "Values(N'" + iName + "',"+uID+", " + txtParentID.Text.ToString() + ", " + iKind + ", '" + iSDate + "', '" + iEDate + "', " + iSort + ", N'" + iFileName + "', " + Cate_ShowMode + "," + iShowArea + ", N'" + Portal + "',N'" + UserID_ + "')";
                               
                        myAPI.Edit_Data(InsertCmd + WhereCmd);
       
			if(iKind=="1")
			   OkMsg = "        目錄：" + iName + " 開始日期： " + iSDate + " 結束日期： " + iEDate + "<br>";
			else
			   OkMsg = "        影音：" + iName + " 開始日期： " + iSDate + " 結束日期： " + iEDate + "<br>";
			labUserMsg.Text += "<br>" + OkMsg ;
		}
	}
}
