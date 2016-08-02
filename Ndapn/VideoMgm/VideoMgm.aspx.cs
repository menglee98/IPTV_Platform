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
using System.Net;
using System.IO;
using System.Data.SqlClient;

using Ndapn.MyTool;

namespace Ndapn
{
	/// <summary>
	/// VideoMgm 的摘要描述。
	/// </summary>
	public partial class VideoMgm : System.Web.UI.Page
	{
//2007/9/22 柯旭峰		private string videoPath = @"D:\WEB_SITE\www.modlife.com.tw\wfsroot";
		//private string videoPath = @"D:\Inetpub\wwwroot\Smart-iTV_V2.3\video";
		//private string videoPath = @"C:\Inetpub\wwwroot\Smart-iTV_V2.4\video";
        System.Net.IPAddress sever_ip = new System.Net.IPAddress(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].Address);
		private string videoPath = @"\\";
        //樹狀用
        API myAPI = null;
        int NumOfNode = 0;

		protected System.Web.UI.WebControls.Button btnDEL;
		int PathLenth = 0;
		protected System.Web.UI.WebControls.Button btnUpload;
		public string onload = "";
		public static string a = "";
        public string vpa="@";
        public string pvpa;
		protected void Page_Load(object sender, System.EventArgs e)
		{
			// 在這裡放置使用者程式碼以初始化網頁
            string name;
            name = Session["UserID"].ToString();
            videoPath += sever_ip+"\\WMPub\\WMRoot\\"+name;
			if(!IsPostBack)
			{
				PathLenth = videoPath.Length;
                //addList();
			}

            try
            {
                myAPI = new API(Session["DBName"].ToString());
            }
            catch
            {
                onload = "alert('請先登入');top.location.href='../default.aspx';";
                Response.End();
                return;
            }

		}

        public string getUID()
        {
            string id = "", TempCmd = "";
            string Portal = Session["userGroup"].ToString();

            TempCmd = "SELECT * FROM GroupN Where PortalName like '" + Portal + "'";

            SqlDataReader myDataReader = myAPI.Create_Rd(TempCmd);
            while (myDataReader.Read())
            {
                //id = myDataReader["UID"].ToString();
                
                //統一用416，只讀取自己帳號檔案
                id = "416";

            }
            myDataReader.Close();
            return id;
        }

