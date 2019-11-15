<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MasterHostSignUp.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <link rel="stylesheet" type="text/css" href="Content/bootstrap.css"/>
    <link href="Stylesheet.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <style>
        h1 {
            text-align: center;
        }
        fieldset {
            background-color:antiquewhite;
            max-width:1500px;
            padding:16px;	
        }
    </style>
    <script type="text/javascript">


        $(document).ready(function () {
            $('#' + '<%= tbPhoneNumber.ClientID %>').blur(function () {
                var val = $(this).val();
                var newvalue = val.replace(/(\d{3})(\d{3})(\d{4})/, "($1)$2-$3");
                $(this).val(newvalue);
            });
        });

  $('.btnNext').click(function(){
  $('.nav-tabs > .active').next('li').find('a').trigger('click');});

  $('.btnPrevious').click(function(){
  $('.nav-tabs > .active').prev('li').find('a').trigger('click');});

    </script>

       
 

          <h1>Create your account</h1>      
      <br /><br />
      <div class="container">
       
   <fieldset>
       <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-danger pull-right" OnClick="btnSave_Click" />
      
      <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#step1">Step 1</a></li>
    <li><a data-toggle="tab" href="#step2">Step 2</a></li>
    <li><a data-toggle="tab" href="#step3">Step 3</a></li> 
    <li><a data-toggle="tab" href="#step4">Step 4</a></li>
      </ul>
   
                  

          <div class="tab-content">
              <div id="step1" class="tab-pane fade in active">
                  <h3>Step 1</h3>
                  <p>Tell us about yourself</p>
                  <div class="row">
                      <div class="col-md-3">
                          <label for="tbFirstName">First Name</label>
                          <asp:TextBox ID="tbFirstName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your first name</asp:RequiredFieldValidator>
                          <br />
                      </div>
                      <div class="col-md-3">
                          <label for="tbLastName">Last Name</label>
                          <asp:TextBox ID="tbLastName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                          
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbLastName" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your last name</asp:RequiredFieldValidator>
                          </div>
                      <div class="col-md-3">
                          <label for="tbDOB">Date of Birth</label>
                          <asp:TextBox ID="tbDOB" runat="server" type="date" placeholder="Date of Birth" CssClass="form-control"></asp:TextBox>
                          <br />
                      </div>
                      <div class="col-md-3">
                          <label for="tbPhoneNumber">Phone Number</label>
    <asp:TextBox runat="server" placeholder="Phone Number" ID="tbPhoneNumber" CssClass="form-control" TabIndex="3" MaxLength="10"></asp:TextBox>
                          
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbPhoneNumber" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your phone number</asp:RequiredFieldValidator>
                          <br />
                      </div>
                  </div>
                  <br />
                  <br />
                  <div class="row">
                      <div class="col-md-3">
                          <label for "tbAddress">Street Address</label>
                          <asp:TextBox ID="tbAddress" runat="server" placeholder="Home Address" CssClass="form-control"></asp:TextBox>
                          
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tbAddress" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your street address</asp:RequiredFieldValidator>
                          <br />
                      </div>
                      <div class="col-md-3">
                          <label for="tbCity">City</label>
                          <asp:TextBox ID="tbCity" runat="server" placeholder="City" CssClass="form-control"></asp:TextBox>
                          
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbCity" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your city name</asp:RequiredFieldValidator>
                          <br />
                      </div>
                      <div class="col-md-3">
                          <label for="ddState">State</label>
                          <asp:DropDownList ID="ddState" runat="server" CssClass="form-control">
                              <asp:ListItem>AL</asp:ListItem>
                              <asp:ListItem>AK</asp:ListItem>
                              <asp:ListItem>AZ</asp:ListItem>
                              <asp:ListItem>AR</asp:ListItem>
                              <asp:ListItem>CA</asp:ListItem>
                              <asp:ListItem>CO</asp:ListItem>
                              <asp:ListItem>CT</asp:ListItem>
                              <asp:ListItem>DE</asp:ListItem>
                              <asp:ListItem>FL</asp:ListItem>
                              <asp:ListItem>GA</asp:ListItem>
                              <asp:ListItem>HI</asp:ListItem>
                              <asp:ListItem>ID</asp:ListItem>
                              <asp:ListItem>IL</asp:ListItem>
                              <asp:ListItem>IN</asp:ListItem>
                              <asp:ListItem>IA</asp:ListItem>
                              <asp:ListItem>KS</asp:ListItem>
                              <asp:ListItem>KY</asp:ListItem>
                              <asp:ListItem>LA</asp:ListItem>
                              <asp:ListItem>ME</asp:ListItem>
                              <asp:ListItem>MD</asp:ListItem>
                              <asp:ListItem>MA</asp:ListItem>
                              <asp:ListItem>MI</asp:ListItem>
                              <asp:ListItem>MN</asp:ListItem>
                              <asp:ListItem>MS</asp:ListItem>
                              <asp:ListItem>MO</asp:ListItem>
                              <asp:ListItem>MT</asp:ListItem>
                              <asp:ListItem>NE</asp:ListItem>
                              <asp:ListItem>NV</asp:ListItem>
                              <asp:ListItem>NH</asp:ListItem>
                              <asp:ListItem>NJ</asp:ListItem>
                              <asp:ListItem>NM</asp:ListItem>
                              <asp:ListItem>NY</asp:ListItem>
                              <asp:ListItem>NC</asp:ListItem>
                              <asp:ListItem>ND</asp:ListItem>
                              <asp:ListItem>OH</asp:ListItem>
                              <asp:ListItem>OK</asp:ListItem>
                              <asp:ListItem>OR</asp:ListItem>
                              <asp:ListItem>PA</asp:ListItem>
                              <asp:ListItem>RI</asp:ListItem>
                              <asp:ListItem>SC</asp:ListItem>
                              <asp:ListItem>SD</asp:ListItem>
                              <asp:ListItem>TN</asp:ListItem>
                              <asp:ListItem>TX</asp:ListItem>
                              <asp:ListItem>UT</asp:ListItem>
                              <asp:ListItem>VT</asp:ListItem>
                              <asp:ListItem>VA</asp:ListItem>
                              <asp:ListItem>WA</asp:ListItem>
                              <asp:ListItem>WV</asp:ListItem>
                              <asp:ListItem>WI</asp:ListItem>
                              <asp:ListItem>WY</asp:ListItem>
                          </asp:DropDownList>
                          <br />
                      </div>
                      <div class="col-md-3">
                          <label for="tbZip">Zipcode</label>
                          <asp:TextBox ID="tbZip" runat="server" placeholder="Zipcode" CssClass="form-control" MaxLength="5"></asp:TextBox>
                          
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tbPhoneNumber" ErrorMessage="RequiredFieldValidator" ForeColor="Red">Please enter your zip code</asp:RequiredFieldValidator>
                          <br />
                      </div>
                  </div>
                  <br /><br /><br />
                  <asp:Button ID="btnNext" runat="server" Text="Next Step" class="btn btn-primary pull-right" OnClick="btnNext_Click" />
               
              </div>
              <div id="step2" class="tab-pane fade">
                  <h3>Step 2</h3>
                  <p>Tell us how you like to live</p>
                  <div class="row">
                      <div class="col-md-4">
                          <h4>Do you have pets?</h4>
                          <asp:RadioButtonList ID="rbPets" runat="server">
                              <asp:ListItem> Yes</asp:ListItem>
                              <asp:ListItem> No</asp:ListItem>
                              
                          </asp:RadioButtonList>
                      </div>
                      <div class="col-md-4">
                          <h4>Do you have a spare bathroom?</h4>
                          <asp:RadioButtonList ID="rbBathroom" runat="server">
                              <asp:ListItem> Yes</asp:ListItem>
                              <asp:ListItem> No</asp:ListItem>
                          </asp:RadioButtonList>
                      </div>
                      <div class="col-md-4">
                         <h4>Is there alcohol in your household?</h4>
                          <asp:RadioButtonList ID="rbDrink" runat="server">
                           <asp:ListItem> Yes</asp:ListItem>
                           <asp:ListItem> No, but I don't mind drinking</asp:ListItem>
                           <asp:ListItem> No</asp:ListItem>
                         </asp:RadioButtonList>
                      </div>
                  </div>
                  <br />
                  <div class="row">
                      <div class="col-md-4">
                          <h4>What time do you usually go to bed?</h4>
                          <asp:RadioButtonList ID="rbBed" runat="server">
                              <asp:ListItem> Before 10pm</asp:ListItem>
                              <asp:ListItem> Between 11pm-Midnight</asp:ListItem>
                              <asp:ListItem> After Midnight</asp:ListItem>
                              <asp:ListItem> It varies from day to day!</asp:ListItem>
                          </asp:RadioButtonList>
                      </div>
                      <div class="col-md-4">
                          <h4>Would you consider yourself a clean person? (We don't judge)</h4>
                          <h4>How clean do you keep your household?</h4>
                             <asp:RadioButtonList ID="rbClean" runat="server">
                                <asp:ListItem> Spotless</asp:ListItem>
                                <asp:ListItem> Some clutter here and there</asp:ListItem>
                                 <asp:ListItem> I don't mind clutter at all</asp:ListItem>
                                <asp:ListItem> Cleanliness is not my speciality.</asp:ListItem>
                             </asp:RadioButtonList>
                      </div>
                      <div class="col-md-4">
                          <h4>Do you have a preference for who lives with you?</h4>
                          <asp:RadioButtonList ID="rbStatus" runat="server">
                           <asp:ListItem> Undergrad students</asp:ListItem>
                           <asp:ListItem> Graduate students</asp:ListItem>
                           <asp:ListItem> Summer interns</asp:ListItem>
                           <asp:ListItem> Adults</asp:ListItem>
                          </asp:RadioButtonList>
                      </div>
                  </div>
                  <br /><br /><br />
                   <asp:Button ID="btnPrevious" runat="server" Text="Previous" class="btn btn-primary pull-left" OnClick="btnprevious_Click" />
                   <asp:Button ID="btnNext2" runat="server" Text="Next Step" class="btn btn-primary pull-right" OnClick="btnNext2_Click" />
              </div>
              <div id="step3" class="tab-pane fade">
                  <h3>Step 3</h3>
                  <p>Thanks for filling out our survey! Let's finish setting up your account!</p>
                  <div class="row">
                      <div class="col-md-6">
                          <label for="tbEmail">Email Address</label>
                          <asp:TextBox ID="tbEmail" runat="server" placeholder="Email Address" TextMode="Email" CssClass="form-control"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="tbEmail" runat="server" ErrorMessage="Please enter your email address" ForeColor="Red"></asp:RequiredFieldValidator>
                      </div><br />
                      <div class="col-md-6">
                          <label for="tbEmailConfirm">Confirm Email</label>
                          <asp:TextBox ID="tbEmailConfirm" runat="server" placeholder="Confirm Email" CssClass="form-control"></asp:TextBox>
                          <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbEmail" ErrorMessage="email address does not match" ForeColor="Red" ControlToValidate="tbEmailConfirm"></asp:CompareValidator>
                      </div>
                  </div>
                  <br />
                  <div class="row">
                      <div class="col-md-6">
                          <label for="tbPassword">Password</label>
                          <asp:TextBox ID="tbPassword" runat="server" placeholder="Password" type="password" CssClass="form-control"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="tbPassword" runat="server" ErrorMessage="Please enter your password" ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>
                      <div class="col-md-6">
                          <label for="tbPasswordConfirm">Confirm Password</label>
                          <asp:TextBox ID="tbPasswordConfirm" runat="server" placeholder="Confirm Password" type="password" CssClass="form-control"></asp:TextBox>
                          <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="tbPassword" ErrorMessage="Password does not match" ForeColor="Red" ControlToValidate="tbPasswordConfirm"></asp:CompareValidator>
                      </div>
                  </div>
                  <br /><br /><br />
                  <asp:Button ID="btnPrevious2" runat="server" Text="Previous" class="btn btn-primary pull-left" OnClick="btnPrevious2_Click" />
                  <asp:Button ID="btnSubmit" runat="server" Text="Create Account" class="btn btn-success pull-right" OnClick="btnSubmit_Click" />


              </div>
              <div id="step4" class="tab-pane fade">
                  <h3>Step 4</h3>
                  <p>List your property</p>
                   <div class="row">
             <div class="col-md-4"><h2>Tell us about your property</h2></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-2"><asp:CheckBox ID="cbAddress" runat="server" Text="*" ToolTip="Address is different than my current address" OnChange="cbAddress_CheckedChanged" CssClass="form-control" /></div>
            <div class="col-md-3"><asp:TextBox ID="TextBox1" runat="server" placeholder="Address" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:TextBox></div>
            <div class="col-md-3"><asp:TextBox ID="TextBox2" runat="server" placeholder="City" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:TextBox></div>
            <div class="col-md-2"><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Enabled="False" CssClass="form-control">
                 <asp:ListItem>AL</asp:ListItem>
                <asp:ListItem>AK</asp:ListItem>
                <asp:ListItem>AZ</asp:ListItem>
                <asp:ListItem>AR</asp:ListItem>
                <asp:ListItem>CA</asp:ListItem>
                <asp:ListItem>CO</asp:ListItem>
                <asp:ListItem>CT</asp:ListItem>
                <asp:ListItem>DE</asp:ListItem>
                <asp:ListItem>FL</asp:ListItem>
                <asp:ListItem>GA</asp:ListItem>
                <asp:ListItem>HI</asp:ListItem>
                <asp:ListItem>ID</asp:ListItem>
                <asp:ListItem>IL</asp:ListItem>
                <asp:ListItem>IN</asp:ListItem>
                <asp:ListItem>IA</asp:ListItem>
                <asp:ListItem>KS</asp:ListItem>
                <asp:ListItem>KY</asp:ListItem>
                <asp:ListItem>LA</asp:ListItem>
                <asp:ListItem>ME</asp:ListItem>
                <asp:ListItem>MD</asp:ListItem>
                <asp:ListItem>MA</asp:ListItem>
                <asp:ListItem>MI</asp:ListItem>
                <asp:ListItem>MN</asp:ListItem>
                <asp:ListItem>MS</asp:ListItem>
                <asp:ListItem>MO</asp:ListItem>
                <asp:ListItem>MT</asp:ListItem>
                <asp:ListItem>NE</asp:ListItem>
                <asp:ListItem>NV</asp:ListItem>
                <asp:ListItem>NH</asp:ListItem>
                <asp:ListItem>NJ</asp:ListItem>
                <asp:ListItem>NM</asp:ListItem>
                <asp:ListItem>NY</asp:ListItem>
                <asp:ListItem>NC</asp:ListItem>
                <asp:ListItem>ND</asp:ListItem>
                <asp:ListItem>OH</asp:ListItem>
                <asp:ListItem>OK</asp:ListItem>
                <asp:ListItem>OR</asp:ListItem>
                <asp:ListItem>PA</asp:ListItem>
                <asp:ListItem>RI</asp:ListItem>
                <asp:ListItem>SC</asp:ListItem>
                <asp:ListItem>SD</asp:ListItem>
                <asp:ListItem>TN</asp:ListItem>
                <asp:ListItem>TX</asp:ListItem>
                <asp:ListItem>UT</asp:ListItem>
                <asp:ListItem>VT</asp:ListItem>
                <asp:ListItem>VA</asp:ListItem>
                <asp:ListItem>WA</asp:ListItem>
                <asp:ListItem>WV</asp:ListItem>
                <asp:ListItem>WI</asp:ListItem>
                <asp:ListItem>WY</asp:ListItem>
                                  </asp:DropDownList></div>
            <div class="col-md-2"><asp:TextBox ID="TextBox3" runat="server" placeholder="Zipcode" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"><asp:TextBox ID="tbPrice" runat="server" placeholder="Price" CssClass="form-control"></asp:TextBox></div>
            <div class="col-md-4"><asp:DropDownList ToolTip="Room Description" ID="ddRoomType" runat="server" CssClass="form-control">
                                    <asp:ListItem>Bedroom</asp:ListItem>
                                    <asp:ListItem>Basement</asp:ListItem>
                                    <asp:ListItem>Attic</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                  </asp:DropDownList>
            </div>
            <div class="col-md-4"><asp:TextBox ID="tbAvailability" runat="server" placeholder="Availability (Months)" CssClass="form-control"></asp:TextBox></div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4"><asp:FileUpload runat="server" Style="display: block" accept=".png,.jpg,.jpeg" ID="firstUploader" CssClass="form-control"></asp:FileUpload></div>
        </div>
        <div class="row">
            <asp:Button ID="btnList" runat="server" Text="List my property!" OnClick="btnList_Click" CssClass="form-control" />
        </div>
    </div>
    
              </div>
          
   </fieldset>
          </div>

     
</asp:Content>

