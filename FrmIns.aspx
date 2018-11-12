<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmIns.aspx.cs" Inherits="InsUpdDel.FrmIns" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        function validateName(Name)
        {
            var letterNumber = /^[ a-zA-Z]+$/;
            if ((Name.value.match(letterNumber)))
            {
                return true;
            }
            else
            {

                alert("Invalid Name"); 
                return false; 
            }
        }
        function validateAge(Age)
        {
            var letterNumber = /^[0-9]+$/;
            if ((Age.value.match(letterNumber))) {
                return true;
            }
            else {
                alert("Invalid Name");
                return false;
            }
        
        }

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
         <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item"><a href="#Insert" class="nav-link active" data-toggle="tab" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Add</span></a></li>
                <li class="nav-item"><a href="#Select" class="nav-link" data-toggle="tab" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">View</span></a></li>
             <li class="nav-item"><a href="#UpdateDelete" class="nav-link" data-toggle="tab" role="tab"><span class="hidden-sm-up"></span><span class="hidden-xs-down">Update / Delete</span></a></li>
            </ul>
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="Insert">
                    <table class="table">
                        <tr><td>&nbsp;</td>
                            <td>Enter Name</td><td>
                                <asp:TextBox ID="txtName" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                           <td>Enter Age</td><td>
                                <asp:TextBox ID="txtAge" runat="server" onblur="validateAge(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                           <td>Enter District</td><td>
                                <asp:TextBox ID="txtDistrict" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                            <td>Enter State</td><td>
                                <asp:TextBox ID="txtState" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                            <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /></td><td>
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                                </td>
                        </tr>
                    </table>
                    </div>
               
                 <div role="tabpanel" class="tab-pane" id="Select">
                     <asp:GridView ID="grdReg" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" CssClass="table table-hover">
                         <Columns>
                   <%-- <asp:BoundField DataField="EmpId" HeaderText="EmpId" ReadOnly="true" />--%>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="age" HeaderText="Age" />
                    <asp:BoundField DataField="district" HeaderText="District" />
                    <asp:BoundField DataField="state" HeaderText="State" />
                             </Columns>
                     </asp:GridView>
                 </div>
                 <div role="tabpanel" class="tab-pane" id="UpdateDelete">
                      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                   <asp:GridView ID="grdUpdate" runat="server" AutoGenerateColumns="false" GridLines="Horizontal" CssClass="table table-hover">
                    <Columns>
                    <asp:BoundField DataField="id" HeaderText="Id"/>
                    <asp:BoundField DataField="name" HeaderText="Name"/>
                    <asp:BoundField DataField="age" HeaderText="Age" />
                    <asp:BoundField DataField="district" HeaderText="District" />
                    <asp:BoundField DataField="state" HeaderText="State" />
                    </Columns>
                     </asp:GridView>
                     <br />
                         <table class="table">
                              <tr><td>&nbsp;</td>
                            <td>Select Id</td><td>
                                <asp:DropDownList ID="drpId" runat="server" OnSelectedIndexChanged="drpId_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                        </tr>
                             </table>
                    <b>Update</b>
                          <table class="table">
                        <tr><td>&nbsp;</td>
                            <td>Enter Name</td><td>
                                <asp:TextBox ID="txtUpdName" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                           <td>Enter Age</td><td>
                                <asp:TextBox ID="txtUpdAge" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                           <td>Enter District</td><td>
                                <asp:TextBox ID="txtUpdDistrict" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                            <td>Enter State</td><td>
                                <asp:TextBox ID="txtUpdState" runat="server" onblur="validateName(this);"></asp:TextBox></td>
                        </tr>
                        <tr><td>&nbsp;</td>
                            <td><asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /></td><td>
                                <asp:Button ID="btnUpdCancel" runat="server" Text="Cancel" OnClick="btnUpdCancel_Click"/>
                                </td>
                        </tr>
                    </table>
                         <hr />
                          <b>Delete &nbsp;&nbsp;&nbsp; <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" /></b>
                         
                         </ContentTemplate></asp:UpdatePanel>
                 </div>
               
                
    </div>
        </div>
    </form>
</body>
</html>
