﻿using System;
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

    protected void btnNext_Click(object sender, EventArgs e)
    {
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        string usertype = "t";
        //Validation

        int validated = validateInformation(tbFirstName.Text, tbLastName.Text, tbPhoneNumber.Text, tbDOB.Text, tbAddress.Text, tbZip.Text);


        if(validated == 0)
        {
            Tenant tempTenant = new Tenant();

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

            tempTenant.SetFirstName(HttpUtility.HtmlEncode(tbFirstName.Text));
            tempTenant.SetLastName(HttpUtility.HtmlEncode(tbLastName.Text));
            tempTenant.SetDateOfBirth(HttpUtility.HtmlEncode(tbDOB.Text));
            tempTenant.SetHouseNumber(HttpUtility.HtmlEncode(addressArray[0]));
            tempTenant.SetStreet(HttpUtility.HtmlEncode(addressArray[1]));
            tempTenant.SetHomeState(ddState.SelectedValue);
            tempTenant.SetZip(HttpUtility.HtmlEncode(tbZip.Text));

            // Insert into database 
            DateTime now = DateTime.Now;
            System.Data.SqlClient.SqlCommand insertTest = new System.Data.SqlClient.SqlCommand();
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@FirstName", tempTenant.GetFirstName()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@LastName", tempTenant.GetLastName()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", tempTenant.GetEmailAddress()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PhoneNumber", tempTenant.getPhoneNumber()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@DOB", tempTenant.GetDateOfBirth()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@HouseNum", tempTenant.GetHouseNumber()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Street", tempTenant.GetStreet()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@City", tempTenant.GetCityCounty()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@State", tempTenant.GetHomeState()));
            insertTest.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Zip", tempTenant.GetZip()));
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

            Response.Redirect("MasterTenantSignUp2.aspx");
        }
        // VALIDATION KEY: 1. First Name invald 2. Last Name invalid 3. Phone number invalid 4. Age invalid 5. City invalid 6. Zipcode invalid
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
}