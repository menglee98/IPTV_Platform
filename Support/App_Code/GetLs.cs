using System;
using System.Data;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Data.SqlClient;

namespace Support.BGProcess
{
	public class GetLs
	{
		public GetLs()	{}
		public static DataTable dt0 = null;
		public static DataTable dt1 = null;

		public static string Message ="";

		public static void GenerateContentLS(string Date1, string Date2 ,string desc)//�W�D
		{
			try{
				dt0=DBCommon.ExecSqlDs(" dbo.ChkContentLog '"+Date1+"' , '"+Date2+"' , '"+desc+"' ;").Tables[0];
			}
			catch(Exception ex ){Message+="Ū����Ʈw��, �o�ͥH�U���~�G\n"+ex.ToString()+"\n";}
		}

	}
}
