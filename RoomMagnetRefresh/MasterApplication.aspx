<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterApplication.aspx.cs" Inherits="MasterApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Personal Information</h2>
    &nbsp;&nbsp;&nbsp;
    <label>First Name</label>
    <asp:TextBox runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>Last Name</label>
    <asp:TextBox runat="server" ID="TextBox8"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Date of Birth
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;
    Phone Number
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Email
    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;
    Home Address
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; City
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; State
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Zip
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <h2>Emergency Contacts</h2>
    &nbsp;&nbsp;&nbsp;
    <label>First Name</label>
    <asp:TextBox runat="server" ID="TextBox15"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>Last Name</label>
    <asp:TextBox runat="server" ID="TextBox16"></asp:TextBox>
    &nbsp;<br />
&nbsp;&nbsp; Relationship&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone Number
    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Email
    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
    <br />
    <br />
    &nbsp;&nbsp;
    Home Address
    <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; City
    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; State
    <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Zip
    <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
    <br />
    <br />
    <br />
    <h2>Vehicle Information</h2>
    
    Year
    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Make
    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Model
    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
    <br />
    Color
    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; License Plate Number
    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; State
    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    <br />

    

</asp:Content>

