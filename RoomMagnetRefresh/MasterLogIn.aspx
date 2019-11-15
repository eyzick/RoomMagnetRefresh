<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterLogIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <div class="container">
       <div class="form-group">
           <label for ="tbEmail">Email</label>
           <asp:TextBox id="tbEmail" runat="server" placeholder="Email Address" CssClass="form-control"></asp:TextBox>
       </div>
        <div class="form-group">
            <label for ="tbPassword">Password</label>
            <asp:TextBox id="tbPassword" CssClass="form-control" placeholder="Password" type="password" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button id="btnLogIn" runat="server" Text="Log In" CssClass="btn-primary" OnClick="btnLogIn_Click" />
            <asp:Button  id="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" />
        </div>
    </div>
</asp:Content>

