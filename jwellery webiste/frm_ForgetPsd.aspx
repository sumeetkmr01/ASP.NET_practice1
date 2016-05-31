<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_ForgetPsd.aspx.cs" Inherits="frm_ForgetPsd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Wrapper">
        <div class="row">
            <div class="col-xl-6 col-md-offset-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="panel panel-default">
                                        <div class="panel-heading" style="text-align: center">
                                            Forget Password</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Name" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtOldPsd" runat="server" placeholder="Enter UserName" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtNewPsd" runat="server" placeholder="Enter Password" TextMode="Password" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                              <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtConfirmPsd" runat="server" placeholder="Enter Password" TextMode="Password" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: center">
                                                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-outline btn-success" Width="100px" />
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
    </div>
</asp:Content>

