using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

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
       // FOR FILLING DATASET WITH FULL TABLE DATA BASED ON A TABLENAME
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
           return ds;
       }
       return ds;
   }

   public static DataTable  DtFill(string Tabname)
   {
       // FOR FILLING DATATABLE WITH FULL TABLE DATA BASED ON A TABLENAME
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
           return dt;
       }
       return dt;
   }

   public static void Save(DataSet ds,string Tabname)
   {
       // FOR SAVING DATA
       SqlCommand com = new SqlCommand("SELECT * FROM " + Tabname + "", Connect());
       SqlCommandBuilder scb;
       DataSet dsSave=new DataSet ();
       SqlDataAdapter da = new SqlDataAdapter(com);
       scb=new SqlCommandBuilder (da);
       da.Fill(dsSave, "TABLE");
       try
       {
           da.Update(ds);
         //  da.InsertCommand();
       }
       catch
       {
       }
   }

   public static string OneField(string FieldName,string TabName)
   {
       // FOR FILLING A STRING WITH ONLY ONE COLUMN
       string Squery = "SELECT " + FieldName + "  FROM " + TabName + ""; ;
       SqlCommand com = new SqlCommand(Squery, Connect());
       SqlDataReader dr = com.ExecuteReader();
       if (dr.Read())
       {
           Squery = dr[0].ToString().Trim();
       }
       else
       {
           Squery = "";
       }
       return Squery;
   }

   public static DataTable dtCondition(string Query)
   {
       // FOR FILLING A DATATABLE WITH DATA BASED ON CONDITION
       DataTable dt = new DataTable();
       SqlCommand com = new SqlCommand(Query, Connect());
       SqlDataAdapter da = new SqlDataAdapter(com);
       try
       {
           da.Fill(dt);
       }
       catch
       {
           return dt;
       }
       return dt;
   }

   public static  void ExcCom(string Query)
   {
       // FOR EXECUTING COMMAND
       SqlCommand com = new SqlCommand(Query, Connect());
       try
       {
           com.ExecuteNonQuery();
       }
       catch
       {
       }
   }

   public static string OneFieldWithCond(string FieldName, string TabName,string Cond)
   {
       // FOR FILLING A STRING WITH ONE COLUMN BASED ON A CONDITION
       string Squery = "SELECT " + FieldName + "  FROM " + TabName +" " + Cond + "";
       SqlCommand com = new SqlCommand(Squery, Connect());
       SqlDataReader dr = com.ExecuteReader();
       if (dr.Read())
       {
           Squery = dr[0].ToString().Trim();
       }
       else
       {
           Squery = "";
       }
       return Squery;
   }
	public clsConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
}
