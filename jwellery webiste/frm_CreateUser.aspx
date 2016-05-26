<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_CreateUser.aspx.cs" Inherits="frm_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Wrapper">
         <div class="row">            
              <div class="col-md-6">
                <div class="box box-primary" >                                
                  <div class="box-body">
                    <div class="form-group">
        <div class="row">
            <div class="col-md-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Create User 
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6">
                             <%--   <form role="form">--%>
                                    <div class="form-group" style="text-align:center">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter UserName" CssClass="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnSubmit" runat="server"  Text="Submit" OnClick="btnSubmit_Click" />
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
   </div></div></div></div></div>
</asp:Content>

