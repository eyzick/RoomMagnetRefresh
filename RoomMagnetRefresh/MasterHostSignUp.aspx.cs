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

    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {


    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
    protected void btnNext_Click(object sender, EventArgs e)
    {

    }

    protected void btnNext2_Click(object sender, EventArgs e)
    {

    }
    protected void btnprevious_Click(object sender, EventArgs e)
    {

    }
    protected void btnPrevious2_Click(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        string usertype = "h";
        //Validation

        int validated = validateInformation(tbFirstName.Text, tbLastName.Text, tbPhoneNumber.Text, tbDOB.Text, tbAddress.Text, tbZip.Text);


        if (validated == 0)
        {
            Host tempHost = new Host();

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

            tempHost.SetFirstName(HttpUtility.HtmlEncode(tbFirstName.Text));
            tempHost.SetLastName(HttpUtility.HtmlEncode(tbLastName.Text));
            tempHost.SetDateOfBirth(HttpUtility.HtmlEncode(tbDOB.Text));
            tempHost.SetHouseNumber(HttpUtility.HtmlEncode(addressArray[0]));
            tempHost.SetStreet(HttpUtility.HtmlEncode(addressArray[1]));
            tempHost.SetHomeState(ddState.SelectedValue);
            tempHost.SetZip(HttpUtility.HtmlEncode(tbZip.Text));
            tempHost.setPhoneNumber(HttpUtility.HtmlEncode(tbPhoneNumber.Text));
            

            DateTime now = DateTime.Now;
            System.Data.SqlClient.SqlCommand insertTest = new System.Data.SqlClient.SqlCommand();
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FirstName", tempHost.GetFirstName()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LastName", tempHost.GetLastName()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", "tempemail@gmail.com"));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PhoneNumber", tempHost.getPhoneNumber()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DOB", tempHost.GetDateOfBirth()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HouseNum", tempHost.GetHouseNumber()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Street", tempHost.GetStreet()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@City", tempHost.GetCityCounty()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@State", tempHost.GetHomeState()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Zip", tempHost.GetZip()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ModfiedDate", now));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@UserType", usertype));
            insertTest.Connection = sc;

            insertTest.CommandText = "Insert into [dbo].[RMUser] VALUES (@FirstName," +
                   "@LastName," +
                   "@Email," +
                   "@PhoneNumber," +
                   "@DOB," +
                   "@HouseNum," +
                   "@Street," +
                   "@City," +
                   "@State," +
                   "@Zip," +
                   "@ModfiedDate," +
                   "@UserType);";
            insertTest.ExecuteNonQuery();

            // finding maxID and storing it globally
            System.Data.SqlClient.SqlCommand maxID = new System.Data.SqlClient.SqlCommand();
            maxID.Connection = sc;

            maxID.CommandText = "Select MAX(UserID) from [dbo].[RMUser];";

            Session["globalID"] = (Int32)maxID.ExecuteScalar();

            

            Response.Redirect("MasterHost2.aspx");
        }
        else if (validated == 1)
        {
            //error message goes here
        }
        else if (validated == 2)
        {
            //error message goes here
        }
        else if (validated == 3)
        {
            //error message goes here
        }
        else if (validated == 4)
        {
            //error message goes here
        }
        else if (validated == 5)
        {
            //error message goes here
        }
        else if (validated == 6)
        {
            //error message goes here
        }
        else
        {

        }

    }

    public int validateInformation(string firstName, string lastName, string phoneNumber, string birthday, string city, string zip)
    {
        int error = 0;
        // Name Vaildation
        Boolean firstNameValid = true;
        Boolean lastNamevalid = true;
        Boolean nameValid = true;
        if (firstName.Any(char.IsNumber))
        {
            firstNameValid = false;
            error = 1;

        }
        if (firstName.Any(char.IsWhiteSpace))
        {
            firstNameValid = false;
            error = 1;

        }
        if (firstName == "")
        {
            firstNameValid = false;
            error = 1;

        }
        if (lastName.Any(char.IsNumber))
        {
            lastNamevalid = false;
            error = 2;

        }
        if (lastName.Any(char.IsWhiteSpace))
        {
            lastNamevalid = false;
            error = 2;

        }
        if (lastName == "")
        {
            lastNamevalid = false;
            error = 2;

        }
        if (firstNameValid == false || lastNamevalid == false)
        {
            nameValid = false;
        }

        // phone number vaildation
        Boolean phoneNumberValid = true;
        if (phoneNumber.Length < 10)
        {
            phoneNumberValid = false;
            error = 3;

        }
        if (phoneNumber.Any(char.IsLetter))
        {
            phoneNumberValid = false;
            error = 3;

        }
        if (phoneNumber.Any(char.IsWhiteSpace))
        {
            phoneNumberValid = false;
            error = 3;

        }
        if (phoneNumber == "")
        {
            phoneNumberValid = false;
            error = 3;

        }
        // Birthday Validation
        Boolean birthdayValid = true;
        DateTime bod;
        if (DateTime.TryParse(birthday, out bod) && (!birthday.Contains('-')))
        {
            String.Format("{0:d/MM/yyyy}", bod);
            var today = DateTime.Today;

            DateTime bir = DateTime.ParseExact(birthday, "yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);
            var age = today.Year - bir.Year;

            if (bir.Month > today.Month)
            {
                age--;
            }

            else if (bir.Day > today.Day)
            {
                age--;
            }
            if (age >= 130 || age < 18)
            {
                birthdayValid = false;
                error = 4;

            }
        }
        else
        {
            birthdayValid = false;
            error = 4;

        }

        // City validation
        Boolean cityValid = true;
        if (city == "")
        {

            cityValid = false;
            error = 5;
        }
        if (city.Any(char.IsNumber))
        {
            cityValid = false;
            error = 5;

        }
        // ZIP validation
        Boolean zipValid = true;
        if (zip.Any(char.IsLetter))
        {
            zipValid = false;
            error = 6;

        }
        if (zip.Length > 5)
        {
            zipValid = false;
            error = 6;

        }
        if (zip == "")
        {
            zipValid = false;
            error = 6;

        }
        return error;

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

    protected void cbAddress_CheckedChanged(object sender, EventArgs e)
    {
        tbAddress.Enabled = true;
        tbCity.Enabled = true;
        ddState.Enabled = true;
        tbZip.Enabled = true;
    }
}