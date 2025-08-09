<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="reserve.aspx.cs" Inherits="DoctorYab.reserve1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDoctor" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6">
                            <div class="page-title">
                                <h1>رزرو نوبت </h1>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="/">خانه</a></li>
                                <li class="breadcrumb-item"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dName") %></a></li>
                                <li class="breadcrumb-item active">رزرو نوبت </li>
                            </ol>
                        </div>
                    </ItemTemplate>
                </asp:FormView>

                <asp:SqlDataSource ID="SqlDoctor" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="selectDoctorDetail" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="did" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>
        </div>
        <!-- END CONTAINER-->
    </div>


    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <h4 class="title mb-3">رزرو نوبت برای تاریخ <%#Eval("persianDate") %> ، ساعت  <%#Eval("startTime") %></h4>
        </ItemTemplate>
    </asp:FormView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
        SelectCommand="selectAppointmentDetail" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>




    <div class="section pt-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="heading_s1">
                        <h2>تماس با ما</h2>
                    </div>
                    <p class="leads">از طریق فرم زیر و ارسال نظر و پیام خود، با ما در ارتباط باشید.</p>
                    <div class="field_form">

                        <asp:Panel ID="Panel2" runat="server" DefaultButton="Button1" class="form contact-us-form">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="error" runat="server" Text="متاسفانه خطایی رخ داد. لطفا مجددا سعی نمایید" CssClass="lb-err" Visible="false"></asp:Label>
                                    <asp:Label ID="success" runat="server" Text=" " CssClass="lb-suc" Visible="false"></asp:Label>

                                    <div class="form-group">
                                        <label for="username">نام شما</label>
                                        <asp:TextBox ID="TxtName" runat="server" placeholder="نام و نام خانوادگی خود را وارد کنید" class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="v1" CssClass="validator" runat="server" ErrorMessage="نام و نام خانوادگی الزامی است." ControlToValidate="TxtName" ValidationGroup="save"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="email_1">تلفن</label>
                                        <asp:TextBox ID="TxtTel" runat="server" placeholder="شماره تماس خود را وارد کنید " class="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="v2" CssClass="validator" runat="server" ErrorMessage="شماره تماس الزامی است." ControlToValidate="TxtTel" ValidationGroup="save"></asp:RequiredFieldValidator>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" Text="رزرو نوبت" class="btn btn-dark btn-rounded" OnClientClick="return confirm('آیا از ثبت نوبت اطمینان دارید؟')" OnClick="LinkButton1_Click" ValidationGroup="save" />
                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-dark btn-rounded" OnClientClick="return confirm('آیا از ثبت نوبت اطمینان دارید؟')" OnClick="LinkButton1_Click" ValidationGroup="save">رزرو نوبت</asp:LinkButton>--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>

                    </div>
                </div>

            </div>
        </div>
    </div>








</asp:Content>



