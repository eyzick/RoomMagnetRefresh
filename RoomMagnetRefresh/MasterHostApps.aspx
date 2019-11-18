<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostApps.aspx.cs" Inherits="MasterHostApps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            width: 800px;
        }
    </style>

    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Applicant</th>
                            <th scope="col">Application</th>
                            <th scope="col">Date</th>
                            <th scope="col">Accept/Decline</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>Name:
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# String.Concat(Eval("FirstName"), " ", Eval("LastName"))%>' />
                        </td>
                        <td>
                            <asp:Button ID="Button1" runat="server" Text="View Application" OnClick="Button1_Click"/>
                        </td>
                        <td>
                            <asp:Label ID="ApplicationDateLabel" runat="server" Text='<%# Eval("ApplicationDate", "{0:MM/dd/yyyy}") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="cbDecision" runat="server"/>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RoomMagnetConnectionString %>"></asp:SqlDataSource>
    </div>
</asp:Content>

