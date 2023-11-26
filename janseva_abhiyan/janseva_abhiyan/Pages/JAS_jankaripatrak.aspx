<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JAS_jankaripatrak.aspx.cs" Inherits="janseva_abhiyan.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>जनसेवा अभियान 2.0</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
    <h1>जनसेवा अभियान 2.0</h1>
         <h3>जानकारी पत्रक</h3>
    <div onsubmit="return validateForm()">
      <div class="form-group">
        <label for="name">District</label>
        <%--<input type="text" class="form-control" id="name" placeholder="Enter your name" required pattern="[A-Za-z\s]+" title="Please enter valid characters only (letters and spaces).">--%>
           <asp:DropDownList CssClass="form-control" ID="ddldistrict" ToolTip="जिला चुनें "
                DataValueField="id" DataTextField="district" runat="server">
                <asp:ListItem Value="-1" Text="Select" Selected="True"></asp:ListItem>
            </asp:DropDownList>
              <asp:RequiredFieldValidator ID="districtrfv" runat="server" ControlToValidate="ddldistrict"
                  SetFocusOnError="true" ErrorMessage="District is required" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
      </div>
      <div class="form-group">
          <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
      </div>
      <div class="form-group">
          <br />
          <asp:GridView ID="GridView1" runat="server">
          </asp:GridView>


      </div>
     </div>     
     </div>
</asp:Content>
