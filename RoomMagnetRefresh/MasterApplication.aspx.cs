using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterApplication : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;
        insert.CommandText = "Insert into [dbo].[Application] values (@ApplicationDate, @TenantID, @AccomodationID, @ModifiedDate)";
        insert.Parameters.Add(new SqlParameter("@ApplicationDate", DateTime.Today));
        insert.Parameters.Add(new SqlParameter("@TenantID", 77));
        insert.Parameters.Add(new SqlParameter("@AccomodationID", 42));
        insert.Parameters.Add(new SqlParameter("@ModifiedDate", DateTime.Today));

        insert.ExecuteNonQuery();
    }
}