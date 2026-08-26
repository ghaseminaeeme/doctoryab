<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="appointment-guid.aspx.cs" Inherits="DoctorYab.appointment_guid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="page-title">
                        <h1>درباره ما</h1>
                    </div>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb justify-content-md-end">
                        <li class="breadcrumb-item"><a href="/">خانه</a></li>
                        <li class="breadcrumb-item active">راهنمای رزرو نوبت </li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>
    <div class="section">
        <div class="container">
            <div class="row align-items-center">
                <asp:FormView runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-lg-6 pull-right">
                            <div class="about_img scene mb-4 mb-lg-0">
                                <img src='' alt="نوبت دهی اینترنتی پزشکان در دکتریاب ایران" />
                            </div>
                        </div>
                        <div class="col-lg-6 pull-right">
                            <div class="heading_s1">
                                <h2>ما کی هستیم</h2>
                            </div>
                            <%#Eval("aDescription") %>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="SELECT * FROM [TblAbout] WHERE ([id] = @id)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
