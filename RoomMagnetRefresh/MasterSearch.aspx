<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterSearch.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
            <div class="row">
                <br />


                <asp:TextBox ID="txt_search" class="col s2" placeholder="Search" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="btnSearch" class="col s2 btn" runat="server" Text="Search" OnClick="btnSearch_Click" />

            </div>
            
            <div class="row">
           <div class="col s8">
            <asp:DataList ID="Repeater1" runat="server" RepeatColumns="2" CellPadding="0" RepeatDirection="Horizontal" Width="800px">
           
             <ItemTemplate>
             
            <asp:Image ID="Image1" runat="server" ImageUrl='<%#    "data:Image.jpg;base64," + Convert.ToBase64String( (byte[])Eval("image")  ) %>' Height="240px" Width="246px"  />
            <br />
            <br />
             
            
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Price").ToString()+"$" %>' BorderStyle="None" Font-Overline="False" ForeColor="Black"></asp:Label>
            <br />
            <br />
           
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Price") %>' ForeColor="#FF0066"></asp:Label>

            <br />
               <br />
                <a ForeColor="#FF0066" href='Product_Des.aspx?id=<%# Eval("Capacity")%>' Class="btn btn-primary" Width="198px"  target ="_blank">Descriptions</a>
            <br /> 
           <br />
            
            <a ForeColor="#FF0066" href='<%# Eval("AccomodationID") %>' target="_blank">Favorite &#39;<%#Eval("HouseNumber") + " " + Eval("Street").ToString() %>'</a>
                 
                
         
             </ItemTemplate>
              
            </asp:DataList>
       
           </div>
                  <script>
            var queryconnectionstring = "Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        </script>
          <script>
              var map;
            // Initialize and add the map
            function initMap() {
                // The location of Uluru
            
                // The map, centered at Uluru
             

                var latlng = new google.maps.LatLng(38.5, -78.9);
map = new google.maps.Map(document.getElementById('map'), {
  center: latlng,
  zoom: 12
});
                // The marker, positioned at Uluru
                var marker = new google.maps.Marker({ position: latlng, map: map });
            }
        </script>
        <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2iKCtOOUYD8k0pQSINhUXmNVT5ehZGvA&callback=initMap">
        </script>
        <script>
            var dataTable1;

            function sendQuery() {
                // query for salespeople
                var query = new google.visualization.Query(queryConnectionString);
                query.setQuery("select * from [dbo].[Accomodation]");
                query.send(onQuery1Response);
            }
            function onQuery1Response(response) {
                // error-handling code
                if (response.isError()) {
                    alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
                    return;
                }

                // get the data table from the query response
                dataTable1 = response.getDataTable();

                // specify the event handler method for user selection
                google.visualization.events.addListener(chart1, 'select', selectHandler);
            }
            function selectHandler(e) {
                // get the sales person's id. Based on the user selection (item), and the
                // specific column where the sales person's id is found
                var selection = chart1.getSelection();
                var item = selection[5];
                spID = dataTable1.getValue(item.row, 1);

                // query for salesperson's stores
                var query = new google.visualization.Query(queryConnectionString);
                query.setQuery("SELECT  H, count(E) WHERE E = " + spID + " group by H");
                query.send(onQuery2Response);
            }
        </script>

                <div class="col s4">
            <div  id="map">
          
              </div>
               </div>
        </div>
     </div>
</asp:Content>


