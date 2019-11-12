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
        // need to change property class to better fit what we need here

        
    }
}