using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_frm_ProdReg : System.Web.UI.Page
{
    DataTable dt;
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
        DataSet ds = new DataSet();
        ds = clsConnection.DsFill("PRODUCTREG");
        DataRow dr = ds.Tables[0].NewRow();
        dr["PNAME"] = txtProdName.Text.Trim().ToUpper();
        dr["PDESC"] = txtDescription.Text.Trim().ToUpper();
        dr["PCATEGORYID"] = cmdCatg.SelectedItem.Text;
        dr["PPIC"] = Upload.FileName;
        //if (hfCatid.Value != "")
        //{
        //    dr["CATID"] = hfCatid.Value;
        //}
        ds.Tables[0].Rows.Add(dr);
        clsConnection.Save(ds, "PRODUCTREG");
        string FilePath = Server.MapPath("~/Uploads/");
        string FilePath2 = FilePath + Upload.FileName;
        string ProdId = clsConnection.OneField("PPRODID", "PRODUCTREG WHERE PNAME='" + txtProdName.Text.Trim() + "'");
        Upload.PostedFile.SaveAs(FilePath + ProdId + "@" + Upload.FileName);
      //  hfCatid.Value = clsConnection.OneFieldWithCond("CATID", "CATEGORY", "WHERE CATEGORY='" + txtCatg.Text.Trim() + "'");
       // ScriptManager.RegisterStartupScript(this, this.GetType(), "key", "alert('Your product is registered under this '" + hfCatid.Value + "');", true);
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {

    }

    private void FillGrd()
    {
        dt = clsConnection.dtCondition("SELECT ID,PNAME,PDESC,PCATEGORYID FROM PRODUCTREG");
        grd.DataSource = dt;
        grd.DataBind();
    }

    protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        string var = e.CommandName.ToString();
        int rowIndex = ((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex;
        int index = Convert.ToInt32(grd.Rows[rowIndex].RowIndex);

        switch (var)
        {
            case "Edit":
                //hf1.Value = index.ToString();
                //hffield.Value = "Edit";
                break;
            case "Delete":
                //hf1.Value = index.ToString();
                //hffield.Value = "Delete";
                break;
        }
        //ShowData();
    }

    protected void grd_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
}