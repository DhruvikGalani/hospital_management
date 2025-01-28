<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="hospital_management.BookAppointment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 582px;
    }
    .auto-style4 {
        height: 26px;
    }
    .auto-style6 {
        height: 29px;
    }

    #btnSubmit2 {
        border-radius: 10px;
        background-color: #059669;
        color: white;
        font-size: 15px;
        width: 70%;
        text-align: center;
        margin-left: 5px;
    }

    #btnViewresume
    {
        color:#059669;
        font-weight:bolder;
    }

    #btnViewresume:hover{
        background-color:#059669;
        color:white;
    }

    #btnUpdateresume {
        background-color: #059669;
        color: white;
    }
</style>
</head>
<body>
    <form id="Emp_profile" runat="server">
        <div class="row" style="margin-left:400px;">
                    <div class="col" style="width:400px;height:600px;box-shadow : 5px 5px 15px grey; border : 1px solid black; float:left;border-radius:10px;">

            <table class="auto-style1">
                <tr>
                    <td style="font-weight: bolder; text-align: center; color: #059669; font-size: 25px;" class="auto-style2">Book Appointment<br />
                        <br />
                    </td>
                </tr>

                <tr>
                    <td style="text-align: center">
                        <asp:RadioButtonList ID="rblselect" runat="server">
                            <asp:ListItem>Book Appointment</asp:ListItem>
                            <asp:ListItem>Book Health Check</asp:ListItem>
                            <asp:ListItem>Book Second Opinion</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">Select City</td>
                </tr>
                <tr>
                    <!--<td style="text-align: center">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>surat</asp:ListItem>
                            <asp:ListItem>goa</asp:ListItem>-->
                            <select class="form-control lead_city" name="lead_city" data-gtm-form-interact-field-id="3">
                  <option value="0" data-city="0">Select City</option>
                                    <option value="2761" data-city="Ahmedabad">Ahmedabad</option>    
                                    <option value="3015" data-city="Bangalore">Bangalore</option>    
                                    <option value="3633" data-city="Bhopal">Bhopal</option>    
                                    <option value="4199" data-city="Bhubaneswar">Bhubaneswar</option>    
                                    <option value="6373" data-city="Bilaspur">Bilaspur</option>    
                                    <option value="1" data-city="Chennai">Chennai</option>    
                                    <option value="3309" data-city="Cochin">Cochin</option>    
                                    <option value="2741" data-city="Delhi">Delhi</option>    
                                    <option value="2207" data-city="Guwahati">Guwahati</option>    
                                    <option value="12" data-city="Hyderabad">Hyderabad</option>    
                                    <option value="3707" data-city="Indore">Indore</option>    
                                    <option value="663" data-city="Kakinada">Kakinada</option>    
                                    <option value="4945" data-city="Karaikudi">Karaikudi</option>    
                                    <option value="753" data-city="Karim Nagar">Karim Nagar</option>    
                                    <option value="4951" data-city="Karur">Karur</option>    
                                    <option value="13" data-city="Kolkata">Kolkata</option>    
                                    <option value="5955" data-city="Lucknow">Lucknow</option>    
                                    <option value="5081" data-city="Madurai">Madurai</option>    
                                    <option value="3989" data-city="Mumbai">Mumbai</option>    
                                    <option value="3175" data-city="Mysore">Mysore</option>    
                                    <option value="3999" data-city="Nasik">Nasik</option>    
                                    <option value="1223" data-city="Nellore">Nellore</option>    
                                    <option value="6009" data-city="Noida">Noida</option>    
                                    <option value="4343" data-city="Rourkela">Rourkela</option>    
                                    <option value="5641" data-city="Trichy">Trichy</option>    
                                    <option value="1983" data-city="Visakhapatnam">Visakhapatnam</option>    
                   
                  </select>
                        
                </tr>
                <tr>
                    <td style="text-align: center">
                        <br />
                        Date of birth :</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtDetaildbo" runat="server" Width="95%"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <br />
                        Phone number :</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:TextBox ID="txtDetailphone" runat="server" Width="95%"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <br />
                        City :</td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <asp:TextBox ID="txtDetailcity" runat="server" Width="95%"></asp:TextBox>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <br />
                        Experience :</td>
                </tr>
                <tr>
                    <td class="auto-style6" style="text-align: center">
                        <asp:TextBox ID="txtDetailexperience" runat="server" Width="95%"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <br />
                        Resume </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <asp:Button ID="btnViewresume" runat="server" Text="View Resume" Width="95%" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnUpdateresume" runat="server" Text="Update Resume" Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align:center;">
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Size="20px" NavigateUrl="~/forgot_pass.aspx" ForeColor="#059669">Forgot password!</asp:HyperLink>
                    </td>
                </tr>
            </table>

        </div>


            <div class="col" style="margin-left:450px; margin-top:10px;text-align:center;">
                <div style="border:1px solid black;border-radius:10px; width:200px;height:250px;">
                    <h1 style="color: #059669;">Skills </h1>
                    <button>Add skills </button>
                    <br />
                    <br />
                    <asp:DropDownList ID="ddlSkills" runat="server">
                        <asp:ListItem>Accounting</asp:ListItem>
                        <asp:ListItem>Data Analysis</asp:ListItem>
                        <asp:ListItem>Advertising</asp:ListItem>
                        <asp:ListItem>Recruiting</asp:ListItem>
                        <asp:ListItem>Web developer</asp:ListItem>
                        <asp:ListItem>Research Skills</asp:ListItem>
                        <asp:ListItem>HTML5</asp:ListItem>
                        <asp:ListItem Value="Bootstrap"></asp:ListItem>
                        <asp:ListItem>Database</asp:ListItem>
                        <asp:ListItem>SQL</asp:ListItem>
                        <asp:ListItem>Marketing</asp:ListItem>
                        <asp:ListItem Value="Information Technology"></asp:ListItem>
                        <asp:ListItem Value="Human Resources (HR)"></asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="btnSubmit2" runat="server" Text="Submit" />
                </div>

                <div style="border:1px solid black;border-radius:10px; width:200px;height:300px;margin-top:20px;">
                    <h1 style="color: #059669;">Education </h1>
                    <button>Add education</button>
                </div>
            </div>

        </div>


        
    </form>
</body>
</html>

   

