﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{


    protected void Page_Init(Object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        System.Data.SqlClient.SqlCommand getFirstName = new System.Data.SqlClient.SqlCommand();
        getFirstName.Connection = sc;
        getFirstName.CommandText = "select FirstName from [dbo].[RMUser] where UserID=" + Session["globalID"];
       // lblFirstNameDash.Text = getFirstName.ExecuteScalar().ToString() + "'s Dashboard";
        lblFirstNameDash.Text = "User's Dashboard";


        System.Data.SqlClient.SqlCommand getLastName = new System.Data.SqlClient.SqlCommand();
        getLastName.Connection = sc;
        getLastName.CommandText = "select LastName from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblFullName.Text = getLastName.ExecuteScalar().ToString() + " " + getLastName.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getEmail = new System.Data.SqlClient.SqlCommand();
        getEmail.Connection = sc;
        getEmail.CommandText = "select Email from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblEmail.Text = getEmail.ExecuteScalar().ToString();

        System.Data.SqlClient.SqlCommand getPhoneNumber = new System.Data.SqlClient.SqlCommand();
        getPhoneNumber.Connection = sc;
        getPhoneNumber.CommandText = "select PhoneNumber from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblPhoneNumber.Text = getPhoneNumber.ExecuteScalar().ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        //sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        //sc.Open();

        //System.Data.SqlClient.SqlCommand getFirstName = new System.Data.SqlClient.SqlCommand();
        //getFirstName.Connection = sc;
        //getFirstName.CommandText = "select FirstName from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblFirstNameDash.Text = getFirstName.ExecuteScalar().ToString() + "'s Dashboard";


        //System.Data.SqlClient.SqlCommand getLastName = new System.Data.SqlClient.SqlCommand();
        //getLastName.Connection = sc;
        //getLastName.CommandText = "select LastName from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblFullName.Text = getFirstName.ExecuteScalar().ToString() + " " + getLastName.ExecuteScalar().ToString();

        //System.Data.SqlClient.SqlCommand getEmail = new System.Data.SqlClient.SqlCommand();
        //getEmail.Connection = sc;
        //getEmail.CommandText = "select Email from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblEmail.Text = getEmail.ExecuteScalar().ToString();

        //System.Data.SqlClient.SqlCommand getPhoneNumber = new System.Data.SqlClient.SqlCommand();
        //getPhoneNumber.Connection = sc;
        //getPhoneNumber.CommandText = "select PhoneNumber from [dbo].[RMUser] where UserID=" + Session["globalID"];
        //lblPhoneNumber.Text = getPhoneNumber.ExecuteScalar().ToString();
    }

    protected void btnApplicants_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterHostApps.aspx");
    }
}