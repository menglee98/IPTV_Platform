namespace DatePicker
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		DatePicker 的摘要描述。
	/// </summary>
	public partial class DatePicker : System.Web.UI.UserControl
	{
		public string CalendarUrl="./MyTool/Calendar.aspx";
		public string GetDateTimeValue
		{	
			get { return txtDate.Text; }
			set { txtDate.Text = value; }
		}
		public void SetDateTimeValue(string ValueString)
		{
			txtDate.Text = ValueString;
		}

		public DateTime DefaultValue = new DateTime();
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在這裡放置使用者程式碼以初始化網頁
			this.txtDate.Attributes["OnClick"] = "window.open('" + CalendarUrl + "?ReturnObjectID=" + this.txtDate.ClientID + "','','left=200,top=200,height=200,width=225,status=no,toolbar=no,menubar=no,location=no','')";
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
		///		此為設計工具支援所必須的方法 - 請勿使用程式碼編輯器修改
		///		這個方法的內容。
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
	}
}
