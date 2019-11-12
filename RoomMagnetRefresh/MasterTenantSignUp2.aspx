<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterTenantSignUp2.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
     <br />
    <br />
    <br />

    <div class="container">
        <div class="row">
            <div class="col-md-12"><h2>Help us get to know you a little better</h2></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h4>Are you OK with living with pets?</h4>
                <asp:RadioButtonList ID="rbPets" runat="server">
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> No</asp:ListItem>
                    <asp:ListItem> No Preference</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Do you need your own bathroom?</h4>
                <asp:RadioButtonList ID="rbBathroom" runat="server">
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> No</asp:ListItem>
                    <asp:ListItem> No Preference</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Do you drink alcohol?</h4>
                <asp:RadioButtonList ID="rbDrink" runat="server">
                    <asp:ListItem> Yes</asp:ListItem>
                    <asp:ListItem> On occasion</asp:ListItem>
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
                <h4>Would you consider yourself a clean person? (We don't judge)</h4>
                <asp:RadioButtonList ID="rbClean" runat="server">
                    <asp:ListItem> Yes! I keep my room spotless.</asp:ListItem>
                    <asp:ListItem> My room can be messy, but I always do the dishes.</asp:ListItem>
                    <asp:ListItem> Sometimes I push cleaning off to a later time.</asp:ListItem>
                    <asp:ListItem> Cleanliness is not my speciality.</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-md-4">
                <h4>Why are you looking to rent a space at this time?</h4>
                <asp:RadioButtonList ID="rbStatus" runat="server">
                    <asp:ListItem> I am currently pursuing my undergraduate degree!</asp:ListItem>
                    <asp:ListItem> I am a graduate student!</asp:ListItem>
                    <asp:ListItem> I am interning in the area for a few months.</asp:ListItem>
                    <asp:ListItem> I recently relocated and need somewhere to stay.</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnNextPage" runat="server" Text="Next Page" /></div>
        </div>
        

    <br />
    <br />
    
    </div>

</asp:Content>

