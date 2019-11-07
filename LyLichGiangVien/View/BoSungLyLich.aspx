<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="BoSungLyLich.aspx.cs" Inherits="LyLichGiangVien.View.BoSungLyLich" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form method="POST" class="form-horizontal" runat="server" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">Bổ sung lý lịch khoa học</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Danh sách lý lịch bổ sung
                        </div>
                        <div class="panel-body">
                            <div class="text-center">
                                <asp:Label ID="lblNoti" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered table-stripped">
							        <thead>
								        <tr>
									        <th class="text-center">STT</th>
									        <th class="text-center">Tên đề tài nghiên cứu</th>
									        <th class="text-center">Ngày bắt đầu</th>
									        <th class="text-center">Ngày kết thúc</th>
									        <th class="text-center">Giải thưởng</th>
									        <th class="text-center">Thời gian bổ sung</th>
                                            <th class="text-center">Trạng thái</th>
									        <th class="text-center">Tác vụ</th>
								        </tr>
							        </thead>
							        <tbody>
                                        <asp:Repeater ID="rptLyLich" runat="server">
                                            <ItemTemplate>
                                                <tr>
										            <td class="text-center"><%# Container.ItemIndex+1 %></td>
										            <td class="left"><%# Eval("TenDeTaiNC") %></td>
										            <td class="text-center"><%# Eval("NamBatDau", "{0:dd/MM/yyyy}") %></td>
										            <td class="text-center"><%# Eval("NamKetThuc", "{0:dd/MM/yyyy}") %></td>
										            <td class="left"><%# Eval("GiaiThuong") %></td>
										            <td class="text-center"><%# Eval("ThoiGianBS", "{0:dd/MM/yyyy}") %></td>
										            <td class="text-center">
                                                        <label class='label label-<%# LabelTrangThai(Eval("TrangThai").ToString()) %>'><%# NameTrangThai(Eval("TrangThai").ToString()) %></label>
										            </td>
											        <td class="left">
												        <asp:LinkButton ID="btnFix" CssClass="btn btn-xs btn-warning" ToolTip="Sửa lý lịch" runat="server" OnClick="btnFix_Click" Visible='<%# View(Eval("TrangThai").ToString()) %>' CommandArgument='<%# Eval("MaBS") %>'><i class="fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-xs btn-danger" ToolTip="Xoá lý lịch" runat="server" OnClick="btnDelete_Click" Visible='<%# View(Eval("TrangThai").ToString()) %>' OnClientClick="return confirm('Bạn có chắc chắn xoá lý lịch?')" CommandArgument='<%# Eval("MaBS") %>'><i class="fa fa-times" aria-hidden="true"></i></asp:LinkButton>
											        </td>
									            </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
							        </tbody>
						        </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" id="titleForm" runat="server">
                            Bổ sung lý lịch
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4">Tên đề tài nghiên cứu</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="tenDeTai" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label-left">Ngày bắt đầu</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="namBatDau" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label-left">Giải thưởng</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="giaiThuong" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-4 control-label-left">Ngày kết thúc</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="namKetThuc" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="pull-right">
                                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Lưu" />
                                        <asp:Button ID="btnSaveFix" Visible="false" runat="server" CssClass="btn btn-primary" OnClick="btnSaveFix_Click" Text="Lưu" />
                                        <asp:Button ID="btnHuy" Visible="false" runat="server" CssClass="btn btn-default" OnClick="btnHuy_Click" Text="Huỷ" ToolTip="Huỷ chỉnh sửa" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <style>
        .control-label-left{
            padding-top: 7px;
            margin-bottom: 0;
            text-align: left;
        }
    </style>
</asp:Content>