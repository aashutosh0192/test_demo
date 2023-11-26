<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JSAlogin.aspx.cs" Inherits="janseva_abhiyan.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <title>Registration</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
    <h1>Login</h1>
    
      <div class="form-group">
        <label for="email">Email address</label>
        <%--<input type="email" class="form-control" id="email" placeholder="Enter your email">--%>
          <asp:TextBox ID="txtloginID" CssClass="form-control" placeholder="Enter your Login ID" 
              onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)"
              title="Please enter valid your Login ID." runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="UsernameValidator" runat="server"
              ControlToValidate="txtloginID"
              ErrorMessage="LogId is required."
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="EmailValidator" runat="server"
              ControlToValidate="txtloginID"
              ErrorMessage="Invalid LoginId, Your loginId must be your email address."
              ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RegularExpressionValidator>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <%--<input type="password" class="form-control" id="password" placeholder="Enter your password">--%>
           <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter your Password" 
              onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)"
              title="Please enter valid your Password." runat="server" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
              ControlToValidate="txtPassword"
              ErrorMessage="Password is required."
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RequiredFieldValidator>
      </div>
      <%--<button type="submit" class="btn btn-primary">Login</button>--%>
         <asp:Button ID="btnlogin" CssClass="btn btn-primary" OnClick="btnlogin_Click" runat="server" Text="LogIn" />
    
    <p class="mt-3">Don't have an account? <a href="JSAregistration.aspx">Register here</a></p>
  </div>

     <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

     <script>
        function ClearPlaceholder(textBox) {
            if (textBox.value === textBox.getAttribute('placeholder')) {
                textBox.value = '';
            }
        }

        function RestorePlaceholder(textBox) {
            if (textBox.value === '') {
                textBox.value = textBox.getAttribute('placeholder');
            }
        }
     </script>
    
  
</asp:Content>
