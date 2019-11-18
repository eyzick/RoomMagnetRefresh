using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterHostApps : System.Web.UI.Page
{
    protected void Page_Init(Object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;
        insert.CommandText = "select accomodationid from [dbo].[Accomodation] where HostID = " + 79;
        int number = Int32.Parse(insert.ExecuteScalar().ToString());

        SqlDataSource1.SelectCommand = "SELECT dbo.RMUser.FirstName, dbo.RMUser.LastName, dbo.Application.ApplicationDate " +
            "FROM dbo.RMUser INNER JOIN dbo.Application ON dbo.RMUser.UserID = dbo.Application.TenantID where AccomodationID = "
            + number;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}