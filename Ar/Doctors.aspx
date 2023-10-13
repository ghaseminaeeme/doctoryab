<%@ Page Title="" Language="C#" MasterPageFile="~/Ar/ArSite1.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="DoctorYab.Ar.Doctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlBreadcrumb" CssClass="w-100">
                    <ItemTemplate>
                        <div class="col-md-6 pull-right">
                            <div class="page-title">
                                <h1>قائمة الأطباء <%#Eval("branch") %></h1>
                            </div>
                        </div>
                        <div class="col-md-6 bc-path">
                            <ol class="breadcrumb justify-content-md-end">
                                <li class="breadcrumb-item"><a href="default.aspx">اللغة العربية</a></li>
                                <li class="breadcrumb-item active">قائمة الأطباء <%#Eval("searchStr") %></li>
                            </ol>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlBreadcrumb" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="selectArabicDoctorBreadcrumb" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="city" QueryStringField="city" Type="Int32" DefaultValue="0" />
                        <asp:QueryStringParameter DefaultValue="0" Name="branch" QueryStringField="branch" Type="Int32" />
                        <%--<asp:QueryStringParameter DefaultValue=" " Name="name" QueryStringField="name" Type="String" />--%>
                        <asp:CookieParameter Name="name" CookieName="name" DefaultValue=" " DbType="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">

                    <div class="row shop_container grid">
                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDoctors">
                            <ItemTemplate>
                                <div class="col-md-4 col-6">
                                    <div class="product">
                                        <div class="product_img">
                                            <a href="DoctorDetail.aspx?did=<%#Eval("id") %>">
                                                <img src='<%#Eval("dImg") %>' alt="<%#Eval("dArName") %>">
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                        <div class="product_info">
                                            <h6 class="product_title"><a href="DoctorDetail.aspx?did=<%#Eval("id") %>"><%#Eval("dArName") %></a></h6>
                                            <div class="product_price">
                                                <span class="price"><%#Eval("bArSubject") %></span>
                                            </div>
                                            <div class="rating_wrap">
                                                <%#Eval("cArName") %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <p>لم يتم العثور على العناصر</p>
                            </EmptyDataTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="SqlDoctors" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                            SelectCommand="selectArabicDoctors" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="city" QueryStringField="city" Type="Int32" />
                                <asp:QueryStringParameter DefaultValue="0" Name="branch" QueryStringField="branch" Type="Int32" />
                                <asp:CookieParameter Name="name" CookieName="name" DefaultValue=" " DbType="String" />
                                <%--<asp:QueryStringParameter DefaultValue=" " Name="name" QueryStringField="name" Type="String" />--%>
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                    <div class="row">
                        <div class="col-12">
                            <ul class="pagination mt-3 justify-content-center pagination_style1">
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#"><i class="linearicons-arrow-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 order-lg-first mt-4 pt-2 mt-lg-0 pt-lg-0">
                    <div class="sidebar">
                            <asp:Panel ID="Panel1" runat="server" DefaultButton="LinkButton1">
                                <div class="widget">
                                    <div class="search_form">
                                        <asp:TextBox ID="TxtName" runat="server" class="form-control" placeholder="بحث..."></asp:TextBox>
                                    </div>
                                </div>
                                <div class="widget">
                                    <div class="custom_select">
                                        <asp:DropDownList ID="DrdCity" runat="server" class="first_null" AppendDataBoundItems="true" DataSourceID="SqlCity" DataTextField="cArName" DataValueField="id">
                                            <asp:ListItem Value="0" Text="كل المدن"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT [id], [cArName] FROM [TblCity] WHERE ([cIsDeleted] &lt;&gt; @cIsDeleted) ORDER BY [cArName]">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="true" Name="cIsDeleted" Type="Boolean" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="widget">
                                    <div class="custom_select">
                                        <asp:DropDownList ID="DrdBranch" runat="server" class="first_null" AppendDataBoundItems="True" DataSourceID="SqlBranch" DataTextField="bArSubject" DataValueField="id">
                                            <asp:ListItem Value="0" Text="جميع التخصصات"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlBranch" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>" SelectCommand="SELECT [id], [bArSubject] FROM [TblBranch] WHERE ([bIsDeleted] &lt;&gt; @bIsDeleted) ORDER BY [bArSubject]">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="true" Name="bIsDeleted" Type="Boolean" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="widget">
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn-filter">منقي</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="Button2_Click" CssClass="btn-anti-filter">إزالة المرشحات</asp:LinkButton>
                                </div>
                            </asp:Panel>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
