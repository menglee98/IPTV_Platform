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
using System.Configuration;
using System.IO;
using System.Data.SqlClient;

namespace Support
{
	public partial class Main : System.Web.UI.Page
	{
		private static DataTable dt0 ;
		private enum ReportType {content,system,audience};
		private static Enum curReportType = ReportType.content;
		public static string oninit = "";
		private string LogPath = ConfigurationSettings.AppSettings["IISLogPath"];

		protected void Page_Load(object sender, System.EventArgs e)
		{
			string c1 = Request.Params["ReportType"].ToLower();
			string c2 = curReportType.ToString().ToLower() ;

			#region 判斷報表種類
			oninit = "";
			try{
			   curReportType = ReportType.content;
			   lblTitle.Text = "頻道相關報表";
			   lbl0.Text = "頻道種類";
			}
			catch(Exception ex){
				lblProcessMessage.Text = ex.ToString();
				curReportType = ReportType.content;
				lblTitle.Text = "頻道相關報表";
			}
			#endregion
			if(!IsPostBack || c1!=c2){
				this.txtSDate.Text = DateTime.Now.AddMonths(-1).ToString("yyyy/MM/01");
				this.txtEDate.Text = DateTime.Parse(txtSDate.Text).AddMonths(1).AddDays(-1).ToString("yyyy/MM/dd");
				ItemFill();
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
		public void Grid_Change(Object sender, DataGridPageChangedEventArgs e) 
		{
			try{
				dgMainList.CurrentPageIndex = e.NewPageIndex;
				dgMainList.DataSource = dt0 ;
				dgMainList.DataBind();
			}
			catch{
				if(e.NewPageIndex>dgMainList.PageCount)
					lblProcessMessage.Text = "頁數超出範圍";
				dgMainList.Dispose();
			}
		}

		protected void btnSubmit_Click(object sender, System.EventArgs e)
		{
			int i = sltCtnType.SelectedIndex;
			BGProcess.GetLs.dt0 = null;
						
			AInput.Visible = true;
			BGProcess.GetLs.GenerateContentLS(txtSDate.Text,txtEDate.Text,this.sltCtnType.SelectedValue);
					
			this.DataBind();
			dt0 = BGProcess.GetLs.dt0;
			dgMainList.DataSource = dt0;
			try{
				dgMainList.DataBind();
			}
			catch{dgMainList.CurrentPageIndex =0;}
			lblProcessMessage.Text +=BGProcess.GetLs.Message.Replace("\n","<BR/>").Replace(" ","&nbsp;");
		}

		private void ItemFill()
		{
			
			this.sltCtnType.DataSource = BGProcess.DBCommon.ExecSqlDs("dbo.SelectionItems 0 ;").Tables[0];
				
			sltCtnType.DataBind();
		}
	}
}
