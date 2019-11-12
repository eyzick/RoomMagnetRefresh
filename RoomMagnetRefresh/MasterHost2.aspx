<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHost2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
     <br />
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-md-4">
            <h2>Tell us how you like to live</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h4>Do you have pets?</h4>
                <asp:RadioButtonList ID="rbPets" runat="server" >
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Do you have a spare bathroom?</h4>
                <asp:RadioButtonList ID="rbBathroom" runat="server">
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Is there alcohol in your household?</h4>
                <asp:RadioButtonList ID="rbDrink" runat="server">
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> No, but I don't mind drinking</asp:ListItem>
                    <asp:ListItem> No</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4">
                <h4>What time do you usually go to bed?</h4>
                 <asp:RadioButtonList ID="rbBed" runat="server">
                    <asp:ListItem> Before 10pm</asp:ListItem>
                    <asp:ListItem> Between 11pm-Midnight</asp:ListItem>
                    <asp:ListItem> After Midnight</asp:ListItem>
                    <asp:ListItem> It varies from day to day!</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>How clean do you keep your household?</h4>
                <asp:RadioButtonList ID="rbClean" runat="server">
                    <asp:ListItem> Spotless</asp:ListItem>
                    <asp:ListItem> Some clutter here and there</asp:ListItem>
                    <asp:ListItem> I don't mind clutter at all</asp:ListItem>
                    <asp:ListItem> Cleanliness is not my speciality.</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Do you have a preference for who lives with you?</h4>
                <asp:RadioButtonList ID="rbStatus" runat="server">
                    <asp:ListItem> Undergrad students</asp:ListItem>
                    <asp:ListItem> Graduate students</asp:ListItem>
                    <asp:ListItem> Summer interns</asp:ListItem>
                    <asp:ListItem> Adults</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnNextPage" runat="server" Text="Next Page" /></div>
        </div>
        
        <br />
    </div>
</asp:Content>

