<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostSignUp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
     <br />
    <br />
    <br />

  <div class="container">
      <div class="row">
          <div class="col-md-6"><h2>Tell us about yourself</h2></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-3"><asp:TextBox ID="tbFirstName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbLastName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbDOB" runat="server" placeholder="Date of Birth" type="date" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbPhoneNumber" runat="server" placeholder="Phone Number" CssClass="form-control"></asp:textbox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-3"><asp:TextBox ID="tbAddress" runat="server" placeholder="Home Address" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbCity" runat="server" placeholder="City" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:DropDownList ID="ddState" runat="server" CssClass="form-control">
               <asp:ListItem>AL</asp:ListItem>
                <asp:ListItem>AK</asp:ListItem>
                <asp:ListItem>AZ</asp:ListItem>
                <asp:ListItem>AR</asp:ListItem>
                <asp:ListItem>CA</asp:ListItem>
                <asp:ListItem>CO</asp:ListItem>
                <asp:ListItem>CT</asp:ListItem>
                <asp:ListItem>DE</asp:ListItem>
                <asp:ListItem>FL</asp:ListItem>
                <asp:ListItem>GA</asp:ListItem>
                <asp:ListItem>HI</asp:ListItem>
                <asp:ListItem>ID</asp:ListItem>
                <asp:ListItem>IL</asp:ListItem>
                <asp:ListItem>IN</asp:ListItem>
                <asp:ListItem>IA</asp:ListItem>
                <asp:ListItem>KS</asp:ListItem>
                <asp:ListItem>KY</asp:ListItem>
                <asp:ListItem>LA</asp:ListItem>
                <asp:ListItem>ME</asp:ListItem>
                <asp:ListItem>MD</asp:ListItem>
                <asp:ListItem>MA</asp:ListItem>
                <asp:ListItem>MI</asp:ListItem>
                <asp:ListItem>MN</asp:ListItem>
                <asp:ListItem>MS</asp:ListItem>
                <asp:ListItem>MO</asp:ListItem>
                <asp:ListItem>MT</asp:ListItem>
                <asp:ListItem>NE</asp:ListItem>
                <asp:ListItem>NV</asp:ListItem>
                <asp:ListItem>NH</asp:ListItem>
                <asp:ListItem>NJ</asp:ListItem>
                <asp:ListItem>NM</asp:ListItem>
                <asp:ListItem>NY</asp:ListItem>
                <asp:ListItem>NC</asp:ListItem>
                <asp:ListItem>ND</asp:ListItem>
                <asp:ListItem>OH</asp:ListItem>
                <asp:ListItem>OK</asp:ListItem>
                <asp:ListItem>OR</asp:ListItem>
                <asp:ListItem>PA</asp:ListItem>
                <asp:ListItem>RI</asp:ListItem>
                <asp:ListItem>SC</asp:ListItem>
                <asp:ListItem>SD</asp:ListItem>
                <asp:ListItem>TN</asp:ListItem>
                <asp:ListItem>TX</asp:ListItem>
                <asp:ListItem>UT</asp:ListItem>
                <asp:ListItem>VT</asp:ListItem>
                <asp:ListItem>VA</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>WV</asp:ListItem>
                <asp:ListItem>WI</asp:ListItem>
                <asp:ListItem>WY</asp:ListItem>
                                </asp:DropDownList></div>
          <div class="col-md-3"><asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode" CssClass="form-control"></asp:TextBox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-4"><asp:Button ID="btnNext" runat="server" Text="Next Step" OnClick="btnNext_Click" /></div>
          <div class="col-md-4"></div>
      </div>
  </div>
</asp:Content>

