<%@ Page Title="" Language="C#" MasterPageFile="~/panel/PanelSite1.Master" AutoEventWireup="true" CodeBehind="appointments.aspx.cs" Inherits="DoctorYab.panel.appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="col-xl-9 col-lg-8 col-md-7 mt-4 pt-2 mt-sm-0 pt-sm-0">
        <h5 class="mb-0">لیست نوبت های آینده</h5>
        <div class="row">
            <div class="col-12 mt-4 pt-2">
                <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                <asp:Label ID="success" runat="server" Text="عملیات با موفقیت انجام شد. " CssClass="lb-suc" Visible="false"></asp:Label>
                <div class="table-responsive shadow rounded">
                    <table class="table table-center bg-white mb-0">
                        <thead>
                            <tr>
                                <th class="py-1 border-bottom">ردیف</th>
                                <th class="py-2 border-bottom">کد مشترک</th>
                                <th class="py-2 border-bottom" style="min-width: 220px;">زمان </th>
                                <th class="text-center py-2 border-bottom" style="min-width: 180px;">شیفت </th>
                                <th class="text-center py-2 border-bottom">وضعیت</th>
                                <th class="text-center py-2 border-bottom">جزییات</th>
                                <th class="text-end py-2 border-bottom" style="min-width: 200px;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Start -->
                            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlAptm" OnItemCommand="ListView1_ItemCommand">
                                <ItemTemplate>


                                    <tr>
                                        <td><%#Eval("row") %></td>
                                        <td><%#Eval("aGroupCode") %> </td>
                                        <td class="py-3">
                                            <a href="#" class="text-primary">
                                                <div class="d-flex align-items-center">
                                                    <span class="me-2"><%#Eval("persianDate") %> - <%#Eval("aTime") %> دقیقه</span>
                                                </div>
                                            </a>
                                        </td>
                                        <td class="text-center"><%#Eval("aShift") %></td>
                                        <td class="text-center">
                                            <div class='badge rounded px-3 py-1 <%#Convert.ToString(Eval("aStatus")) == "1" ? " bg-soft-danger" : "bg-soft-success" %>'>
                                                <%#Eval("statusDes") %>
                                            </div>
                                        </td>
                                        <td class="text-end">
                                            <a href='#' class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#view-invoice" data-id='<%# Eval("aptId") %>'>جزئیات</a>

                                            <asp:LinkButton ID="btnDel" runat="server" class="btn btn-sm btn-outline-primary ms-2" CommandName="Delete" CommandArgument='<%# Eval("aptId")%>'
                                                OnClientClick="return myConfirm();">حذف</asp:LinkButton>
                                        </td>
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

        <asp:SqlDataSource ID="SqlAptm" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
            SelectCommand="panel_selectAppointment_v1" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="doctorId" SessionField="doctorId" Type="Int32" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="modal fade" id="view-invoice" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">جزییات این نوبت</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <asp:HiddenField ID="modalRowId" runat="server" />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="pt-4 border-top">
                                    <div class="row">
                                        <div class="col-lg-8 col-md-6">
                                            <h5 class="text-muted fw-bold">وضعیت <span class='badge  badge-pill  fw-normal ms-2 <%#Convert.ToString(Eval("aStatus")) == "1" ? " bg-soft-danger" : "bg-soft-success" %>'><%#Eval("statusDes") %></span></h5>
                                            <h6>کد رزرو :   <%#Eval("aTrackingCode") %>  </h6>
                                            <p></p>
                                        </div>
                                        <!--end col-->

                                        <div class="col-lg-4 col-md-6 mt-4 mt-sm-0 pt-2 pt-sm-0">
                                            <ul class="list-unstyled">
                                                <li class="d-flex mt-2">
                                                    <small class="mb-0 text-muted">مدت ملاقات : </small>
                                                    <small class="mb-0 text-dark">&nbsp;&nbsp;<%#Eval("aTime") %></small></li>

                                                <li class="d-flex mt-2">
                                                    <small class="mb-0 text-muted">تاریخ ملاقات: </small>
                                                    <small class="mb-0 text-dark">&nbsp;&nbsp;<%#Eval("persianDate") %></small></li>

                                                <li class="d-flex mt-2">
                                                    <small class="mb-0 text-muted">نام بیمار :  </small>
                                                    <small class="mb-0 text-dark">&nbsp;&nbsp;<%#Eval("rName") %></small></li>
                                                <li class="d-flex mt-2">
                                                    <small class="mb-0 text-muted">تلفن بیمار :  </small>
                                                    <small class="mb-0 text-dark">&nbsp;&nbsp;<%#Eval("rPhonenumber") %></small></li>
                                            </ul>
                                        </div>
                                        <!--end col-->
                                    </div>
                                    <!--end row-->

                                </div>

                            </ItemTemplate>
                        </asp:FormView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="panel_selectAppointment_detail" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="modalRowId" Name="appointmentId" PropertyName="value" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>



            <script>
                function myConfirm() {
                    return confirm("توجه کنید نوبت هایی که رزرو شده اند قابل حذف نیستند. آیا از حذف این نوبت اطمینان دارید؟");
                }
            </script>



        </div>

    </div>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
</asp:Content>
