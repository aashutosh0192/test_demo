<%@ Page Title="" Language="C#" MasterPageFile="~/janseva_abhiyan.Master" AutoEventWireup="true" CodeBehind="JSAjankaribharen.aspx.cs" Inherits="janseva_abhiyan.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <h1>जानकारी भरें </h1>
    <div runat="server">
          <div class="form-group">
            <label for="ddldistrict">जिला </label>
            <%--<input type="text" class="form-control" id="txtName" runat="server" />--%>
            <asp:DropDownList CssClass="form-control" ID="ddldistrict" ToolTip="जिला चुनें "
                DataValueField="id" DataTextField="district" runat="server">
                <asp:ListItem Value="-1" Text="Select" Selected="True"></asp:ListItem>
            </asp:DropDownList>
              <asp:RequiredFieldValidator ID="districtrfv" runat="server" ControlToValidate="ddldistrict"
                  SetFocusOnError="true" ErrorMessage="District is required" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="ddlpanchayat">पंचायत  </label>
            <asp:DropDownList ID="ddlpanchayat" CssClass="form-control" ToolTip="पंचायत चुनें "
                DataValueField="id" DataTextField="panchayat" runat="server">
                <asp:ListItem Value="-1" Text="Select Panchayat" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="panchayatrfv" runat="server" ControlToValidate="ddlpanchayat"
                  SetFocusOnError="true" ErrorMessage="Panchayat is required" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        
        <div class="form-group">
            <label for="txtName">भ्रमण दिनांक :</label>
            <%--<input type="text" class="form-control" id="Text1" runat="server" />--%>
            <asp:TextBox ID="txtbhramandate" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="bhranadatRFV" runat="server" ControlToValidate="txtbhramandate"
                  SetFocusOnError="true" ErrorMessage="Braman Date is required" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="ddldays">Days:</label>
             <asp:DropDownList ID="ddldays1" CssClass="form-control" ToolTip="please select day"
                DataValueField="id" DataTextField="days" runat="server">
                <asp:ListItem Value="-1" Text="Select Panchayat" Selected="True"></asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="daysRFV" runat="server" ControlToValidate="ddldays1"
                  SetFocusOnError="true" ErrorMessage="day is required" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="shivir_radiobutton">शिविर की स्थिति:- </label>
            <asp:RadioButtonList ID="shivir_radiobutton" CssClass="form-control" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem Text="functioninf" Value="1"></asp:ListItem>
                <asp:ListItem Text="not functioning" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="shivir_radiobutton_rfvOptions" runat="server"
                ControlToValidate="shivir_radiobutton"
                ErrorMessage="Please select an option."
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RequiredFieldValidator>
            </div>
        <div class="form-group">
            <label for="txtemp">शिविर में सेवारत कर्मचारियों की संख्या</label>
            <asp:TextBox ID="txttotalemp" placeholder="कुल कर्मचारी" Enabled="false" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:TextBox ID="txtpresentemp" placeholder="उपस्थित कर्मचारी" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="preserntREV1" runat="server" ControlToValidate="txtpresentemp"
                ErrorMessage="Please enter a valid integer value."
                ValidationExpression="^[0-9]+$"
                Display="Dynamic"
                SetFocusOnError="true"
                ></asp:RegularExpressionValidator>
            <%--<asp:RequiredFieldValidator ID="presentRFV" runat="server" ControlToValidate="txtpresentemp"
                  ErrorMessage="Presented Employees are require" Display="Dynamic" CssClass="error-message"SetFocusOnError="true">
             </asp:RequiredFieldValidator>--%>
            <asp:TextBox ID="txtabsentemp" placeholder="अनुपस्थित कर्मचारी" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="absentREV" runat="server"
                ControlToValidate="txtabsentemp" SetFocusOnError="true" 
                ErrorMessage="Please enter a valid integer value."
                ValidationExpression="^[0-9]+$"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="absentRFV" runat="server" ControlToValidate="txtabsentemp"
                  ErrorMessage="Absent Employees are require" Display="Dynamic" CssClass="error-message" SetFocusOnError="true">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtemp">अनुपस्थित कर्मचारीयो का विवरण </label>
            <asp:TextBox ID="txtempname" placeholder="नाम" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="empnameREV" runat="server"
                ControlToValidate="txtempname"
                ErrorMessage="Please enter alphabetic characters only."
                ValidationExpression="^[a-zA-Z]+$"
                Display="Dynamic"
                SetFocusOnError="true">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="empnameRFV" runat="server" ControlToValidate="txtempname"
                  ErrorMessage="Please Enter Employees Name" SetFocusOnError="true" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
            <asp:TextBox ID="txtemppost" placeholder="पदनाम" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="emppostREV" runat="server"
                ControlToValidate="txtemppost"
                ErrorMessage="Please enter alphabetic characters only."
                ValidationExpression="^[a-zA-Z]+$"
                SetFocusOnError="true"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="emppostRFV" SetFocusOnError="true" runat="server" 
                ControlToValidate="txtemppost"
                  ErrorMessage="Please Enter Employees Post" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label for="txtemp">भ्रमण दिनांक को शिविर में प्राप्त आवेदनों की संख्या  </label>
            <asp:TextBox ID="txtsolvedapplication" placeholder="निराकृत " onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
             <asp:RegularExpressionValidator ID="solvedREV" runat="server"
                ControlToValidate="txtsolvedapplication" SetFocusOnError="true"
                ErrorMessage="Please enter a valid integer value."
                ValidationExpression="^[0-9]+$"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="solvedRFV" runat="server" ControlToValidate="txtsolvedapplication"
                  ErrorMessage="Please Enter Presnt Employee" SetFocusOnError="true" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
            <asp:TextBox ID="txtpendingapplication" placeholder="लंबित" onfocus="ClearPlaceholder(this)" onblur="RestorePlaceholder(this)" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="pendingREV" SetFocusOnError="true" runat="server"
                ControlToValidate="txtpendingapplication"
                ErrorMessage="Please enter a valid integer value."
                ValidationExpression="^[0-9]+$"
                Display="Dynamic">
            </asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="pendingRFV" runat="server" ControlToValidate="txtpendingapplication"
                  ErrorMessage="Please Enter Absent Employee" SetFocusOnError="true" Display="Dynamic" CssClass="error-message">
              </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <asp:Button ID="Button1" runat="server" CssClass="form-control" OnClick="Button1_Click" Text="Submit" />
            
        </div>
        <div class="form-group">
            <asp:Label ID="lbtoutput" CssClass="form-control" runat="server" Text="Label"></asp:Label>
        </div>
      
        <%--<asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />--%>
    </div>
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
    <script type="text/javascript">
    $(document).ready(function () {
        $('#<%=txtpresentemp.ClientID %>, #<%=txtabsentemp.ClientID %>').on('input', function () {
            var num1 = parseInt($('#<%=txtpresentemp.ClientID %>').val()) || 0;
            var num2 = parseInt($('#<%=txtabsentemp.ClientID %>').val()) || 0;
            var sum = num1 + num2;
            $('#<%=txttotalemp.ClientID %>').val(sum);
        });
    });
</script>
    
</asp:Content>
