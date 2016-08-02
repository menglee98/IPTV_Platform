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

using MPLibrary;
using System.Data.SqlClient;
using System.Configuration;

using LibraryMOD.API;

namespace LibraryMOD
{
	/// <summary>
	/// WebForm1 的摘要描述。
	/// </summary>
	public partial class Default : System.Web.UI.Page
	{
		private string IPAddr;
		private string MdNum;
		private string STB;
		private string NetWork;
		myAPI myAPI = null;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			if(Session["DBName"]==null) Response.Redirect ("LogOn.aspx");
			Session["DBName"]="ndapn";
			myAPI =new myAPI(Session["DBName"].ToString() );
			
			
			#region 瀏覽紀錄

			#endregion
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
		{  }
		#endregion
	}
}