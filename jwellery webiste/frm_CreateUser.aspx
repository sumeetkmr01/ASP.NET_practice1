<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_CreateUser.aspx.cs" Inherits="frm_CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="Container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Create User </h3>
                    </div>
                    <div class="panel-body">
                       
                            <fieldset>
                            <div class="form-group">                                
                                            <asp:TextBox ID="txtName" runat="server" placeholder="Enter Name" CssClass="form-control" ></asp:TextBox>
                                        </div>
                                       <div class="form-group">    
                                            <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter UserName" CssClass="form-control" ></asp:TextBox>
                                            <br />
                                         </div>
                                      <div class="form-group">    
                                            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                           </div>

                                 <div class="form-group">
                      </div>
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-lg btn-success btn-block"  />
                                        </fieldset>
                          


                            </div>
                       
            </div>
                </div>
        </div>
    </div>                
</asp:Content>

