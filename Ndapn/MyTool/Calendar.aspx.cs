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

namespace DatePicker
{
	/// <summary>
	/// WebForm2 的摘要描述。
	/// </summary>
	public partial class WebForm2 : System.Web.UI.Page
	{
		
		string ReturnObjectID="";

		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在這裡放置使用者程式碼以初始化網頁
			ReturnObjectID = Request["ReturnObjectID"];
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

		protected void Calendar1_SelectionChanged(object sender, System.EventArgs e)
		{
			DateTime SelectedDate = new DateTime();
			string JavascriptStr = "";
			
			SelectedDate = this.Calendar.SelectedDate;
			JavascriptStr = "<script> opener.Form1." + ReturnObjectID + ".value='" + SelectedDate.ToShortDateString() + "'; close(); </script>";
			Response.Write(JavascriptStr);
		}
	}
}
