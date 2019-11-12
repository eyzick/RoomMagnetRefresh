<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterTenantSignUpFinal.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <br />
    <br />
    <br />

    <div class="container">
        <h4>Thanks for filling out our survey! Let's finish setting up your account!</h4>
        <br />
        <br />
        <div class="row">
            <div class="col-md-6"><asp:TextBox ID="tbEmail" runat="server" placeholder="Email Address"></asp:TextBox></div>
            <div class="col-md-6"><asp:TextBox ID="tbEmailConfirm" runat="server" placeholder="Confirm Email"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-6"><asp:TextBox ID="tbPassword" runat="server" placeholder="Password" type="password"></asp:TextBox></div>
            <div class="col-md-6"><asp:TextBox ID="tbPasswordConfirm" runat="server" placeholder="Confirm Password" type="password"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12"><asp:Button ID="btnNext" runat="server" Text="Get Started!" OnClick="btnNext_Click" /></div>
        </div>
    </div>
</asp:Content>

