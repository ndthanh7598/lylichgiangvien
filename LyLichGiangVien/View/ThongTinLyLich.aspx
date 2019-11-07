<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="ThongTinLyLich.aspx.cs" Inherits="LyLichGiangVien.View.ThongTinLyLich" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Lý lịch khoa học</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Thông tin lý lịch khoa học
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <form method="post" runat="server" class="form-horizontal">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Đơn vị</label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlDonVi" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Tên giảng viên</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="tenGV" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Giới tính</label>
                                        <div class="col-md-9">
                                            <asp:RadioButtonList ID="gtGV" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="Nam">Nam</asp:ListItem>
                                                <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Ngày sinh</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="ngaySinhGV" TextMode="Date" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Địa chỉ</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="diaChiGV" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Số điện thoại</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="sdtGV" MaxLength="10" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Email</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="emailGV" TextMode="Email" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Học hàm</label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlHocHam" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Học vị</label>
                                        <div class="col-md-9">
                                            <asp:DropDownList ID="ddlHocVi" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3">Tên đề tài nghiên cứu</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="deTaiNC" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Ngày bắt đầu</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="namBatDau" TextMode="Date" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Ngày kết thúc</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="namKetThuc" TextMode="Date" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label-left">Giải thưởng</label>
                                        <div class="col-md-9">
                                            <asp:TextBox ID="giaiThuong" runat="server" CssClass="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-right">
                                        <asp:Label ID="lblDaDuyet" CssClass="text-success" runat="server"></asp:Label>
                                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Lưu" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>