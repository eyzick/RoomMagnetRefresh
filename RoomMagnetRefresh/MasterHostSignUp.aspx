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
          <div class="col-md-3"><asp:TextBox ID="tbDOB" runat="server" placeholder="Date of Birth" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbPhoneNumber" runat="server" placeholder="Phone Number" CssClass="form-control"></asp:textbox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-3"><asp:TextBox ID="tbAddress" runat="server" placeholder="Home Address" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:TextBox ID="tbCity" runat="server" placeholder="City" CssClass="form-control"></asp:TextBox></div>
          <div class="col-md-3"><asp:DropDownList ID="ddState" runat="server" CssClass="form-control"></asp:DropDownList></div>
          <div class="col-md-3"><asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode" CssClass="form-control"></asp:TextBox></div>
      </div>

      <br />
      <br />

      <div class="row">
          <div class="col-md-4"><asp:Button ID="btnNext" runat="server" Text="Next Step" OnClick="btnNext_Click" /></div>
      </div>
  </div>
</asp:Content>

