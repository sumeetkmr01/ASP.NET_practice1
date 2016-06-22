using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_frm_ProdReg : System.Web.UI.Page
{
    DataTable dt,dt1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillCmb();
            FillGrd();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Save();
        clsConnection.ClearInputs(Page.Controls);
        FillGrd();
        ClearHiddenField();
    }

    private void FillCmb()
    {
        dt = clsConnection.dtCondition("SELECT ID,CATID FROM CATEGORY");
        cmdCatg.DataSource = dt;
        cmdCatg.DataTextField = "CATID";
        cmdCatg.DataValueField = "ID";
        cmdCatg.DataBind();
    }

    private void Save()
    {
        string FilePath =Server.MapPath("~/Uploads/");
        string FilePath2 = "~/Uploads/" + Upload.FileName;
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("PRODUCTREG");
        DataRow dr = ds.Tables[0].NewRow();
        dr["PNAME"] = txtProdName.Text.Trim().ToUpper();
        dr["PDESC"] = txtDescription.Text.Trim().ToUpper();
        dr["PCATEGORYID"] = cmdCatg.SelectedItem.Text;
        if (Upload.FileName == "")
        {
            dr["PPIC"] = hfPPIC.Value;
        }
        else
        {
            dr["PPIC"] = Upload.FileName;
        }
        if (hfProdId.Value != "")
        {
            dr["PPRODID"] = hfProdId.Value;
        }
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "PRODUCTREG");
        
        string ProdId = clsConnection.OneField("PPRODID", "PRODUCTREG WHERE PNAME='" + txtProdName.Text.Trim() + "'");
        Upload.PostedFile.SaveAs(FilePath + ProdId + "@" + Upload.FileName);
      //  Upload.PostedFile.SaveAs("~/Uploads/" + ProdId + "@" + Upload.FileName);
      //  hfCatid.Value = clsConnection.OneFieldWithCond("CATID", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim() + "'");
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Your product is registered under this '" + hfCatid.Value + "');", true);
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {

    }

    private void FillGrd()
    {
        dt = clsConnection.dtCondition("SELECT ID,PNAME,PDESC,PCATEGORYID,PPRODID,PPIC FROM PRODUCTREG");
        dt1=dt.Clone();
        grd.DataSource = dt;
        grd.DataBind();
        DataRow dr;
       // string Path = "";
        for (int i = 0; i < grd.Rows.Count; i++)
        {
            dr = dt1.NewRow();
            dr["ID"] = dt.Rows[i]["ID"].ToString();
            dr["PNAME"] = dt.Rows[i]["PNAME"].ToString();
            dr["PDESC"] = dt.Rows[i]["PDESC"].ToString();
            dr["PCATEGORYID"] = dt.Rows[i]["PCATEGORYID"].ToString();
            dr["PPRODID"] = dt.Rows[i]["PPRODID"].ToString();
            dr["PPIC"] = "~/Uploads/" + dt.Rows[i]["PPRODID"].ToString() + "@" + dt.Rows[i]["PPIC"].ToString();
            dt1.Rows.Add(dr);
        }
        grd.DataSource = dt1;
        grd.DataBind();
        //if (dt.Rows[i]["PPIC"].ToString().Length > 10)
        //{
        //     Path = dt.Rows[i]["PPIC"].ToString().Substring(0, 10);
        //}
        //string[] ppic= dt.Rows[i]["PPIC"].ToString().Split('/');
        //dr["PPIC"] = Path + dt.Rows[i]["PPRODID"].ToString() + "@" + ppic[2];
    }

    protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string var = e.CommandName.ToString();
        int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
        int index = Convert.ToInt32(grd.Rows[rowIndex].RowIndex);

        switch (var)
        {
            case "Edit":
                hf1.Value = index.ToString();
                hffield.Value = "Edit";
                break;
            case "Delete":
                hf1.Value = index.ToString();
                hffield.Value = "Delete";
                break;
        }
        ShowData();
    }

    private void ShowData()
    {
        switch (hffield.Value)
        {
            case "Edit":
                dt = new DataTable();
                string a = "SELECT ID,PNAME,PDESC,PCATEGORYID,PPRODID,DATE,PPIC  FROM PRODUCTREG WHERE PNAME='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[0].Text.Trim() + "' AND PCATEGORYID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[2].Text.Trim() + "'";
                dt = clsConnection.dtCondition("SELECT ID,PNAME,PDESC,PCATEGORYID,PPRODID,DATE,PPIC  FROM PRODUCTREG WHERE PNAME='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[0].Text.Trim() + "' AND PCATEGORYID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[2].Text.Trim() + "'");
                txtProdName.Text = dt.Rows[0]["PNAME"].ToString().Trim();
                txtDescription.Text = dt.Rows[0]["PDESC"].ToString().Trim();
                cmdCatg.SelectedItem.Text = dt.Rows[0]["PCATEGORYID"].ToString().Trim();
                hfId.Value = dt.Rows[0]["ID"].ToString().Trim();
                hfProdId.Value = dt.Rows[0]["PPRODID"].ToString().Trim();
                hfPPIC.Value = dt.Rows[0]["PPIC"].ToString().Trim();
                break;
            case "Delete":
                clsConnection.ExcCom("DELETE FROM PRODUCTREG WHERE PPRODID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[3].Text.Trim() + "' AND PCATEGORYID='" + grd.Rows[Convert.ToInt32(hf1.Value)].Cells[2].Text.Trim() + "'");
                FillGrd();
                break;
        }
    }

    protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    private void ClearHiddenField()
    {
        hf1.Value = "";
        hfProdId.Value = "";
        hffield.Value = "";
        hfId.Value = "";
        hfPPIC.Value = "";
    }
}