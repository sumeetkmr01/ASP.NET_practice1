<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frm_ProdCatgNew.aspx.cs" Inherits="frm_ProdCatgNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title></title>
</head>
<body>
    <form id="form1" runat="server">                        
  <div class="row">
            <div class="col-xl-6 col-md-offset-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" style="text-align: center">
                                            Product Category</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtCatg" runat="server" placeholder="Enter Product Category" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Enter Product Description" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <br />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  CssClass="btn btn-outline btn-success" Width="100px" />
                                                                </td>
                                                            </tr>

                                                        </table>


                                                    </div>
                                                    <%--  </form>--%>
                                                </div>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>                                               
    </form>
</body>
</html>
