<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JSAregistration.aspx.cs" Inherits="janseva_abhiyan.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Registration</title>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="container">
    <h1>Registration</h1>
    <div onsubmit="return validateForm()">
      <div class="form-group">
        <label for="name">Name</label>
        <%--<input type="text" class="form-control" id="name" placeholder="Enter your name" required pattern="[A-Za-z\s]+" title="Please enter valid characters only (letters and spaces).">--%>
          <asp:TextBox ID="txtname" CssClass="form-control" placeholder="Enter your name" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" title="Please enter valid characters only (letters and spaces)." runat="server"></asp:TextBox>
          <asp:RegularExpressionValidator ID="NameValidator" runat="server"
              ControlToValidate="txtname"
              ValidationExpression="[A-Za-z\s]+"
              ErrorMessage="Please enter only letters and spaces"
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RegularExpressionValidator>
          <asp:RequiredFieldValidator ID="namerequirevalidator" runat="server"
              ControlToValidate="txtname"
              ErrorMessage="Name is required."
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RequiredFieldValidator>
        <%--<div class="invalid-feedback">Please enter a valid name.</div>--%>
      </div>
      <div class="form-group">
        <label for="email">Email address</label>
        <%--<input type="email" class="form-control" id="email" placeholder="Enter your email" required>--%>
          <asp:TextBox ID="txtemail" CssClass="form-control" placeholder="Enter your email"
              onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" 
              title="Enter your email" runat="server"></asp:TextBox>
          <asp:RegularExpressionValidator ID="email" runat="server"
              ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
              ControlToValidate="txtemail"
              ErrorMessage="Email address should be end with @Domain Name"
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RegularExpressionValidator>
          <asp:RequiredFieldValidator ID="emailrequirevalidator" runat="server"
              ControlToValidate="txtemail"
              ErrorMessage="Emial Id is required."
              Display="Dynamic"
              SetFocusOnError="true">
</asp:RequiredFieldValidator>
        <%--<div class="invalid-feedback">Please enter a valid email address.</div>--%>
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <%--<input type="password" class="form-control" id="password" placeholder="Enter your password" required>--%>
          <asp:TextBox ID="txtpassword" CssClass="form-control" placeholder="Enter your Password"
              onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" 
              title="Enter your Password" runat="server" TextMode="Password"></asp:TextBox>
          <%--<asp:RangeValidator ID="PasswordValidator" runat="server"
              ControlToValidate="txtpassword"
              ErrorMessage="Password must be between 8 and 12 characters long."
              MinimumValue="8" MaximumValue="12"
              Type="Integer"
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RangeValidator>--%>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
              ControlToValidate="txtpassword"
              ErrorMessage="Password must contain at least 8 characters including at least one uppercase letter, one lowercase letter, and one digit."
              ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{6,}$"
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RegularExpressionValidator>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
              ControlToValidate="txtpassword"
              ErrorMessage="Password is required."
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RequiredFieldValidator>

          <%--<div class="invalid-feedback">Please enter a password.</div>--%>
      </div>
          <div class="form-group">
        <label for="confirm-password">Confirm Password</label>
        <%--<input type="password" class="form-control" id="confirm-password" placeholder="Confirm your password" required>--%>
              <asp:TextBox ID="txtconfirmpassword" CssClass="form-control" placeholder="Enter your Matching Password"
              onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" 
              title="Enter your Matching Password" runat="server" TextMode="Password"></asp:TextBox>
              <asp:CompareValidator ID="ConfirmPasswordValidator" runat="server"
                  ControlToValidate="txtconfirmpassword"
                  ControlToCompare="txtpassword"
                  ErrorMessage="The password and confirm password do not match."
                  Type="String"
                  Operator="Equal"
                  Display="Dynamic"
                  SetFocusOnError="true">
              </asp:CompareValidator>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
              ControlToValidate="txtconfirmpassword"
              ErrorMessage="Confirm Password is required."
              Display="Dynamic"
              SetFocusOnError="true">
          </asp:RequiredFieldValidator>
        <%--<div class="invalid-feedback">Passwords do not match.</div>--%>
      </div>
      <%--<button type="submit" class="btn btn-primary">Register</button>--%>
        <asp:Button ID="btnsubmit" OnClick="btnsubmit_Click" CssClass="btn btn-primary" runat="server" Text="Register" />
    </div>
  </div>

 
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
   <script>
    function validateForm() {
      var nameInput = document.getElementById('txtname');
      var passwordInput = document.getElementById('txtpassword');
      var confirmPasswordInput = document.getElementById('confirm-password');
      
      // Check if the name contains only letters and spaces
      if (!nameInput.value.match(/^[A-Za-z\s]+$/)) {
        nameInput.classList.add('is-invalid');
        return false;
      }
      
      // Check if the passwords match
      if (passwordInput.value !== confirmPasswordInput.value) {
        confirmPasswordInput.classList.add('is-invalid');
        return false;
      }
      
      return true;
    }
  </script>
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
