using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Data.SqlClient;

using Ndapn.MyTool;

namespace Ndapn.VideoMgmTreeMenu
{
	/// <summary>
	/// treemenu ���K�n�y�z�C
	/// </summary>
	public partial class treemenu : System.Web.UI.Page
	{		
		public string onload = "";
		API myAPI = null;
		//myAPI myAPI = new myAPI(Session["DBName"]);
		
		int NumOfNode = 0;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// �b�o�̩�m�ϥΪ̵{���X�H��l�ƺ���	
			try
			{
				myAPI = new API(Session["DBName"].ToString());		
			}
			catch
			{
				onload = "alert('�Х��n�J');top.location.href='../default.aspx';";
				Response.End();
				return;
			}
		}

		public string getUID()
		{
			string id="",TempCmd="";
			string Portal = Session["userGroup"].ToString();
			
			TempCmd="SELECT * FROM GroupN Where PortalName like '" + Portal + "'";
			//20081009����(clay)��
			
			SqlDataReader myDataReader = myAPI.Create_Rd(TempCmd);
			while(myDataReader.Read())
			{
				//id = myDataReader["UID"].ToString();
				id = "1";
				
			}
            myDataReader.Close();
			return id;
            //alert(TempCmd);
		}

		public string MakeMenu()
		{
			string MenuScript="", SelectCmd="",id="";
			//string Portal = Session["userGroup"].ToString();
			id=getUID();
			try
			{
				SelectCmd = "SELECT Cate_UID, Cate_Name FROM CategoryTemplate Where Cate_TypeOfNode = 0";
			
				SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
				if(myDataReader.Read())
					//20080130tsai MenuScript = "foldersTree = gFld('<strong>" + myDataReader["Cate_Name"].ToString() +"</strong>', '../redirector.aspx?ID=" + myDataReader["Cate_UID"].ToString() + "&TypeOfNode=root&Name=" + Server.UrlEncode(myDataReader["Cate_Name"].ToString()) +"')\n" + ConstructMenu("1","foldersTree");
					MenuScript = "foldersTree = gFld('<strong>" + myDataReader["Cate_Name"].ToString() +"</strong>', '../redirector.aspx?ID=" + myDataReader["Cate_UID"].ToString() + "&TypeOfNode=root&Name=" + Server.UrlEncode(myDataReader["Cate_Name"].ToString()) +"')\n" + ConstructMenu(id,"foldersTree");
				else
					MenuScript = "foldersTree = gFld('<strong>Smart iTV �򥻳]�w��</strong>', '../redirector.aspx?ID=0&TypeOfNode=null&Name=" + Server.UrlEncode("Smart iTV �򥻳]�w��") +"')\n";
				myDataReader.Close();
			}
			catch
			{
				onload = "alert('�Х��n�J');top.location.href='../default.aspx';";
			}
			return MenuScript;
		}

		private string ConstructMenu(string ParentID, string ParentName)
		{
            string uid_str = "";
            string sql1 = "select * from GroupN";
            SqlDataReader myDataReader1 = myAPI.Create_Rd(sql1);
            while (myDataReader1.Read())
            {
                uid_str += "'" + myDataReader1["UID"].ToString() + "',";
            }
            myDataReader1.Close();
            uid_str = myAPI.str_recombination(uid_str, ',', ",");

			string MenuScript="", nowDate, SelectCmd="", temPID="", temStr="", NodeName="", SDate="", EDate="",NodeImg="",ShowMode=""; 
			
			nowDate = DateTime.Today.ToShortDateString();
			SelectCmd = "SELECT Cate_UID, Cate_ShowMode, Cate_Name, Cate_ImgUrl, CONVERT(CHAR(10), Cate_StartDate, 111) AS Cate_StartDate, CONVERT(CHAR(10), Cate_EndDate, 111) AS Cate_EndDate, ";
			//SelectCmd += "Cate_TypeOfNode FROM CategoryTemplate Where ('" + nowDate + "' BETWEEN Cate_StartDate AND Cate_EndDate) AND Cate_ParentUID=" + ParentID + " ORDER BY Cate_SortNum";
			
			//int Portal = Convert.ToInt32(Session["userGroup"]);
			string Portal = Session["userGroup"].ToString();
            string UserID_ = Session["UserID"].ToString();
            if (Portal == "P100000" && ParentID == "1")
            {
                SelectCmd += "Cate_TypeOfNode FROM CategoryTemplate Where Cate_ParentUID IN (" + uid_str + ") ORDER BY Cate_SortNum ASC, Cate_UID DESC";
			}
            else if(Portal=="P100000"){
				SelectCmd += "Cate_TypeOfNode FROM CategoryTemplate Where Cate_ParentUID=" + ParentID + " ORDER BY Cate_SortNum ASC, Cate_UID DESC";
				//SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);													
			}
			else{
                SelectCmd += "Cate_TypeOfNode FROM CategoryTemplate Where Cate_ParentUID=" + ParentID + " and PortalName='" + Portal + "' and UserSN='" + UserID_ + "' ORDER BY Cate_SortNum ASC, Cate_UID DESC";
				//SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
			}//20081009����(clay)��
                        
                        SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
                         
			while(myDataReader.Read())
			{
				temPID = myDataReader["Cate_UID"].ToString();
				NodeName = myDataReader["Cate_Name"].ToString();
				SDate = myDataReader["Cate_StartDate"].ToString();
				EDate = myDataReader["Cate_EndDate"].ToString();
				NodeImg = myDataReader["Cate_ImgUrl"].ToString();
				ShowMode =myDataReader["Cate_ShowMode"].ToString();

				switch(myDataReader["Cate_TypeOfNode"].ToString())
				{
					case "1":// 1 --> this is node
						NumOfNode++;
						temStr = "aux" + NumOfNode.ToString();
						MenuScript += temStr + "=insFld(" + ParentName + ", gFld('" + NodeName +"', '../redirector.aspx?ID=" + temPID + "&TypeOfNode=sub&aSDate=" + Server.UrlEncode(SDate) + "&aEDate=" + Server.UrlEncode(EDate) + "&Name=" + Server.UrlEncode(NodeName) +"&NodeImg="+ Server.UrlEncode(NodeImg) + "&ShowMode=" + ShowMode+"'))\n" + ConstructMenu(temPID,temStr) ;
						break;
					case "2":// 2 --> this is leaf						
						MenuScript += "insDoc("+ ParentName +", gLnk('R', '" + NodeName + "', '../leaf_redirector.aspx?ID=" + temPID + "&TypeOfNode=leaf&aSDate=" + Server.UrlEncode(SDate) + "&aEDate=" + Server.UrlEncode(EDate) + "&Name=" + Server.UrlEncode(NodeName) +"&NodeImg="+ Server.UrlEncode(NodeImg) + "&ShowMode=" + ShowMode+"'))\n";
						break;
				}
			}
			myDataReader.Close();
			return MenuScript;
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
		/// �����]�p�u��䴩�ҥ�������k - �ФŨϥε{���X�s�边�ק�
		/// �o�Ӥ�k�����e�C
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion
	}
}
