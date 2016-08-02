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

using LibraryMOD.API;

namespace LibraryMOD
{
	/// <summary>
	/// login 的摘要描述。
	/// </summary>
	public partial class login : System.Web.UI.Page
	{
		public string MovieName, LoginStatus, ContentID, ParentID;
		protected void Page_Load(object sender, System.EventArgs e)
		{
		
			// 在這裡放置使用者程式碼以初始化網頁
	
				if(Request.Params["ContentID"]!=null && Request.Params["MovieName"]!=null && Request.Params["ParentID"]!=null)
				{
					MovieName = Request.Params["MovieName"].ToString();
					ContentID = Request.Params["ContentID"].ToString();
					ParentID = Request.Params["ParentID"].ToString();

					if(Request.Params["UserSN"]!=null)//user had entered the ID --> to open db to check
					{
						myAPI myAPI = null;

						if(Session["DBName"]==null) Response.Redirect ("LogOn.aspx");
						myAPI =new myAPI(Session["DBName"].ToString() );
						
						if(myAPI.Check_User(Request.Params["UserSN"].ToString().Trim()))
						{	
							//20090813 clay註解
							//myAPI.Update_View_Content_Log(Request.Params["UserSN"].ToString(), ContentID, Request.UserHostAddress.ToString(),Session.SessionID);
							LoginStatus = "1";//logon
						}
						else
						{
							LoginStatus = "0";//login failed
						}
					}					
						
				}
				else
					Response.Redirect("main.aspx");

		}

		#region Web Form 設計工具產生的程式碼
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: 此為 ASP.NET Web Form 設計工具所需的呼叫。
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// 此為設計工具支援所必須的方法 - 請勿使用程式碼編輯器修改
		/// 這個方法的內容。
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}
