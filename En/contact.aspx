<%@ Page Title="" Language="C#" MasterPageFile="~/En/Site1En.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="DoctorYab.En.contact" %>

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
                        <li class="breadcrumb-item active"><a href="contact.aspx">Contact</a></li>
                    </ol>
                </div>
                <div class="col-md-6 pull-right">
                    <div class="page-title">
                        <h1>Contact Us</h1>
                    </div>
                </div>
               
            </div>
        </div>
        <!-- END CONTAINER-->
    </div>

    <!-- START SECTION CONTACT -->
    <div class="section pb_70">
        <div class="container">
            <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlAbout" CssClass="w-100">
                <ItemTemplate>
                    <div class="row">

                        <div class="col-xl-4 col-md-6">
                            <div class="contact_wrap contact_style3">
                                <div class="contact_icon">
                                    <i class="linearicons-map2"></i>
                                </div>
                                <div class="contact_text">
                                    <span>Address</span>
                                    <p><%#Eval("aEnAddress") %></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="contact_wrap contact_style3">
                                <div class="contact_icon">
                                    <i class="linearicons-envelope-open"></i>
                                </div>
                                <div class="contact_text">
                                    <span>Email</span>
                                    <a href='mailto:<%#Eval("aEmail") %>'><%#Eval("aEmail") %> </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="contact_wrap contact_style3">
                                <div class="contact_icon">
                                    <i class="linearicons-tablet2"></i>
                                </div>
                                <div class="contact_text">
                                    <span>Tel</span>
                                    <p><%#Eval("aMobile") %>  <%#Eval("aTel") %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlAbout" runat="server" ConnectionString="<%$ ConnectionStrings:DbWebSiteConnectionString %>"
                SelectCommand="SELECT * FROM [TblAbout] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="id" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
    <!-- END SECTION CONTACT -->

    <!-- START SECTION CONTACT -->
    <div class="section pt-0">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="heading_s1">
                        <h2>Contact Us</h2>
                    </div>
                    <p class="leads">Get in touch with us via the form below and send your comments and message.</p>
                    <div class="field_form">
                        <asp:Panel ID="Panel2" runat="server" DefaultButton="LinkButton1">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <asp:Label ID="error" runat="server" Text="Sorry! An error occure, Please try again." CssClass="lb-err" Visible="false"></asp:Label>
                                        <asp:Label ID="success" runat="server" Text="Your message sent successfully " CssClass="lb-suc" Visible="false"></asp:Label>

                                        <div class="form-group col-md-12">
                                            <asp:TextBox ID="TxtName" runat="server" placeholder="Name" class="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <asp:TextBox ID="TxtTel" runat="server" placeholder="Tel " class="form-control"></asp:TextBox>
                                        </div>
                                        <%-- <div class="form-group col-md-12">
                                                <asp:TextBox ID="TxtSub" runat="server" placeholder="موضوع را وارد کنید" class="form-control"></asp:TextBox>
                                            </div>--%>
                                        <div class="form-group col-md-12">
                                            <asp:TextBox ID="TxtDes" runat="server" placeholder="Message *" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                        <div class="col-md-12">
                                            <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-fill-out" title="Send!" OnClick="LinkButton1_Click">Send</asp:LinkButton>
                                        </div>
                                        <div class="col-md-12">
                                            <div id="alert-msg" class="alert-msg text-center">
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="LinkButton1" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>
                    </div>
                </div>
                <div class="col-lg-6 pt-2 pt-lg-0 mt-4 mt-lg-0">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3214.4378689859564!2d59.52736931462542!3d36.325936301952815!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzbCsDE5JzMzLjQiTiA1OcKwMzEnNDYuNCJF!5e0!3m2!1sen!2s!4v1611414721283!5m2!1sen!2s" width="600" height="450" frameborder="0" style="border: 0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- END SECTION CONTACT -->

</asp:Content>