        public string MakeMenu()
        {
            string MenuScript = "", SelectCmd = "", id = "";
            //string Portal = Session["userGroup"].ToString();
            string user = Session["UserID"].ToString();
            //id = getUID();
            id = "416";
            try
            {
                SelectCmd = "SELECT Tree_UID, Tree_Name FROM TreeTemplate Where Tree_TypeOfNode = 0";
                //SelectCmd = "SELECT Tree_UID, Tree_Name FROM TreeTemplate Where UserSN like '" + user + "'";

                SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
                if (myDataReader.Read())
                {
                    //20080130tsai MenuScript = "foldersTree = gFld('<strong>" + myDataReader["Tree_Name"].ToString() +"</strong>', '../redirector.aspx?ID=" + myDataReader["Tree_UID"].ToString() + "&TypeOfNode=root&Name=" + Server.UrlEncode(myDataReader["Tree_Name"].ToString()) +"')\n" + ConstructMenu("1","foldersTree");
                    MenuScript = "foldersTree = gFld('<strong>" + myDataReader["Tree_Name"].ToString() + "</strong>', '')\n" + ConstructMenu(id, "foldersTree");
                    //MenuScript = "foldersTree = gFld('<strong>" + myDataReader["Tree_Name"].ToString() + "</strong>', '')\n" + ConstructMenu("416", "foldersTree");
                }
                else
                    MenuScript = "foldersTree = gFld('<strong>Smart iTV 基本設定版</strong>', '../redirector.aspx?ID=0&TypeOfNode=null&Name=" + Server.UrlEncode("Smart iTV 基本設定版") + "')\n";
                myDataReader.Close();
            }
            catch
            {
                onload = "alert('請先登入');top.location.href='../default.aspx';";
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

            string MenuScript = "", SelectCmd = "", temPID = "", temStr = "", NodeName = "";

            SelectCmd = "SELECT Tree_UID, Tree_Name,";
            //SelectCmd += "Tree_TypeOfNode FROM TreeTemplate Where ('" + nowDate + "' BETWEEN Tree_StartDate AND Tree_EndDate) AND Tree_ParentUID=" + ParentID + " ORDER BY Tree_SortNum";

            //int Portal = Convert.ToInt32(Session["userGroup"]);
            //string Portal = Session["userGroup"].ToString();
            string Portal = "P200000";
            string UserID_ = "1234";
            string name = "1234";

            //只顯現個人檔案，取消Manager權限
            //if (Portal != "P200000")
            //{
            //    Portal = "P200000";
            //}

            if (Portal == "P100000" && ParentID == "1")
            {
                SelectCmd += "Tree_TypeOfNode FROM TreeTemplate Where Tree_ParentUID IN (" + uid_str + ") ORDER BY Tree_SortNum ASC, Tree_UID DESC";
            }
            else if (Portal == "P100000")
            {
                SelectCmd += "Tree_TypeOfNode FROM TreeTemplate Where Tree_ParentUID=" + ParentID + " ORDER BY Tree_SortNum ASC, Tree_UID DESC";
                //SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);													
            }
            else
            {
                SelectCmd += "Tree_TypeOfNode FROM TreeTemplate Where Tree_ParentUID=" + ParentID + " and PortalName='" + Portal + "' and UserSN='" + UserID_ + "' ORDER BY Tree_SortNum ASC, Tree_UID DESC";
                //SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);
            }//20081009奕誠(clay)改

            SqlDataReader myDataReader = myAPI.Create_Rd(SelectCmd);

            while (myDataReader.Read())
            {
                temPID = myDataReader["Tree_UID"].ToString();
                NodeName = myDataReader["Tree_Name"].ToString();
                switch (myDataReader["Tree_TypeOfNode"].ToString())
                {
                    case "1":// 1 --> this is node
                        pvpa = NodeName;
                        NumOfNode++;
                        temStr = "aux" + NumOfNode.ToString();
                        MenuScript += temStr + "=insFld(" + ParentName + ", gFld('" + NodeName + "', ''))\n" + ConstructMenu(temPID, temStr);
                        //MenuScript += temStr + "=insFld(" + ParentName + ", gFld('" + NodeName + "', ''))\n";
                        break;
                    case "2":// 2 --> this is leaf
                        vpa =name+"/"+pvpa+"/"+NodeName;
                        //MenuScript += "insDoc(" + ParentName + ", gLnk('R', '" + NodeName + "', '../video_input.aspx?leafID=783&leafSDate=2010/09/06&leafEDate=2010/12/12&leafName=1234&leafImg=1_BG_1024_bulletin.jpg&video="+vpa+"'))\n";
                        MenuScript += "insDoc(" + ParentName + ", gLnk('R', '" + NodeName + "', '" + vpa + "'))\n";
                        break;
                    case "3":// 2 --> this is leaf
                        vpa = name + "/" + NodeName;
                        //MenuScript += "insDoc(" + ParentName + ", gLnk('R', '" + NodeName + "', '../video_input.aspx?leafID=783&leafSDate=2010/09/06&leafEDate=2010/12/12&leafName=1234&leafImg=1_BG_1024_bulletin.jpg&video="+vpa+"'))\n";
                        MenuScript += "insDoc(" + ParentName + ", gLnk('R', '" + NodeName + "', '" + vpa + "'))\n";
                        break;
                }
            }
            myDataReader.Close();
            return MenuScript;
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

        //void addList()
        //{
        //    System.Data.DataTable dt = new DataTable();
        //    dt.Columns.Add("FileName");
        //    dt.Columns.Add("FullFileName");
        //    string[] files = Directory.GetFiles(videoPath);

        //    for (int i = 0 ; i<files.Length  ;i++)
        //    {
        //        int j = PathLenth +1;
        //        DataRow dr = dt.NewRow();
        //        dr[0] = files[i];
        //        dr[1] = files[i].Substring(j,files[i].Length-j);
        //        dt.Rows.Add(dr);
        //    }
        //    VideoLs.DataValueField = "FileName";
        //    VideoLs.DataTextField = "FullFileName";
        //    VideoLs.DataSource = dt;
        //    VideoLs.DataBind();
        //}

//		private void btnDEL_Click(object sender, System.EventArgs e)
//		{
//			if(!chkSelection())
//				return;
//			//File.Delete(this.VideoLs.SelectedValue);
//		}
        //private bool chkSelection()
        //{
        //    if(VideoLs.SelectedValue == null)
        //    {
        //        onload = "alert();";
        //        return false;
        //    }
        //    else
        //        return true;
        //}
	}
}
