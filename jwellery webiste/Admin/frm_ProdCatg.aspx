﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_ProdCatg.aspx.cs" Inherits="Admin_frm_ProdCatg" EnableEventValidation="false"   %>

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
                                            Product Category</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                                                        <table>
                                                            <tr>
                                                                <td>m</td>
                                                            </tr>
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
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
          <div class="col-md-12">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
               <asp:GridView ID="grd" runat="server" CellPadding="4" ForeColor="#333333"  Width="600px" AutoGenerateColumns="False" OnRowEditing="grd_RowEditing" OnRowDeleting="grd_RowDeleting" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" OnRowUpdating="grd_RowUpdating" OnRowCancelingEdit="grd_RowCancelingEdit" >
                                                           <AlternatingRowStyle BackColor="White" />
                                                           <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                           <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                                           <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                                           <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                                           <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                                           <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                                           <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                                           <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                                           <SortedDescendingHeaderStyle BackColor="#820000" />
                                                          <Columns>
                                                              <asp:BoundField DataField="Category" HeaderText="Category" ></asp:BoundField> 
                                                              <asp:BoundField DataField="Description" HeaderText="Description" />
                                                              <asp:BoundField DataField="CatID" HeaderText="Category ID" ReadOnly="true" />  
                                                          </Columns>
                                                       </asp:GridView>

                                                    </div>
                                                    <%--  </form>--%>
                                                </div></div></div></div></div></div></div>
    </div>
</asp:Content>

