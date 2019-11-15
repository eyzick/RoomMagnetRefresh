using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Boolean success = false;
        int id = 0;
        String usertype = "";

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();
        System.Data.SqlClient.SqlCommand match = new System.Data.SqlClient.SqlCommand();
        match.Connection = sc;
       
        match.CommandText = "select passwordhash from[db_owner].[AdminPassword] where Email = @Email " +
            "union select passwordhash from[dbo].[HostPassword] where Email = @Email " +
            "union select passwordhash from[dbo].[TenantPassword] where Email = @Email";

        match.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", tbEmail.Text));
        System.Data.SqlClient.SqlDataReader reader = match.ExecuteReader(); // create a reader

        if (reader.HasRows)
        {
            while (reader.Read()) // this will read the single record that matches the entered usename
            {
                string storedHash = reader["PasswordHash"].ToString(); // store the database password into this varable
                if (PasswordHash.ValidatePassword(tbPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                {
                   
                    success = true;
                }
                
            }
        }
        else // if the username does not exist, it will show failure.
            
        sc.Close();
        if (success == true)
        {
            sc.Open();
            System.Data.SqlClient.SqlCommand matchID = new System.Data.SqlClient.SqlCommand();
            matchID.Connection = sc;
            //matchID.CommandText = "Select AdminID from [db_owner].[AdminPassword] where Email = @Email";
            matchID.CommandText = "select adminid from[db_owner].[AdminPassword] where Email = @Email " +
                "union select hostid from[dbo].[HostPassword] where Email = @Email " +
                "union select tenantid from[dbo].[TenantPassword] where Email = @Email";
            matchID.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", tbEmail.Text));
            id = (Int32)matchID.ExecuteScalar();
            Session["globalID"] = id;
           

            System.Data.SqlClient.SqlCommand type = new System.Data.SqlClient.SqlCommand();
            type.Connection = sc;

            type.CommandText = "select UserType from [dbo].[RMUser] where userid = " + id;
            usertype = type.ExecuteScalar().ToString();

            switch (usertype)
            {
                case "t":
                    Response.Redirect("MasterTenantDash.aspx");
                    break;
                case "h":
                    Response.Redirect("MasterHostDashboard.aspx");
                    break;
                case "a":
                    Response.Redirect("MasterAdminDashboard.aspx");
                    break;
            }
        }
    }
}