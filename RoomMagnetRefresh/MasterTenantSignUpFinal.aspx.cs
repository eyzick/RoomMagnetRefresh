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
            // insert stuff into database
            Response.Redirect("MasterTenantDash.aspx");
        }

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