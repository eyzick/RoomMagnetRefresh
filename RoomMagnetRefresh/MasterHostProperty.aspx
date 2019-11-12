<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostProperty.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <div class="container">
        <div class="row">
             <div class="col-md-4"><h2>Tell us about your property</h2></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2"><asp:CheckBox ID="cbAddress" runat="server" Text="*" ToolTip="Address is different than my current address" AutoPostBack="True" OnCheckedChanged="cbAddress_CheckedChanged" /></div>
            <div class="col-md-3"><asp:TextBox ID="tbAddress" runat="server" placeholder="Address" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
            <div class="col-md-3"><asp:TextBox ID="tbCity" runat="server" placeholder="City" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
            <div class="col-md-2"><asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" Enabled="False"></asp:DropDownList></div>
            <div class="col-md-2"><asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"><asp:TextBox ID="tbPrice" runat="server" placeholder="Price"></asp:TextBox></div>
            <div class="col-md-4"><asp:DropDownList ToolTip="Room Description" ID="DropDownList1" runat="server" CssClass="form-control">
                                    <asp:ListItem>Bedroom</asp:ListItem>
                                    <asp:ListItem>Basement</asp:ListItem>
                                    <asp:ListItem>Attic</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                  </asp:DropDownList>
            </div>
            <div class="col-md-4"><asp:TextBox ID="tbAvailability" runat="server" placeholder="Availability (Months)"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"><h4>Need to import pictures here</h4></div>
        </div>
        <div class="row">
            <asp:Button ID="btnList" runat="server" Text="List my property!" OnClick="btnList_Click" />
        </div>
    </div>
    
</asp:Content>

