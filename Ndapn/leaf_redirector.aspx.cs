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

using Ndapn.MyTool;


namespace Ndapn
{
	public partial class leaf_redirector : System.Web.UI.Page
	{
		API myAPI = null;
		public string onload = "";
		protected void Page_Load(object sender, System.EventArgs e)
		{
			try{
				myAPI = new API(Session["DBName"].ToString());
			}
			catch{
				onload = "alert('請先登入');top.location.href='./default.aspx';";
			}
			if(!IsPostBack)
			{
				if(Request.Params["ID"]==null)
					Response.Redirect("./default.htm");
				string ShowMode = Request.Params["ShowMode"];
				txtName.Text = Request.Params["Name"];
				txtID.Text = Request.Params["ID"];
				txtParamters.Text = "?leafID=" + Request.Params["ID"] + "&leafSDate=" + Request.Params["aSDate"] + "&leafEDate=" + Request.Params["aEDate"] + "&leafName=" + Request.Params["Name"] + "&leafImg=" + Request.Params["NodeImg"];
				this.Button1.Attributes.Add("onclick", "JavaScript:parent.leftFrame_reload();");
				if(ShowMode!="0")
					Leaf_RedirectorGo(ShowMode);
				
			}
		}

		public void Leaf_RedirectorGo(string TypeOfLeaf)
		{
			switch(TypeOfLeaf)
			{
				case "3"://video
					Response.Redirect("./video_input.aspx" + txtParamters.Text);
					break;
				case "5"://album
					Response.Redirect("./album_input.aspx" + txtParamters.Text);
					break;
				case "4"://bulletin
					Response.Redirect("./bulletin_input.aspx" + txtParamters.Text);
					break;
				case "6"://marquee
					Response.Redirect("./marquee_input.aspx" + txtParamters.Text);
					break;
				case "7"://link to other channel or web site
					Response.Redirect("./link_input.aspx" + txtParamters.Text);
					break;	
				case "8"://test	//devin add 070528線上測試
					Response.Redirect("./test_input.aspx" + txtParamters.Text);
					break;
			}
		}

		#region Web Form 設計工具產生的程式碼
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		private void InitializeComponent(){}
		#endregion

		

		protected void Button1_Click(object sender, System.EventArgs e)
		{
			string SqlCmd,nowDate;
			if(rblistItemKind.SelectedValue=="6"){
				nowDate = DateTime.Today.ToShortDateString();
				SqlCmd = "Select Cate_ShowMode from CategoryTemplate Where Cate_ShowMode=6 AND ('" + nowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate)";
				SqlDataReader myDataReader = myAPI.Create_Rd(SqlCmd);
				if(myDataReader.Read()){
					labAlert.Visible=true;
					return;
				}
			}
			SqlCmd = "Update CategoryTemplate Set Cate_ShowMode = " + rblistItemKind.SelectedItem.Value + "Where Cate_UID=" + txtID.Text;
			myAPI.Edit_Data(SqlCmd);
			Leaf_RedirectorGo(rblistItemKind.SelectedValue.ToString());	
			labAlert.Text = txtName.Text;
                        labAlert.Visible=true;
		}

	}
}
