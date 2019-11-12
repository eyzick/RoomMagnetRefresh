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
          <div class="col-md-3"><asp:TextBox ID="tbFirstName" runat="server" placeholder="First Name"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbLastName" runat="server" placeholder="Last Name"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbDOB" runat="server" placeholder="Date of Birth"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbPhoneNumber" runat="server" placeholder="Phone Number"></asp:textbox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-4"><asp:TextBox ID="tbAddress" runat="server" placeholder="Home Address"></asp:TextBox></div>
          <div class="col-md-4"><asp:TextBox ID="tbCity" runat="server" placeholder="City"></asp:TextBox></div>
          <div class="col-md-2"><asp:DropDownList ID="ddState" runat="server"></asp:DropDownList></div>
          <div class="col-md-2"><asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode"></asp:TextBox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-4"><asp:Button ID="btnNext" runat="server" Text="Next Step" OnClick="btnNext_Click" /></div>
      </div>
  </div>
</asp:Content>

