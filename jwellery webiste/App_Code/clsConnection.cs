using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for clsConnection
/// </summary>
public class clsConnection
{
 
   public static SqlConnection Connect()
   {
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DB"].ConnectionString);
       try
       {
           con.Open();
       }
       catch
       {
           con.Close();
       }
       return con;

   }

   public static DataSet DsFill(string Tabname)
   {
       DataSet ds = new DataSet();
       string Query = "";
       Query = "SELECT * FROM " + Tabname;
       SqlCommand com = new SqlCommand(Query, Connect());
       SqlDataAdapter da = new SqlDataAdapter(com);
       try
       {
           da.Fill(ds);
       }
       catch
       {
       }
       return ds;
   }
   public static DataTable  DtFill(string Tabname)
   {
       DataTable dt = new DataTable();
       string Query = "";
       Query = "SELECT * FROM " + Tabname;
       SqlCommand com = new SqlCommand(Query, Connect());
       SqlDataAdapter da = new SqlDataAdapter(com);
       try
       {
           da.Fill(dt);
       }
       catch
       {
       }
       return dt;
   }

   public static void Save(DataSet ds,string Tabname)
   {
       SqlCommand com = new SqlCommand("SELECT * FROM " + Tabname + "", Connect());
       SqlCommandBuilder scb;
       DataSet ds1=new DataSet ();
       SqlDataAdapter da = new SqlDataAdapter(com);
       scb=new SqlCommandBuilder (da); 
       da.Fill(ds1,"CREATEUSER");
       try
       {
           da.Update(ds);
         //  da.InsertCommand();
       }
       catch
       {
       }
   }
	public clsConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
}
