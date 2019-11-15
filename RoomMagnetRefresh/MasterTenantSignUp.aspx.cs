using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;


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

        string usertype = "t";
        //Validation

        int validated = validateInformation(tbFirstName.Text, tbLastName.Text, tbPhoneNumber.Text, tbDOB.Text, tbAddress.Text, tbCity.Text, tbZip.Text,tbEmail.Text,tbPassword.Text);


        if (validated == 0)
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
            DateTime test2 = Convert.ToDateTime(tbDOB.Text);
            tempTenant.SetDateOfBirth(test2);
            tempTenant.SetHouseNumber(HttpUtility.HtmlEncode(addressArray[0]));
            tempTenant.SetStreet(HttpUtility.HtmlEncode(addressArray[1]));
            tempTenant.SetCityCounty(HttpUtility.HtmlEncode(tbCity.Text));
            tempTenant.SetHomeState(ddState.SelectedValue);
            tempTenant.SetZip(HttpUtility.HtmlEncode(tbZip.Text));
            tempTenant.setPhoneNumber(HttpUtility.HtmlEncode(tbPhoneNumber.Text));
            tempTenant.SetEmailAddress(HttpUtility.HtmlEncode(tbEmail.Text));

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

            Response.Redirect("MasterTenantDash.aspx");
        }
        // VALIDATION KEY: 1. First Name invald 2. Last Name invalid 3. Phone number invalid 4. Age invalid 5. City invalid 6. Zipcode invalid
        else if (validated == 1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid first name');", true);

        }
        else if (validated == 2)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid last name');", true);

        }
        else if (validated == 3)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid phone number');", true);

        }
        else if (validated == 4)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Sorry, your age does not meet the requirements');", true);
        }
        else if (validated == 5)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid city name');", true);
        }
        else if (validated == 6)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid Zip Code');", true);
        }
        else if (validated == 7)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('please enter a valid Email Address');", true);

        }
        else if (validated ==8)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Please enter a valid password');", true);
        }

    }






    public int validateInformation(string firstName, string lastName, string phoneNumber, string birthday, string street, string city, string zip, string email, string password)
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
        
            
            var today = DateTime.Today;
            DateTime bir = DateTime.ParseExact(tbDOB.Text, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);

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

        // Email validation
        
        Boolean emailValid = true;

        
            if (!email.Contains('@'))
            {
            emailValid = false;
            error = 7;
            }
            else if (!email.Contains('.'))
            {
            emailValid = false;
            error = 7;
            }

        Boolean capital = false;
        Boolean number = false;
        Boolean special = false;
        Boolean whiteSpace = true;
        Boolean minLength = true;
        Boolean passwordValid = false;

        if (password.Any(char.IsUpper))
        {
            capital = true;
            if (password.Any(char.IsDigit))
            {
                number = true;
                for (int i = 0; i < password.Length; i++)
                {
                    if (password[i] == '!' || password[i] == '?' || password[i] == '`' || password[i] == '~' || password[i] == '@' || password[i] == '#' || password[i] == '$' || password[i] == '%' || password[i] == '^' || password[i] == '&' || password[i] == '*' || password[i] == '(' || password[i] == ')' || password[i] == '-' || password[i] == '_' || password[i] == '+' || password[i] == '=' || password[i] == ',' || password[i] == '<' || password[i] == '.' || password[i] == '>' || password[i] == '/' || password[i] == '?' || password[i] == '[' || password[i] == '{' || password[i] == ']' || password[i] == '}' || password[i] == ';' || password[i] == ':' || password[i] == '"' || password[i] == '|')
                    {
                        special = true;
                        if (password.Any(char.IsPunctuation))
                        {
                            special = true;
                            
                            if (password.Length < 8)
                            {
                                minLength = false;
                                
                                if (password.Any(char.IsWhiteSpace))
                                {
                                    whiteSpace = false;
                                   
                                }
                            }
                        }
                    }
                }
            }
        }

        if (capital == true && number == true && special == true && minLength == true && whiteSpace == true)
        {
            passwordValid = true;
            error = 0;
        }
        else
        {
                error = 8;            
        }

        return error;

    }



    protected void tbFirstName_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
        sc.Open();

        tbFirstName.Text = "Isaac";
        tbLastName.Text = "Gamble";
        tbPhoneNumber.Text = "5402564839";
        tbAddress.Text = "100 Candy Cane Lane";
        tbCity.Text = "Harrisonburg";
        ddState.SelectedValue = "VA";
        tbZip.Text = "22801";
        tbPassword.Text = "Password123!";
        tbPasswordConfirm.Text = "Password123!";
        tbDOB.Text = DateTime.Today.ToString("1997-12-25");
        System.Data.SqlClient.SqlCommand maxID = new System.Data.SqlClient.SqlCommand();
        maxID.Connection = sc;

        maxID.CommandText = "Select MAX(UserID) from [dbo].[RMUser];";

        int max = (Int32)maxID.ExecuteScalar();

        tbEmail.Text = "gambleisaac@gmail.com" + max;
        tbEmailConfirm.Text = "gambleisaac@gmail.com" + max;

    }

   
}