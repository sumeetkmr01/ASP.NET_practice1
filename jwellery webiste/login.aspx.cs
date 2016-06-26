using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;

public partial class login : System.Web.UI.Page
{
    string query = "", username = "", password = "";
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlCommand co = new SqlCommand();
        //co.Connection = clsConnection.Connect();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        query = "SELECT ID,UserName,Password FROM Login WHERE USERNAME=@user AND PASSWORD=@psd";
        SqlCommand com = new SqlCommand();
        com.Connection = clsConnection.Connect();
        com.CommandType = CommandType.Text;
        com.CommandText = query;
        com.Parameters.AddWithValue("@user",txtEmail.Text.Trim());
        com.Parameters.AddWithValue("@psd", txtPassword.Text.Trim());
        SqlDataReader dr = com.ExecuteReader();
        if (dr.Read())
        {
            id = Convert.ToInt32(dr[0].ToString().Trim());
            username = dr[1].ToString().Trim();
            password = dr[2].ToString().Trim();
            Response.Redirect("~/DashBoard.aspx");
        }
        else if (txtEmail.Text != username)
        {
            //string queryString = "PopUpPage.aspx";
            //string newWin = "window.open('" + queryString + "');";
            //ClientScript.RegisterStartupScript(this.GetType(), "pop", newWin, true);
            string url = "PopUpPage.aspx";
            string s = "window.open('" + url + "', 'popup_window', 'width=300,height=100,left=100,top=100,resizable=yes');";
            ClientScript.RegisterStartupScript(this.GetType(), "script", s, true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Invalid Username');", true);
        }
        else if(txtPassword.Text!=password)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Invalid Password');", true);
           // ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "PopUP", "OpenSingle('" + fil_loc + "?STR=" + QR_str + "','900px','490px','" + title + "');", true);
        }
      //  Open();
        //Response.Redirect("~/PopUpPage.aspx");
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "PopUP", "alert('Invalid Password');", true);
        //Page p = (Page)HttpContext.Current.CurrentHandler;
        //ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "PopUP", "OpenSingle('~/PopUpPage.aspx','900px','490px');", true);
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "PopUP", "OpenSingle('PopUpPage.aspx','325px','350px','aa');", true);
    }

    private void Open()
    {
        if (HttpContext.Current.CurrentHandler is Page)
        {
           // string QR_str = "";
              string   title="";
            string fil_loc = System.Web.VirtualPathUtility.ToAbsolute("~/PopUpPage.aspx");
            //fil_loc = "SSeek.aspx";

            Page p = (Page)HttpContext.Current.CurrentHandler;

            if (ScriptManager.GetCurrent(p) != null)
            {
                ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "PopUP", "OpenSingle('" + fil_loc + "','900px','490px','" + title + "');", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(p, p.GetType(), "PopUP", "OpenSingle('" + fil_loc + "','900px','490px','" + title + "');", true);
            }

        }
    }


    #region Comment
    //    [WebMethod] 
//[ScriptMethod(UseHttpGet = true)]
//public static bool Authenticate(int username, string password)
//{
//    bool isAuthenticated = false; // some method to authenticate
//   return isAuthenticated;
//}


    //[WebMethod]
    //private static string ValidateUser()
    //{
 
    //    int userId = 0;
    //   // string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    //    //using (SqlConnection con = new SqlConnection(clsConnection.Connect()))
    //    //{
    //        using (SqlCommand cmd = new SqlCommand("Validate_Admin"))
    //        {
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            //cmd.Parameters.AddWithValue("@Username", user.Username);
    //            //cmd.Parameters.AddWithValue("@Password", user.Password);
    //            cmd.Connection = clsConnection.Connect();
    //            //con.Open();
    //            userId = Convert.ToInt32(cmd.ExecuteScalar());
    //            //con.Close();
    //        }
    //    //}
    //    string IsValidate = string.Empty;
    //    switch (userId)
    //    {
    //        case -1:
    //            IsValidate = "Username and/or password is incorrect.";
    //            break;
    //        case -2:
    //            IsValidate = "Account has not been activated.";
    //            break;
    //        case -3:
    //            IsValidate = "Login Successfully.";
    //            break;
    //    }

    //    return IsValidate;
    //}

    #endregion

    protected void lnkForget_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/frm_ForgetPsd.aspx");
    }
}