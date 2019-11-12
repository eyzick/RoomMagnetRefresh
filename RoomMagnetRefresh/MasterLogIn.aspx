<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterLogIn.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <h2>Log In</h2>
            </div>  
            <br />
            <br />
            <div class="col-md-4"></div>  
        </div>
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4"><asp:TextBox ID="tbEmail" runat="server" placeholder="Email Address" CssClass="form-control"></asp:TextBox></div>
            <div class="col-lg-4"></div>  
        </div>
        <br />
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4"><asp:TextBox ID="tbPassword" runat="server" placeholder="Password" type="password" CssClass="form-control"></asp:TextBox></div>
            <div class="col-lg-4"></div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4"><asp:Button ID="btnLogIn" runat="server" Text="Log In" CssClass="form-control" /></div>
        </div>
    </div>
</asp:Content>

