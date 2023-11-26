<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JSAhome.aspx.cs" Inherits="janseva_abhiyan.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    /* Optional custom CSS for centering the login button */
    .center-container {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 15vh;
    }
    .center-container1 {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 20vh;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container center-container">
    
        <asp:Button ID="Button1" CssClass="btn btn-primary" OnClick="Button1_Click" runat="server" Text="Registation" />
  </div>
    <div class="container center-container1">
   <asp:Button ID="Button2" CssClass="btn btn-primary" OnClick="Button2_Click" runat="server" Text="Login" />
  </div>
</asp:Content>
