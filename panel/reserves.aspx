<%@ Page Title="" Language="C#" MasterPageFile="~/panel/PanelSite1.Master" AutoEventWireup="true" CodeBehind="reserves.aspx.cs" Inherits="DoctorYab.panel.reserves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-xl-9 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
        <h5 class="mb-0">لیست رزروها</h5>
        <div class="row">
            <div class="col-12 mt-4 pt-2">
                <div class="table-responsive shadow rounded">
                    <table class="table table-center bg-white mb-0">
                        <thead>
                            <tr>
                                <th class="py-2 border-bottom">کد پیگیری</th>
                                 <th class="text-center py-2 border-bottom">تاریخ </th>
                                <th class="py-2 border-bottom" style="min-width: 220px;"> مدت زمان </th>
                                <th class="text-center py-2 border-bottom" style="min-width: 180px;">نام  بیمار </th>
                                <th class="text-center py-2 border-bottom">تلفن</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Start -->
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Eval("rTrackingCode") %> </td>
                                        <td class="py-3">
                                            <a href="#" class="text-primary">
                                                <div class="d-flex align-items-center">
                                                    <span class="me-2"><%#Eval("persianDate") %></span>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="text-center"><%#Eval("rTime") %> دقیقه</td>
                                        <td class="text-center"><%#Eval("rName") %> </td>
                                        <td class="text-center"><%#Eval("rPhonenumber") %> </td>
                                        
                                    </tr>
                                    <!-- End -->
                                </ItemTemplate>
                            </asp:ListView>

                        </tbody>
                    </table>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="12" class="pagination">
                        <Fields>
                            <asp:NumericPagerField ButtonCount="5" CurrentPageLabelCssClass="active" ButtonType="Link" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </div>
        <!--end row-->

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
            SelectCommand="panel_selectReserves" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="doctorId" SessionField="doctorId" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>


    </div>

    <script src="assets/js/bootstrap.bundle.min.js"></script>

</asp:Content>
