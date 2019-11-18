﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchTemp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   


    
   
<style>
    .form-control {
        margin-top:1px;
    }
    .filter-lable {
        text-align: right;
        margin-top: 3px;
    }
     .propertybox{
            width:80%;
            padding-top:0px;
            padding-left:0px;
            padding-right:0px;
            box-shadow: 2px 2px 2px 2px grey;
            margin: 12px;
            margin-bottom:12px;
            text-align:justify;
            border-radius:5px;

  }
  .propertybox .btn
  {
    width: 100px;
    font-size:12px;
    text-align: center;
    background-color:palevioletred;
   
     border-radius: 7px;

  }
    .thumbnail{
        padding:0px;
    }
    .propertybox img {
        height:200px;
       width: 100%;
    }
  @media (max-width: 1200px) {
    .propertybox {
        flex: 0 0 50%;
        max-width: 60%;
    }
     @media (min-width: 800px) {
    .propertybox {
        flex: 0 0 50%;
        max-width: 80%;
    }
     .propertybox img {
        width:100%;
    }

  }
  @media (min-width: 768px){
      .col-md-8 {
    -ms-flex: 0 0 66.666667%;
    flex: 0 0 66.666667%;
    max-width: 80%;
}
  /* Set the size of the div element that contains the map */
        #map {
           
          
            height: 500px; /* The height is 400 pixels */
         
            width: 500px; /* The width is the width of the web page */
              border:1px;
            background-color:red;
            border-color:rebeccapurple;
        }
    </style>

        <div class="container" style="padding-top:20px" >
           <div class="row">

             <div class="col-6">
                 <div class="input-group" ">
               <asp:TextBox ID="txt_search" runat="server" CssClass="form-control" style="border-top-left-radius: 10px; border-bottom-left-radius: 10px;" placeholder="Richard VA"></asp:TextBox>
     
      <span class="input-group-btn">
          
       
          <asp:linkbutton ID="btnSearch" runat="server" onclick="btnSearch_Click" CssClass="btn btn-default glyphicon glyphicon-search"  style="border-top-right-radius: 10px; border-bottom-right-radius: 10px;" />
   
          </span>
    </div><!-- /input-group -->
                
             </div>
             <div class="col-2 filter-lable">

              <asp:Label ID="Label1" runat="server" Text="Filter By" Font-Size="Large" Font-Bold="True"></asp:Label> 
             </div>
             <div class="col-2 " >
              <asp:DropDownList ID="ddlFilters" CssClass="btn btn-default" runat="server">
                <asp:ListItem>Most Recent</asp:ListItem>
                <asp:ListItem>Lowest Price</asp:ListItem>
                <asp:ListItem>heighest Price</asp:ListItem>
              </asp:DropDownList>
             </div>
             <div class="col-2">

                  <asp:DropDownList ID="ddlHousetype" CssClass="btn btn-default" runat="server">
                <asp:ListItem>House Type</asp:ListItem>
                <asp:ListItem>Lowest Price</asp:ListItem>
                <asp:ListItem>heighest Price</asp:ListItem>
              </asp:DropDownList>
             </div>
             <div class="col-2">

             </div>
        
            </div>

        </div>
       
         <div class="container-fluid" style="padding-left: 50px; padding-top:50px">

        <div class="col-md-8" style="width: 60%;">
            <div class="row">
<asp:Repeater ID="Repeater1" runat="server">

    <ItemTemplate>
             <div class="col-sm-6 col-md-5 propertybox">
                <div class="thumbnail">
                    <img src='<%#    "data:Image.jpg;base64," + Convert.ToBase64String( (byte[])Eval("image")  ) %>' alt="" />
                    <div class="caption" style="padding: 15px;">

                        <div class="row">

                          <div class="col-7" style="text-align:center">
                            <h5><%#Eval("Capacity") %> "1 bedroom 1 bath"</h5>
                             <h5><%#Eval("Zip") %>Northen Va,2280</h5>
                              <h5><strong>$<%#Eval("Price") %> per month</strong></h5>

                          </div>
                          
                          <div class="col-md-5" style="padding-top:10px">
                              <p><a href="#" class="btn btn-primary ">Description</a></p>
                              <p><a href="#" class="btn btn-primary ">Add to Favorites</a></p>
                          </div>
                          
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
</asp:Repeater>





        </div>
        </div>

        <div class="col-md-4">

             <div  id="map">
          
              </div>


            </div>
    </div>
       
       
    
</asp:Content>


