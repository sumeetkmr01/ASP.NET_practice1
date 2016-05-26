﻿using System;
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


}