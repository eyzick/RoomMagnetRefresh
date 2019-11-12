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

    protected void btnNext_Click(object sender, EventArgs e)
    {


        int validated = validateInformation(HttpUtility.HtmlEncode(tbEmail.Text), HttpUtility.HtmlEncode(tbEmailConfirm.Text), HttpUtility.HtmlEncode(tbPassword.Text), HttpUtility.HtmlEncode(tbPasswordConfirm.Text));

        if (validated == 0)
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Data Source=aay09edjn65sf6.cpcbbo8ggvx6.us-east-1.rds.amazonaws.com;Initial Catalog=RoomMagnet;Persist Security Info=True;User ID=fahrenheit;Password=cis484fall";
            sc.Open();

            System.Data.SqlClient.SqlCommand insertPass = new System.Data.SqlClient.SqlCommand();
            insertPass.Connection = sc;
            insertPass.CommandText = "Insert into [dbo].[HostPassword] values(@MaxID, @Password, @ModifiedDate, @Email);";
            insertPass.Parameters.Add(new System.Data.SqlClient.SqlParameter("@MaxID", Session["globalID"]));
            insertPass.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Email", tbEmail.Text));
            insertPass.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Password", PasswordHash.HashPassword(tbPassword.Text)));
            insertPass.Parameters.Add(new System.Data.SqlClient.SqlParameter("@ModifiedDate", DateTime.Now));
            insertPass.ExecuteNonQuery();

            // retroactively adds email to the database for that user
            System.Data.SqlClient.SqlCommand updateEmail = new System.Data.SqlClient.SqlCommand();
            updateEmail.Connection = sc;
            updateEmail.CommandText = "update [dbo].[RMUser] set Email = @Email where UserID = @MaxID;";

            Response.Redirect("MasterTenantDash.aspx");
        }

        // VALIDATION KEY - 1. Emails do not match 2. Passwords do not match 3. Email not formatted correctly 4. Password not formatted correctly

        else if (validated == 1)
        {
            // error messages go here
            
        }

        else if (validated == 2)
        {
            // error messages go here
        }

        else if (validated == 3)
        {
            // error messages go here
        }

        else if (validated == 4)
        {
            // error messages go here
        }

        else
        {

        }

    }

    public int validateInformation(string email, string emailConfirm, string password, string passwordConfirm)
    {
        int error = 0;

        Boolean emailTrue = stringCompare(email, emailConfirm);
        Boolean passwordTrue = stringCompare(password, passwordConfirm);

        if (emailTrue == false)
        {
            error = 1;
        }
        if (passwordTrue == false)
        {
            error = 2;
        }
        Boolean atSign = false;
        Boolean comma = false;
        Boolean emailValid = false;

        for (int i = 0; i < email.Length; i++)
        {
            if (email[i] == '@')
            {
                atSign = true;


            }
            else if (email[i] == '.')
            {
                comma = true;

            }
            else
            {
                error = 3;
            }

        }
        if (email == "")
        {
            error = 3;
        }

        Boolean capital = false;
        Boolean number = false;
        Boolean special = false;
        Boolean whiteSpace = true;
        Boolean minLength = false;
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
                            if (password.Length >= 8)
                            {
                                minLength = true;
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
           

        }
        else
        {

            error = 4;
        
        }

        return error;

    }

    public Boolean stringCompare(string one, string two)
    {
        Boolean bo;

        int compareString = string.Compare(one, two);

        if (compareString != 0)
        {
            bo = false;
        }
        else
        {
            bo = true;
        }

        return bo;
    }
}