namespace DatePicker
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	/// <summary>
	///		DatePicker ���K�n�y�z�C
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
			// �b�o�̩�m�ϥΪ̵{���X�H��l�ƺ���
			this.txtDate.Attributes["OnClick"] = "window.open('" + CalendarUrl + "?ReturnObjectID=" + this.txtDate.ClientID + "','','left=200,top=200,height=200,width=225,status=no,toolbar=no,menubar=no,location=no','')";
		}
		

		#region Web Form �]�p�u�㲣�ͪ��{���X
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: ���� ASP.NET Web Form �]�p�u��һݪ��I�s�C
			//
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		///		�����]�p�u��䴩�ҥ�������k - �ФŨϥε{���X�s�边�ק�
		///		�o�Ӥ�k�����e�C
		/// </summary>
		private void InitializeComponent()
		{

		}
		#endregion
	}
}
