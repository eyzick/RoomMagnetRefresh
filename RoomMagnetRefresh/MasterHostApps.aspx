<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostApps.aspx.cs" Inherits="MasterHostApps" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <style type="text/css">
        .table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            width: 400px;
        }
    </style>

    <div>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Applicant</th>
                            <th scope="col">Date</th>
                            <th scope="col">Accept/Decline</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>First Name:
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        </td>   
                        <td>ApplicationDate:
                            <asp:Label ID="ApplicationDateLabel" runat="server" Text='<%# Eval("ApplicationDate") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="cbDecision" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Last Name:
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RoomMagnetConnectionString %>"></asp:SqlDataSource>
    </div>
</asp:Content>

