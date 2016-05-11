<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">        
         <%: Scripts.Render("~/bundles/jquery") %>
         <%: Styles.Render("~/bundles/css") %>
    </asp:PlaceHolder>
   
    <title></title>
</head>
<body>
    <div class="Container">
<form id="form1" runat="server">
    <div class="row">
       <div class="col-md-4 col-md-offset-4">
           <div class="login-panel panel-default">
               <div class="panel-heading">
                   <h3 class="panel-title" style="text-align:center">Please Sign In</h3>
              </div>
                <div class="panel-body">
                   <form role="form">
                  <fieldset>
                   <div class="form-group">
                  <input class="form-control" placeholder="E-mail" name="Email" type="email" />
               </div>
                      <div class="form-group">
                          <input class="form-control" placeholder="Password" type="password" name="Password"/>
                      </div>
                      <div class="checkbox">
                           <label>
                          <input type="checkbox" name="Remember"  value="Remembeer Me" />Remember Me
                     </label>
                                </div>
                       <button type="button" style="text-align:center" class="btn btn-lg btn-success btn-block"" >Submit</button>
                      <div class="form-group">
                         
                      </div>
                       </fieldset>
              </form>
                </div>   
              
           </div>
       </div>
    </div>
    </form>
    </div>
    
</body>
</html>
