using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class frm_CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //decode();
        txtName.Focus();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill Name');", true);
            return;
        }
        if (txtUserName.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill UserName');", true);
            return;
        }
        if (txtPassword.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Please Fill Password');", true);
            return;
        }
        Save();
    }
    private void Save()
    {
        string UserCheck = clsConnection.OneFieldWithCond("USERNAME", "LOGIN", "WHERE USERNAME='" + txtUserName.Text.Trim() + "'");
        if (UserCheck != "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('This UserName Already Exists. Please Choose any Other UserName');", true);
            return;
        }
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("LOGIN");
        DataRow dr = ds.Tables[0].NewRow();
        dr["NAME"] = txtName.Text.Trim();
        dr["USERNAME"] = txtUserName.Text.Trim();
        dr["PASSWORD"] = txtPassword.Text.Trim();
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "LOGIN");
        ClearText(this);
    }
    private void ClearText(Control con)
    {
        try
        {
            foreach (Control c in con.Controls)
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text="";
                   
                }
                //else
                //{
                //    if (cmbCust.SelectedIndex > 0)
                //    {
                //        cmbCust.SelectedIndex = 0;
                //    }
                //}
            }
        }
        catch (Exception)
        {
        }
    }
    private void decode()
    {
        string Query = "";
        Query = "select cast(dob as date)as date from cc  order by date";
        SqlCommand com = new SqlCommand(Query,clsConnection. Connect());
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);
        string mq0 = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (mq0.Length > 0)
            {
                mq0 = mq0 + ",cast(trim(dob)as date))="+dt.Rows[i][0].ToString().Trim();
            }
            else
            {
                mq0 = "cast(trim(dob)as date))="+dt.Rows[i][0].ToString().Trim();
            }
        }
        string query = "select name ," + mq0 + " from cc ";
        SqlCommand cmd = new SqlCommand(query, clsConnection.Connect());
        da = new SqlDataAdapter(cmd);
        da.Fill(dt);
    }

}