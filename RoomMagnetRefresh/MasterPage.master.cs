using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public static Tenant tempTenant;
    public static Host tempHost;
    public static Property tempProperty;
    public static int globalID;
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["globalID"] = globalID;
        Session["tempTenant"] = tempTenant;
        Session["tempHost"] = tempHost;
        Session["tempProperty"] = tempProperty;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("MasterLogin.aspx");
    }
}
