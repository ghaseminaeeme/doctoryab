<%@ Page Title="" Language="C#" MasterPageFile="~/En/Site1En.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="DoctorYab.En.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="breadcrumb_section bg_gray page-title-mini">
        <div class="container">
            <!-- STRART CONTAINER -->
            <div class="row align-items-center">
                <div class="col-md-6 bc-path">
                    <ol class="breadcrumb justify-content-md-end">
                        <li class="breadcrumb-item"><a href="default.aspx">Home</a></li>
                        <li class="breadcrumb-item active"><a href="about.aspx">About Us</a></li>
                    </ol>
                </div>
                <div class="col-md-6 pull-right">
                    <div class="page-title">
                        <h1>About Us</h1>
                    </div>
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
                                <img src='<%#Eval("aImg1") %>' alt="About Doctoryab" />
                            </div>
                        </div>
                        <div class="col-lg-6 pull-right">
                            <div class="heading_s1">
                                <h2>who are we</h2>
                            </div>
                            <%#Eval("aEnDescription") %>
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

    <div class="section bg_light_blue2 pb_70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    <div class="heading_s1 text-center">
                        <h2>What services do we offer you?</h2>
                    </div>
                    <p class="text-center leads">Doctoryab provides services in the field of medicine and treatment. Among the things that the Doctoryab site uses to provide better services, the following options can be mentioned.</p>
                </div>
            </div>
            <div class="row justify-content-center">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlService">
                    <ItemTemplate>
                        <div class="col-lg-4 col-sm-6">
                            <div class="icon_box icon_box_style4 box_shadow1">
                                <div class="icon">
                                    <i class="ti-pencil-alt"></i>
                                </div>
                                <div class="icon_box_content">
                                    <h5><%#Eval("sSubject") %></h5>
                                    <p><%#Eval("sDes") %></p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlService" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                    SelectCommand="SELECT [id], [sSubject], [sDes], [sLanguage] FROM [TblAdvantage] WHERE ([sLanguage] = @sLanguage)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="sLanguage" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
