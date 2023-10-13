<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="datepicker.aspx.cs" Inherits="_DoctorYab.Admin.datepicker" %>

<%@ Register Assembly="IR.Web.UI.PersianDatePicker" Namespace="IR.Web.UI.PersianDatePicker" TagPrefix="ir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/clndr.css" rel="stylesheet" />
    <script src="../js/clndr.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="panel-body">
                <div class="form-group col-md-6 col-xs-12 pull-right">
                    <label>تاریخ انقضا</label>
                    <ir:PDatePicker ID="PDatePicker1"  FormatDate="YYYY/MM/DD" class="datepicker form-control" runat="server" Theme="dark" placeholder="تاریخ شروع"></ir:PDatePicker>
                    <asp:Button ID="Button1" runat="server" Text="convet to georgia" OnClick="Button1_Click" />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    <br /><br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <asp:Button ID="Button2" runat="server" Text="convert to persian" OnClick="Button2_Click" />

                </div>
            </div>
        </div>
    </div>
    <script src="../js/jquery/jquery.js"></script>
</asp:Content>
