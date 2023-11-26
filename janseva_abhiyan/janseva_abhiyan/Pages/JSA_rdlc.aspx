<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JSA_rdlc.aspx.cs" Inherits="janseva_abhiyan.JSA_rdlc" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
          
          <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Button" OnClick="Button2_Click" />
          <asp:ScriptManager ID="ScriptManager1" runat="server">
          </asp:ScriptManager>
      </div>
      <div class="form-group">
          <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226">
              <LocalReport ReportPath="jsareport.rdlc">
                  <DataSources>
                      <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                  </DataSources>
              </LocalReport>
          </rsweb:ReportViewer>
          <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="janseva_abhiyan.DataSet1TableAdapters."></asp:ObjectDataSource>
          <br />

      </div>
     </div>     
     </div>

    </form>
</body>
</html>
