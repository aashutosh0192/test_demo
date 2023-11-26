<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JSA_Patrak_bhare.aspx.cs" Inherits="janseva_abhiyan.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1>Login</h1>
    
      <div class="form-group">
        <label for="email">Jankari Form</label>
          <asp:Button ID="Button1" OnClick="Button1_Click" CssClass="form-control" runat="server" Text="Jankari Bharen - Form" />
      </div>
      <div class="form-group">
        <label for="password">Jankari Patrak</label>
        <asp:Button ID="Button2" OnClick="Button2_Click" CssClass="form-control" runat="server" Text="Jankari Patrak" />
      </div>
        </div>
</asp:Content>
