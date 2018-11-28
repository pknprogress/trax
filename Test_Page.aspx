<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Test_Page.aspx.cs" Inherits="Test_Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

   <style type="text/css">
        .FixedHeader { position:absolute; font-weight:bold; background-color:navy; color:white; }     
   </style>

   <%--<style type="text/css">
       .Div_Scrollable { 
       width: 1800px; 
       height: 750px; 
       overflow: auto; 
       position: absolute;  }
   </style>--%>

    
    <%------------- Page Heading ------------%>
    <p><asp:Label ID="Label_Page_Heading" runat="server" Font-Bold="True" Font-Size="Small" Text="Trax \ Forecasts \ Schedule Due"></asp:Label></p>

    <table class="nav-justified" style="border: 1px solid #000000; background-color: #f7f7f7; color: #000000; width:1800px; height:45px; " >

       <%--------- Blank Row ---------%>
       <tr style="line-height:5px">
           <td>&nbsp</td>
           <td colspan="6">&nbsp</td>
           <td>&nbsp</td>
       </tr>


       <%---==================== Filter Selection Row =====================---%>
       <tr style="line-height: 25px; vertical-align:top; ">

           <td style="width: 20px"></td>

           <td style="width:250px; white-space:nowrap; vertical-align:top;">
               <asp:Label ID="LabelWeek" runat="server" Text="LMR Week: " Font-Bold="true"></asp:Label>
               <asp:DropDownList ID="DropDownList_Filter_Week" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Filter_Weeks" DataTextField="Start" DataValueField="Id" DataTextFormatString="{0:dd-MMM-yyyy}" Height="25px" AppendDataBoundItems="true" OnSelectedIndexChanged="DropDownList_Filter_Week_SelectedIndexChanged" >
                    <asp:ListItem Text="All Weeks" Value=0 />
               </asp:DropDownList>
           </td>

           <td style="width:250px; white-space:nowrap; vertical-align:top">
               <asp:Label ID="Label11" runat="server" Text="Depot: " Font-Bold="true"></asp:Label>
               <asp:DropDownList ID="DropDownList_Filter_Depot" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Filter_Depots" DataTextField="Depot" DataValueField="Depot" Height="25px" AppendDataBoundItems="true" >
                    <asp:ListItem Text="All Depots" Value="All" />
               </asp:DropDownList>
           </td>

           <td style="width: 250px; white-space:nowrap; vertical-align:top">
               <asp:Label ID="Label_Filter_Loco" runat="server" Text="Loco: " Font-Bold="true"></asp:Label>
               <asp:TextBox ID="TextBox_Filter_Loco" runat="server" AutoPostBack="True" Width="100px" Height="25px" ></asp:TextBox>
           </td>

           <td style="width:250px; white-space:nowrap; vertical-align:top">
               <asp:Label ID="Label2" runat="server" Text="Customer: " Font-Bold="true"></asp:Label>
               <asp:DropDownList ID="DropDownList_Filter_Customer" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource_Filter_Customers" DataTextField="Customer_Name" DataValueField="Customer_Id" Height="25px" AppendDataBoundItems="true">
                    <asp:ListItem Text="All" Value=0 />
               </asp:DropDownList>
           </td>

           <td style="width: 200px; white-space:nowrap">
               <asp:Button ID="Button_View_Select" runat="server" AutoPostBack="True" CssClass="Trax_Button" OnClick="Button_View_Select_Click"></asp:Button>
           </td>

           <td style="width: 220px; white-space:nowrap; vertical-align:top">
               <asp:Button ID="Button_Add_Totals" runat="server" AutoPostBack="True" Text="Add Totals" CssClass="Trax_Button" OnClick="Button_Add_Totals_Click"></asp:Button>
               <%--<asp:Button ID="Button_Calculate" runat="server" AutoPostBack="True" Text="Calculate" CssClass="Trax_Button" OnClick="Check_Locos"></asp:Button>--%>
           </td>

           <td style="width: 20px">&nbsp;</td>

        </tr>

        <%--------- Blank Row ---------%>
        <tr style="line-height:5px">
            <td>&nbsp</td>
            <td colspan="6">&nbsp</td>
            <td>&nbsp</td>
        </tr>

    </table>



    <div id="Div_Scrollable" style="height:750px; width:1800px; overflow:auto;" >

    <%--<div id="Div_Scrollable" class="Div_Scrollable" >--%>
    
         <asp:GridView ID="GridView_Schedule_Week_View" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="Schedule_Id" DataSourceID="SqlDataSource_Schedule_Due" GridLines="Both" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" Font-Size="Small" HeaderStyle-CssClass="FixedHeader" OnRowDataBound="GridView_Schedule_Week_View_RowDataBound" OnRowUpdating="GridView_Schedule_Week_View_RowUpdating" >

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="False" HeaderStyle-Width="89px" ItemStyle-Width="90px" HeaderStyle-BackColor="#34495E">
                            <HeaderTemplate>
                                &nbsp<asp:LinkButton ID="Button_Insert" runat="server" CausesValidation="True" Text="Insert" ForeColor="White" Font-Underline="True" Font-Bold="True" ></asp:LinkButton>
                            </HeaderTemplate>
                            <ItemTemplate>
                                 &nbsp<asp:LinkButton ID="Button_Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Font-Bold="true" Font-Underline="True" ForeColor="Black" ></asp:LinkButton>
                                 &nbsp<asp:LinkButton ID="Button_Gridview_Schedule_Week_Delete" runat="server" CausesValidation="False" Text="Delete" ForeColor="Black" Font-Bold="true" Font-Underline="true" ></asp:LinkButton>&nbsp
                            </ItemTemplate>
                            <EditItemTemplate>
                               <asp:LinkButton ID="Button_Save" runat="server" CausesValidation="True" CommandName="Update" Text="Save" ForeColor="Black" Font-Underline="True" Font-Bold="True" ></asp:LinkButton>
                               <asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="Black" Font-Underline="True" Font-Bold="True" ></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Schedule_Id" SortExpression="Schedule_Id" Visible="false" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Label ID="Label_Schedule_Id" runat="server" Text='<%# Bind("Schedule_Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Week Start" SortExpression="Week_Start_Date" Visible="false" ItemStyle-Width="130px" HeaderStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label ID="Label_Week_Start_Date" runat="server" Text='<%# Bind("Week_Start_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Week_Start_Date" runat="server" Text='<%# Bind("Week_Start_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Order" SortExpression="Row_Order" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label_Row_Order" runat="server" Text='<%# Bind("Row_Order") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Type" SortExpression="Row_Type" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label_Row_Type" runat="server" Text='<%# Bind("Row_Type") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Class" SortExpression="Class" HeaderStyle-Width="83px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                            <ItemTemplate>
                                <asp:Label ID="Label_Class" runat="server" Text='<%# Bind("Class") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Loco" SortExpression="Loco_Number" HeaderStyle-Width="103px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                            <ItemTemplate>
                                <asp:Label ID="Label_Loco_Number" runat="server" Text='<%# Bind("Loco_Number") %>' Width="100px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Task Code" SortExpression="Task_Code" HeaderStyle-Width="203px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Task_Code" runat="server" Text='<%# Bind("Task_Code") %>' Width="200px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:DropDownList ID="DropDownList_Task_Code" runat="server" DataSourceID="SqlDatasource_Tasks" DataTextField="Task_Code" DataValueField="Task_Code" SelectedValue='<%# Bind("Task_Code") %>' Width="200px" Height="25px" AppendDataBoundItems="true">
                                  <asp:ListItem Text="" Value=""/>
                               </asp:DropDownList>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Notes" SortExpression="Notes" HeaderStyle-Width="303px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Notes" runat="server" Text='<%# Bind("Notes") %>' Width="300px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox_Notes" runat="server" Text='<%# Bind("Notes") %>' Width="300px"></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Depot" SortExpression="Depot" HeaderStyle-Width="143px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Depot" runat="server" Text='<%# Bind("Depot") %>' Width="140px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:DropDownList ID="DropDownList_Depot" runat="server" selectedvalue='<%# Bind("Depot")%>' Height="24px" Width="140px">
                                   <asp:ListItem>Bowen</asp:ListItem>
                                   <asp:ListItem>Cardiff</asp:ListItem>
                                   <asp:ListItem>Clyde</asp:ListItem>
                                   <asp:ListItem>Enfield</asp:ListItem>
                                   <asp:ListItem>Gladstone</asp:ListItem>
                                   <asp:ListItem>Kooragang</asp:ListItem>
                                   <asp:ListItem>Nebo</asp:ListItem>
                                   <asp:ListItem>Port Augusta</asp:ListItem>
                                   <asp:ListItem>Port Kembla</asp:ListItem>
                                   <asp:ListItem>Townsville</asp:ListItem>
                                   <asp:ListItem>Werris Creek</asp:ListItem>
                                   <asp:ListItem></asp:ListItem>
                               </asp:DropDownList>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Scheduled Date" SortExpression="Scheduled_Date" ItemStyle-Wrap="false" HeaderStyle-Width="163px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Scheduled_Date" runat="server" Text='<%# Bind("Scheduled_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="160px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox_Scheduled_Date" runat="server" Text='<%# Bind("Scheduled_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="160px"></asp:TextBox>
                               <asp:ImageButton ID="Button_Calendar" runat="server" ImageUrl="~/Buttons/Calendar28x30.png" Height="18px" ImageAlign="AbsMiddle" />
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Due Date" SortExpression="Due_Date" HeaderStyle-Width="163px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                              <asp:Label ID="Label_Due_Date" runat="server" Text='<%# Bind("Due_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="160px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                              <asp:TextBox ID="TextBox_Due_Date" runat="server" Text='<%# Bind("Due_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="160px"></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Contract" SortExpression="Contract" HeaderStyle-Width="103px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                              <asp:Label ID="Label_Contract" runat="server" Text='<%# Bind("Contract") %>' Width="100px" ></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Work Type" SortExpression="Work_Type" HeaderStyle-Width="123px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Work_Type" runat="server" Text='<%# Bind("Work_Type") %>' Width="120px" ></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>
                     
                       <asp:TemplateField HeaderText="Duration" SortExpression="Duration" HeaderStyle-Width="73px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Duration" runat="server" Text='<%# Bind("Duration") %>' Width="70px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox_Duration" runat="server" Text='<%# Bind("Duration") %>' Width="70px"></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Labour" SortExpression="Labour_Hours" HeaderStyle-Width="73px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Labour_Hours" runat="server" Text='<%# Bind("Labour_Hours") %>' Width="70px"></asp:Label>
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="TextBox_Labour_Hours" runat="server" Text='<%# Bind("Labour_Hours") %>' Width="70px"></asp:TextBox>
                           </EditItemTemplate>
                       </asp:TemplateField>

                       <asp:TemplateField HeaderText="Finish Date" SortExpression="Release_Date" HeaderStyle-Width="133px" HeaderStyle-ForeColor="White" HeaderStyle-BackColor="#34495E">
                           <ItemTemplate>
                               <asp:Label ID="Label_Release_Date" runat="server" Text='<%# Bind("Release_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                           </ItemTemplate>
                       </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="LightSteelBlue" />
                    <FooterStyle BackColor="#34495E"  Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#34495E" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" Font-Size="Medium" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9EBEF" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>


                <asp:GridView ID="GridView_Schedule_Depot_View" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="1" DataKeyNames="Schedule_Id" DataSourceID="SqlDataSource_Schedule_Depot_View" ForeColor="#333333" GridLines="Both" BorderStyle="Solid" BorderColor="Black" BorderWidth="2px" Font-Size="Small" OnRowDataBound="GridView_Schedule_Depot_View_RowDataBound" >

                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField ShowHeader="False" ItemStyle-Wrap="False">
                            <HeaderTemplate>
                                &nbsp<asp:LinkButton ID="Button_Insert" runat="server" CausesValidation="True" Text="Insert" ForeColor="White" Font-Underline="True" Font-Bold="True"></asp:LinkButton>
                            </HeaderTemplate>
                            <ItemTemplate>
                                 &nbsp<asp:LinkButton ID="Button_Edit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Font-Bold="true" Font-Underline="True" ForeColor="Black" ></asp:LinkButton>
                                 &nbsp<asp:LinkButton ID="Button_Delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ForeColor="Black" Font-Bold="true" Font-Underline="true" OnClientClick="return confirm('Are you sure you want to delete this week record ?');"></asp:LinkButton>&nbsp
                            </ItemTemplate>
                            <EditItemTemplate>
                               &nbsp<asp:LinkButton ID="Button_Save" runat="server" CausesValidation="True" CommandName="Update" Text="Save" ForeColor="Black" Font-Underline="True" Font-Bold="True" ></asp:LinkButton>
                               &nbsp<asp:LinkButton ID="Button_Cancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="Black" Font-Underline="True" Font-Bold="True" ></asp:LinkButton>&nbsp
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Schedule_Id" SortExpression="Schedule_Id" Visible="true">
                            <ItemTemplate>
                                <asp:Label ID="Label_Schedule_Id" runat="server" Text='<%# Bind("Schedule_Id") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="Label_Schedule_Id" runat="server" Text='<%# Bind("Schedule_Id") %>'></asp:Label>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Week Start" SortExpression="Week_Start_Date" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label_Week_Start_Date" runat="server" Text='<%# Bind("Week_Start_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Week_Start_Date" runat="server" Text='<%# Bind("Week_Start_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Order" SortExpression="Row_Order" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label_Row_Order" runat="server" Text='<%# Bind("Row_Order") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Type" SortExpression="Row_Type" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label_Row_Type" runat="server" Text='<%# Bind("Row_Type") %>' Width="50px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Class" SortExpression="Class">
                            <ItemTemplate>
                                <asp:Label ID="Label_Class" runat="server" Text='<%# Bind("Class") %>' Width="80px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Loco" SortExpression="Loco_Number">
                            <ItemTemplate>
                                <asp:Label ID="Label_Loco_Number" runat="server" Text='<%# Bind("Loco_Number") %>' Width="100px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Task Name" SortExpression="Task_Code">
                            <ItemTemplate>
                                <asp:Label ID="Label_Task_Code" runat="server" Text='<%# Bind("Task_Code") %>' Width="200px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList_Task_Code" runat="server" DataSourceID="SqlDatasource_Tasks" DataTextField="Task_Code" DataValueField="Task_Code" SelectedValue='<%# Bind("Task_Code") %>' Width="200px" Height="25px" AppendDataBoundItems="true">
                                   <asp:ListItem Text="" Value="" />
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                            <ItemTemplate>
                                <asp:Label ID="Label_Notes" runat="server" Text='<%# Bind("Notes") %>' Width="300px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Notes" runat="server" Text='<%# Bind("Notes") %>' Width="300px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Depot" SortExpression="Depot" HeaderStyle-Width="140px">
                            <ItemTemplate>
                                <asp:Label ID="Label_Depot" runat="server" Text='<%# Bind("Depot") %>' Width="140px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox_Depot" runat="server" Text='<%# Bind("Depot") %>' Width="120px"></asp:TextBox>--%>
                                <asp:DropDownList ID="DropDownList_Depot" runat="server" selectedvalue='<%# Bind("Depot")%>' Height="24px">
                                    <asp:ListItem>Bowen</asp:ListItem>
                                    <asp:ListItem>Cardiff</asp:ListItem>
                                    <asp:ListItem>Clyde</asp:ListItem>
                                    <asp:ListItem>Enfield</asp:ListItem>
                                    <asp:ListItem>Gladstone</asp:ListItem>
                                    <asp:ListItem>Kooragang</asp:ListItem>
                                    <asp:ListItem>Nebo</asp:ListItem>
                                    <asp:ListItem>Port Augusta</asp:ListItem>
                                    <asp:ListItem>Port Kembla</asp:ListItem>
                                    <asp:ListItem>Townsville</asp:ListItem>
                                    <asp:ListItem>Werris Creek</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Scheduled Date" SortExpression="Scheduled_Date">
                            <ItemTemplate>
                                <asp:Label ID="Label_Scheduled_Date" runat="server" Text='<%# Bind("Scheduled_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Scheduled_Date" runat="server" Text='<%# Bind("Scheduled_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Due Date" SortExpression="Due_Date">
                            <ItemTemplate>
                                <asp:Label ID="Label_Due_Date" runat="server" Text='<%# Bind("Due_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contract" SortExpression="Contract">
                            <ItemTemplate>
                                <asp:Label ID="Label_Contract" runat="server" Text='<%# Bind("Contract") %>' Width="100px" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Work Type" SortExpression="Work_Type">
                            <ItemTemplate>
                                <asp:Label ID="Label_Work_Type" runat="server" Text='<%# Bind("Work_Type") %>' Width="120px" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                     
                        <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                            <ItemTemplate>
                                <asp:Label ID="Label_Duration" runat="server" Text='<%# Bind("Duration") %>' Width="70px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Duration" runat="server" Text='<%# Bind("Duration") %>' Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Labour" SortExpression="Labour_Hours" >
                            <ItemTemplate>
                                <asp:Label ID="Label_Labour_Hours" runat="server" Text='<%# Bind("Labour_Hours") %>' Width="70px"></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox_Labour_Hours" runat="server" Text='<%# Bind("Labour_Hours") %>' Width="70px"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Finish Date" SortExpression="Release_Date">
                            <ItemTemplate>
                                <asp:Label ID="Label_Release_Date" runat="server" Text='<%# Bind("Release_Date","{0:dd-MMM-yyyy HH:mm}") %>' Width="130px"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                    <EditRowStyle BackColor="LightSteelBlue" />
                    <FooterStyle BackColor="#34495E" Font-Bold="True" ForeColor="White"  />
                    <HeaderStyle BackColor="#34495E" Font-Bold="True" ForeColor="White"  />
                    <PagerStyle BackColor="#34495E" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" Font-Size="Medium" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9EBEF" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>



                <asp:Label ID="Label_Current_User_Desc" runat="server" Text="Current User: " Font-Bold="true"></asp:Label>
                <asp:Label ID="Label_Current_User_Name" runat="server"></asp:Label>
                <asp:Label ID="Label_Message" runat="server"></asp:Label>
                <asp:Label ID="Label_Control_Selected_View" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="Label_Control_Use_Date_Filter" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="Label_Control_Start_Date_Filter" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="Label_Control_Finish_Date_Filter" runat="server" Visible="false"></asp:Label>




    <%---======================= Start Popup Edit or Delete Panel =======================---%>
    <asp:Panel ID="Panel_Calendar" runat="server" CssClass="modalPopup" style="display:none" HorizontalAlign="Left" Width="300px">

        <br />
        <table>

            <%-------------------- Display Page Heading -----------------%>
            <tr>
               <td style="width: 20px; height:30px"></td>
               <td colspan="2">
                   <asp:Label ID="Label_Panel_Heading" runat="server" Text="Select Scheduled Date" Font-Bold="true" ForeColor="Navy" Font-Size="Medium"></asp:Label>&nbsp&nbsp
                   <asp:Button ID="Button_Popup_Calendar_Cancel" runat="server" Text="X" BackColor="Black" Font-Bold="true" ForeColor="White" />
               </td>
               <td style="width: 20px"></td>
            </tr>

            <%-------------------- Display Blank Row -----------------%>
            <tr style="height:5px">
               <td style="width: 20px"></td>
               <td>&nbsp</td>
               <td>&nbsp</td>
               <td style="width: 20px"></td>
            </tr>

            <%---------------------- Edit / Display LMR Id ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td colspan="2">
                   <asp:Calendar ID="Calendar_Scheduled_Date" runat="server" OnSelectionChanged="Calendar_Scheduled_Date_SelectionChanged"  OnVisibleMonthChanged="Calendar_Scheduled_Date_VisibleMonthChanged" BackColor="#FFFFCC" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" Font-Size="Medium"></asp:Calendar>
               </td>
               <td style="width: 20px"></td>
            </tr>

        </table>
    </asp:Panel>
    <%------------- Finish Popup Edit Panel--------------%>


    <%---------------- Define Popup Benchmarking Details ---------------%>
    <asp:LinkButton ID="Button_Fake1" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="Popup_Calendar" runat="server" PopupControlID="Panel_Calendar" DropShadow="true" CancelControlID="Button_Popup_Calendar_Cancel"
         TargetControlID = "Button_Fake1" BackgroundCssClass="modalBackground" >
    </ajaxToolkit:ModalPopupExtender>
    <%------------------------------------------------------------------%>


    <%---======================= Start Popup Edit or Delete Panel =======================---%>
    <asp:Panel ID="Panel_Schedule_Edit" runat="server" CssClass="modalPopup" style="display:none" HorizontalAlign="Left" Width="700px">
        
        <br />
        <table>


            <%-------------------- Display Page Heading -----------------%>
            <tr>
               <td style="width: 20px; height:30px"></td>
               <td colspan="2">
                   <asp:Label ID="Label1" runat="server" Text="Schedule Details" Font-Bold="true" ForeColor="Navy" Font-Size="Large"></asp:Label>
                   &nbsp &nbsp <asp:Label ID="Label_Left_Bracket" runat="server" Text="("></asp:Label>
                   <asp:Label Id="Label_Popup_Edit_Schedule_Mode" runat="server" Font-Size="Small"></asp:Label>
                   <asp:Label ID="Label_Right_Bracket" runat="server" Text=")"></asp:Label>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%-------------------- Display Blank Row -----------------%>
            <tr style="height:5px">
                <td style="width: 20px"></td>
                <td>&nbsp</td>
                <td>&nbsp</td>
                <td style="width: 20px"></td>
            </tr>


            <%---------------------- Edit / Display Schedule Id ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Id" runat="server" Text="Schedule Id:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Schedule_Id" runat="server" Width="50px" Enabled="false"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%--------------------- Edit / Display Loco Number ---------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Loco_Number" runat="server" Text="Loco Number:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Loco_Number" runat="server" Width="120px"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%----------------------------- Edit / Task ---------------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Task" runat="server" Text="Task:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td>
                  <asp:DropDownList ID="DropDownList_Popup_Edit_Task" runat="server" DataSourceID="SqlDataSource_Tasks" DataTextField="Task_Code" DataValueField="Task_Code" Width="200px" Height="25px" AppendDataBoundItems="true" >
                      <asp:ListItem Text="" Value="" />
                  </asp:DropDownList>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%-------------------------- Edit / Display Notes ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Notes" runat="server" Text="Notes:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Notes" runat="server" Width="200px"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%------------------------- Edit / Display Depot ------------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Depot" runat="server" Text="Depot:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td>
                  <asp:DropDownList ID="DropDownList_Popup_Edit_Depot" runat="server" DataSourceID="SqlDataSource_Depots" DataTextField="Depot" DataValueField="Depot" Width="200px" Height="25px" AppendDataBoundItems="true" >
                      <asp:ListItem Text="" Value="" />
                  </asp:DropDownList>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%-------------------------- Edit / Scheduled Date ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Scheduled_Date" runat="server" Text="Scheduled Date:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Scheduled_Date" runat="server" Width="160px"></asp:TextBox>
                   <asp:ImageButton ID="Button_Popup_Edit_Calendar" runat="server" ImageUrl="~/Buttons/Calendar28x30.png" Height="18px" ImageAlign="AbsMiddle" OnClick="Button_Popup_Edit_Calendar_Click"  />
                   <asp:Calendar ID="Calendar_Popup_Edit_Scheduled_Date" runat="server" OnVisibleMonthChanged="Calendar_Popup_Edit_Scheduled_Date_VisibleMonthChanged" OnSelectionChanged="Calendar_Popup_Edit_Scheduled_Date_SelectionChanged" OnUnload="Calendar_Popup_Edit_Scheduled_Date_Unload"></asp:Calendar>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%-------------------------- Edit / Due Date ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Due_Date" runat="server" Text="Due Date:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Due_Date" runat="server" Width="160px"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%------------------------- Edit / Display Contract ------------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label3" runat="server" Text="Contract:" CssClass="Trax_Popup_Label" Width="160px"></asp:Label></td>
               <td>
                  <asp:DropDownList ID="DropDownList_Popup_Edit_Contract" runat="server" DataSourceID="SqlDataSource_Contracts" DataTextField="Contract_Code" DataValueField="Contract_Code" Width="200px" Height="25px" AppendDataBoundItems="true" >
                      <asp:ListItem Text="" Value="" />
                  </asp:DropDownList>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%---------------------- Edit / Display Work Type ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Work_Type" runat="server" Text="Work Type:" ForeColor="Navy" Font-Bold="true"></asp:Label></td>
               <td>
                  <asp:DropDownList ID="DropDownList_Popup_Edit_Work_Type" runat="server" SelectedValue='<%# Bind("Work_Type") %>' Width="200px" EnableViewState="False" Height="25px">
                      <asp:ListItem>Inspection</asp:ListItem>
                      <asp:ListItem>MPM</asp:ListItem>
                      <asp:ListItem>Repairs</asp:ListItem>
                      <asp:ListItem>Trip</asp:ListItem>
                      <asp:ListItem>Wheel Change</asp:ListItem>
                      <asp:ListItem>Wheel Turn</asp:ListItem>
                      <asp:ListItem></asp:ListItem>
                  </asp:DropDownList>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <%------------------------ Edit / Display Duration --------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Duration" runat="server" Text="Duration:" ForeColor="Navy" Font-Bold="true"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Duration" runat="server" Width="120px"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%-------------------------- Edit / Labour Hours ----------------------%>
            <tr>
               <td style="width:20px; height:35px"></td>
               <td><asp:Label ID="Label_Popup_Edit_Labour_Hours" runat="server" Text="Labour Hours:" ForeColor="Navy" Font-Bold="true"></asp:Label></td>
               <td><asp:TextBox ID="TextBox_Popup_Edit_Labour_Hours" runat="server" Width="120px"></asp:TextBox></td>
               <td style="width: 20px"></td>
            </tr>


            <%----------------- Blank Row ----------------%>
            <tr>
               <td style="width: 20px; height:5px "></td>
               <td>&nbsp</td>
               <td>&nbsp</td>
               <td style="width: 20px"></td>
               <td>&nbsp</td>
               <td>&nbsp</td>
               <td style="width: 20px"></td>
            </tr>


            <tr>
               <td style="width: 20px; height:30px"></td>
               <td colspan="2">
                  <asp:Button ID="Button_Popup_Edit_Save" runat="server" CssClass="Trax_Button" Text="Save" OnClick="Button_Popup_Edit_Save_Click" />
                  <asp:Button ID="Button_Popup_Edit_Cancel" runat="server" CssClass="Trax_Button" Text="Cancel" OnClientClick="return Hidepopup()"/>&nbsp
                  <asp:Label ID="Label_Popup_Edit_Message" runat="server" ForeColor="Red"></asp:Label>
               </td>
               <td style="width: 20px"></td>
            </tr>


            <tr>
               <td style="width: 20px; height:5px "></td>
               <td>&nbsp</td>
               <td>&nbsp</td>
               <td style="width: 20px"></td>
            </tr>


        </table>
    </asp:Panel>
    <%------------- Finish Popup Edit Panel--------------%>


    <%---------------- Define Popup Benchmarking Details ---------------%>
    <asp:LinkButton ID="Button_Fake2" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="Popup_Schedule_Edit" runat="server" PopupControlID="Panel_Schedule_Edit" DropShadow="true" CancelControlID="Button_Popup_Edit_Cancel" TargetControlID = "Button_Fake2" BackgroundCssClass="modalBackground" ></ajaxToolkit:ModalPopupExtender>
    <%------------------------------------------------------------------%>


    </div>


    <script src="Scripts/jquery-1.7.1.js"></script>
       <script language="javascript" >
          $(document).ready(function () {
          var gridHeader = $('#<%=GridView_Schedule_Week_View.ClientID%>').clone(true); // Here Clone Copy of Gridview with style
          $(gridHeader).find("tr:gt(0)").remove(); // Here remove all rows except first row (header row)
          $('#<%=GridView_Schedule_Week_View.ClientID%> tr th').each(function (i) {
          // Here Set Width of each th from gridview to new table(clone table) th 
          $("th:nth-child(" + (i + 1) + ")", gridHeader).css('width', ($(this).width()).toString() + "px");
          });
              $("#Div_Scrollable").append(gridHeader);
              $('#Div_Scrollable').css('position', 'absolute');
              $('#Div_Scrollable').css('top', $('#<%=GridView_Schedule_Week_View.ClientID%>').offset().top);
          });
    </script>


    <%--------------- SqlDatasource Filter Weeks -------------%>
    <asp:SqlDataSource ID="SqlDataSource_Filter_Weeks" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Id, Start FROM Weeks ORDER BY Start DESC">
    </asp:SqlDataSource>


    <%-------------- SqlDatasource Filter Depots -------------%>
    <asp:SqlDataSource ID="SqlDataSource_Filter_Depots" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Depot FROM Depots WHERE Active='Yes' ORDER BY Depot">
    </asp:SqlDataSource>


    <%------------- SqlDatasource Filter Contracts ------------%>
    <asp:SqlDataSource ID="SqlDataSource_Contracts" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Contract_Code FROM Contracts ORDER BY Contract_Code">
    </asp:SqlDataSource>


    <%------------- SqlDatasource Filter Customers -------------%>
    <asp:SqlDataSource ID="SqlDataSource_Filter_Customers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Customer_Id, Customer_Name FROM Customer WHERE Active='Yes' ORDER BY Customer_Name">
    </asp:SqlDataSource>


    <%------------ SqlDatasource Gridview Schedule ------------%>
    <asp:SqlDataSource ID="SqlDataSource_Schedule_Due" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="
        SELECT Sch.Active, Sch.Week_Start_Date, Sch.Row_Order, Sch.Row_Type, Sch.Sort_Date, Sch.Schedule_Id,
            Loco.Class_Code AS Class, Sch.Loco_Number,
            Sch.Task_Id, Sch.Task_Code, Sch.Notes, Sch.Due_Date, Sch.Depot, Sch.Scheduled_Date, Sch.Contract, Sch.Work_Type,
            Sch.Duration, Sch.Labour_Hours, Sch.Release_Date, Tasks.Task_Code AS Task_Code 
        FROM Schedule AS Sch
        LEFT JOIN Loco AS Loco ON Sch.Loco_Number=Loco.Number
        LEFT JOIN Tasks AS Tasks ON Sch.Task_Id=Tasks.Id
        WHERE Sch.Active='Yes' AND (Sch.Row_Type='Week' OR Sch.Row_Type='Row') ORDER BY Sch.Week_Start_Date, Sch.Row_Order, Sch.Row_Type, Sch.Sort_Date, Sch.Loco_Number" 
        UpdateCommand="UPDATE Schedule SET Active='Yes' WHERE Schedule_Id=@Schedule_Id" >
        <SelectParameters>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Schedule_Id" Type="Int32"/>
            <asp:Parameter Name="Depot" Type="String"/>
            <asp:Parameter Name="Duration" Type="Decimal"/>
            <asp:Parameter Name="Labour_Hours" Type="Decimal"/>
            <asp:Parameter Name="Scheduled_Date" DbType="DateTime2"/>
        </UpdateParameters>
    </asp:SqlDataSource>


    <%------------ SqlDatasource Gridview Depot View ------------%>
    <asp:SqlDataSource ID="SqlDataSource_Schedule_Depot_View" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="
        SELECT Sch.Active, Sch.Week_Start_Date, Sch.Row_Order, Sch.Row_Type, Sch.Sort_Date, Sch.Schedule_Id,
           Loco.Class_Code AS Class, Sch.Loco_Number,
           Sch.Task_Id, Sch.Task_Code, Sch.Notes, Sch.Due_Date, Sch.Depot, Sch.Scheduled_Date, Sch.Contract, Sch.Work_Type,
           Sch.Duration, Sch.Labour_Hours, Sch.Release_Date, Tasks.Task_Code AS Task_Code
        FROM Schedule AS Sch
        LEFT JOIN Loco AS Loco ON Sch.Loco_Number = Loco.Number
        LEFT JOIN Tasks AS Tasks ON Sch.Task_Id = Tasks.Id
        WHERE Sch.Active='Yes' AND (@Use_Date_Filter='No' OR Sch.Due_Date >= @Start_Date) AND (@Use_Date_Filter='No' OR Sch.Due_Date <= @Finish_Date) AND (@Depot_Filter='All' OR Sch.Depot=@Depot_Filter) AND (@Filter_Loco='' OR @Filter_Loco=Sch.Loco_Number) ORDER BY Sch.Week_Start_Date, Sch.Depot, Sch.Row_Order, Sch.Row_Type, Sch.Sort_Date, Sch.Loco_Number" 
        UpdateCommand="UPDATE Schedule SET Depot=@Depot, Duration=@Duration, Labour_Hours=@Labour_Hours, Scheduled_Date=@Scheduled_Date WHERE Schedule_Id=@Schedule_Id">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label_Control_Use_Date_Filter" Name="Use_Date_Filter" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:ControlParameter ControlID="Label_Control_Start_Date_Filter" Name="Start_Date" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="false"/>
            <asp:ControlParameter ControlID="Label_Control_Finish_Date_Filter" Name="Finish_Date" PropertyName="Text" Type="DateTime" ConvertEmptyStringToNull="false"/>
            <asp:ControlParameter ControlID="DropDownList_Filter_Depot" Name="Depot_Filter" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:ControlParameter ControlID="DropDownList_Filter_Customer" Name="Filter_Customer" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="false"/>
            <asp:ControlParameter ControlID="TextBox_Filter_Loco" Name="Filter_Loco" PropertyName="Text" Type="String" ConvertEmptyStringToNull="false"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Schedule_Id" Type="Int32"/>
            <asp:Parameter Name="Depot" Type="String"/>
            <asp:Parameter Name="Duration" Type="Decimal" />
            <asp:Parameter Name="Labour_Hours" Type="Decimal" />
            <asp:Parameter DbType="DateTime2" Name="Scheduled_Date" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <%-------------------- SqlDatasource Select Tasks -----------------%>
    <asp:SqlDataSource ID="SqlDataSource_Tasks" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Id, Loco_Class, Task_Code FROM Tasks ORDER BY Loco_Class, Task_Code">
    </asp:SqlDataSource>


    <%-------------- SqlDatasource Filter Depots -------------%>
    <asp:SqlDataSource ID="SqlDataSource_Depots" runat="server" 
        ConnectionString="<%$ ConnectionStrings:LocoTraxConnectionString %>" 
        SelectCommand="SELECT Depot FROM Depots WHERE Active='Yes' ORDER BY Depot">
    </asp:SqlDataSource>


</asp:Content>

