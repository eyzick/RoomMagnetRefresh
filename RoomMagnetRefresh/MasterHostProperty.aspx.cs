using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // go into database and populate the 4 boxes with address using globalID
    }

    protected void cbAddress_CheckedChanged(object sender, EventArgs e)
    {
        tbAddress.Enabled = true;
        tbCity.Enabled = true;
        ddState.Enabled = true;
        tbZip.Enabled = true;
    }

    protected void btnList_Click(object sender, EventArgs e)
    {
        Property tempProperty = new Property();

        //splitting up address
        string address = HttpUtility.HtmlEncode(tbAddress.Text);
        string[] addressArray = new string[2];
        int count = 2;
        string[] seperator = { " " };
        string[] strList = address.Split(seperator, count, StringSplitOptions.RemoveEmptyEntries);
        for (int i = 0; i < 2; i++)
        {
            addressArray[i] = strList[i];

        }

        tempProperty.setHouseNumber(addressArray[0]);
        tempProperty.setStreet(addressArray[1]);
        tempProperty.setCityCounty(HttpUtility.HtmlEncode(tbCity.Text));
        tempProperty.setHomeState(ddState.SelectedValue);
        tempProperty.setZip(HttpUtility.HtmlEncode(tbZip.Text));
        tempProperty.setMonthlyPrice(Double.Parse(tbPrice.Text));
        tempProperty.setRoomType(ddRoomType.SelectedValue);
        tempProperty.setDescription("CHANGE ME LATER");

        // need to change property class to better fit what we need here - description, availability

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        byte[] picture = null;
        if (firstUploader.HasFile)
        {
            MemoryStream ms = new MemoryStream();
            Bitmap bitmap2 = new Bitmap(firstUploader.PostedFile.InputStream);
            bitmap2.Save(ms, bitmap2.RawFormat);
            picture = ms.GetBuffer();
            ms.Close();
        }

        System.Data.SqlClient.SqlCommand insertProperty = new System.Data.SqlClient.SqlCommand();
        insertProperty.Connection = sc;
        insertProperty.CommandText = "Insert into [dbo].[Accomodation] values (@HouseNumber, @Street, @City, @State, @Zip, @Price, 1, 1, @RoomType, @Description, @HostID, @ModifiedDate, @Image);";
        insertProperty.Parameters.Add(new SqlParameter("@HouseNumber", tempProperty.getHouseNumber()));
        insertProperty.Parameters.Add(new SqlParameter("@Street", tempProperty.getStreet()));
        insertProperty.Parameters.Add(new SqlParameter("@City", tempProperty.getCityCounty()));
        insertProperty.Parameters.Add(new SqlParameter("@State", tempProperty.getHomeState()));
        insertProperty.Parameters.Add(new SqlParameter("@Zip", tempProperty.getZip()));
        insertProperty.Parameters.Add(new SqlParameter("@Price", tempProperty.getMonthlyPrice()));
        insertProperty.Parameters.Add(new SqlParameter("@RoomType", tempProperty.getRoomType()));
        insertProperty.Parameters.Add(new SqlParameter("@Description", tempProperty.getDescription()));
        insertProperty.Parameters.Add(new SqlParameter("@HostID", Session["globalID"]));
        insertProperty.Parameters.Add(new SqlParameter("@ModifiedDate", DateTime.Now));
        insertProperty.Parameters.Add(new SqlParameter("@Image", picture));




    }
}