<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="frm_ProdReg.aspx.cs" Inherits="Admin_frm_ProdReg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function submitFile() {
            $("#<%=btnUpload.ClientID%>").click();
        };
    </script>
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
                                            Product Registration</div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtProdName" runat="server" placeholder="Enter Product Name" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtDescription" runat="server" placeholder="Enter Description" CssClass="form-control" Style="text-align: center" Width="420px"></asp:TextBox>
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align:center">
                                                                    <asp:DropDownList ID="cmdCatg" runat="server" CssClass="form-control"></asp:DropDownList><br />
                                                                </td>
                                                            </tr>
                                                             <tr>
                                                                <td style="text-align:center">
                                                                    <asp:FileUpload ID="Upload" runat="server" onchange="submitFile()"/><br />
                                                                    <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Visible="false" />
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
            <div class="col-xl-6 col-md-offset-4">
                <div class="box box-primary">
                    <div class="box-body">
                        <div class="form-group">
                            <div class="row">
          <div class="col-md-12">
                                                    <%--   <form role="form">--%>
                                                    <div class="form-group">
               <asp:GridView ID="grd" runat="server" CellPadding="4" ForeColor="#333333"  Width="600px" AutoGenerateColumns="False" OnRowCommand="grd_RowCommand" OnRowEditing="grd_RowEditing" OnRowDeleting="grd_RowDeleting">
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
                                                              <asp:BoundField DataField="PNAME" HeaderText="Product Name" ></asp:BoundField> 
                                                              <asp:BoundField DataField="PDESC" HeaderText="Description" />
                                                              <asp:BoundField DataField="PCATEGORYID" HeaderText="Product Category ID" />
                                                              <asp:BoundField DataField="PPRODID" HeaderText="Product ID" />
                                                           
                                                              <asp:ImageField DataImageUrlField="PPIC" HeaderText="Product Image"  >
                                                                  <ControlStyle Height="150px" Width="150px" />
                                                              </asp:ImageField>
                                                              <asp:TemplateField>
                                                                  <HeaderTemplate >Edit</HeaderTemplate>
                                                                  <ItemStyle Width="50px" />
                                                                  <ItemTemplate >
                                                                      <asp:Button ID="btnEdit"  runat="server" Text="Edit" Width="50px"  CommandName="Edit" />  
                                                                  </ItemTemplate>
                                                              </asp:TemplateField>
                                                              <asp:TemplateField>
                                                                  <HeaderTemplate >Delete</HeaderTemplate>
                                                                  <ItemStyle Width="50px" />
                                                                  <ItemTemplate >
                                                                      <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="50px"  CommandName="Delete"/>
                                                                  </ItemTemplate>
                                                              </asp:TemplateField>
                                                             
                                                          </Columns>
                                                       </asp:GridView>

                                                    </div>
                                                    <%--  </form>--%>
                                                </div></div></div></div></div></div></div>
         <asp:HiddenField ID="hffield" runat="server" />
         <asp:HiddenField ID="hf1" runat="server" />
         <asp:HiddenField ID="hfId" runat="server" />
          <asp:HiddenField ID="hfProdId" runat="server" />
          <asp:HiddenField ID="hfPPIC" runat="server" />
    </div>
</asp:Content>

