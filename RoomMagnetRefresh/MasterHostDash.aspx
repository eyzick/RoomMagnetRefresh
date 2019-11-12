<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostDash.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <br />
    <br />
    <br />

    <div class="container">
    <div class="row">
        <div class ="col-sm-4"><asp:Label ID="lblFirstNameDash" runat="server" Text="FirstName's Dashboard" CssClass="h2"></asp:Label></div>
        <div class="col-sm-4"></div>
        <div class ="col-sm-2"><asp:Button ID="btnApplicants" runat="server" Text="View Applicants"  /></div>
        <div class="col-sm-2"><asp:Button ID="btnLogOut" runat="server" Text="Log Out" /></div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-sm-2"><h4>Your Profile</h4></div>
        <div class="col-sm-2"></div>
        <div class="col-sm-2"><asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" /></div>

        <div class="col-xs-4"><h4>Your Properties:</h4></div>
        
    </div>

    <div class="row"> <%--Figure out how to make this grey--%>
        <div class="col-sm-4"><p><img class="img" src="Content/img/default.png" style="width=auto; height:300px;" /></p><br /><h4>Background Check Status:</h4>
        </div>
        <div class="col-sm-2"><asp:Label ID="lblFullName" runat="server" Text="lblFullName" CssClass="h4"></asp:Label>
          <p> <asp:Label ID="lblEmail" runat="server" Text="lblEmail" CssClass="h6"></asp:Label></p>
            <p><asp:Label ID="lblPhoneNumber" runat="server" Text="lblPhoneNumber" CssClass="h6"></asp:Label></p>       
        </div>  
        <div class="col-sm-6"><br /><br /><br /><h4>Message Center</h4></div>
    </div>
    </div>
   
</asp:Content>

