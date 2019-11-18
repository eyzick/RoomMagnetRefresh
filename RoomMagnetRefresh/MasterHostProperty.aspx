<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostProperty.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">
             <div class="col-md-4"><h2>Tell us about your property</h2></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2"><asp:CheckBox ID="cbAddress" runat="server" Text="*" ToolTip="Address is different than my current address" AutoPostBack="True" OnCheckedChanged="cbAddress_CheckedChanged" /></div>
            <div class="col-md-3"><asp:TextBox ID="tbAddress" runat="server" placeholder="Address" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
            <div class="col-md-3"><asp:TextBox ID="tbCity" runat="server" placeholder="City" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
            <div class="col-md-2"><asp:DropDownList ID="ddState" runat="server" AutoPostBack="True" Enabled="False">
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
            <div class="col-md-2"><asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode" AutoPostBack="True" Enabled="False"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"><asp:TextBox ID="tbPrice" runat="server" placeholder="Price"></asp:TextBox></div>
            <div class="col-md-4"><asp:DropDownList ToolTip="Room Description" ID="ddRoomType" runat="server" CssClass="form-control">
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
            <div class="col-md-4"><asp:FileUpload runat="server" Style="display: block" accept=".png,.jpg,.jpeg" ID="firstUploader"></asp:FileUpload></div>
        </div>
        <div class="row">
            <asp:Button ID="btnList" runat="server" Text="List my property!" OnClick="btnList_Click" />
        </div>
    </div>
    
</asp:Content>

