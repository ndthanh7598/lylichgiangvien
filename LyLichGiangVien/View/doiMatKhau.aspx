﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="doiMatKhau.aspx.cs" Inherits="LyLichGiangVien.View.doiMatKhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <div class="welcome-text text-center">
                        <p style="font-size: 40px; margin-top: 40px; margin-bottom: 20px;"> Đổi Mật Khẩu</p>
                    </div>
                </div>
                
                <div class="col-md-5 col-md-offset-2">
                    <div class="block-content block-content-full bg-primary-light" style="height: 100vh; text-align: center;">
                         <form class="form-horizontal" method="POST" runat="server">
                                <fieldset>
                                    <div class="form-group">
                                        <label class="control-label col-md-4" for="TenDeTai">Tên Đăng Nhâp:</label>
                                    <div class="col-md-8">
                                         <asp:TextBox ID="tenDangNhap" CssClass="form-control" runat="server"  ReadOnly="true"></asp:TextBox>
                                    </div>
                                       
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-4" for="TenDeTai">Mật Khẩu Cũ:</label>
                                    <div class="col-md-8">
                                         <asp:TextBox ID="txtMatKhauCu" TextMode="Password" CssClass="form-control" runat="server" placeholder="Mật khẩu Cũ"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtMatKhauCu" ErrorMessage="Not Empty!" ForeColor="Red" runat="server" CssClass="valerror" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                       
                                    </div>
                                     <div class="form-group">
                                         <label class="control-label col-md-4" for="TenDeTai">Mật Khẩu Mới:</label>
                                    <div class="col-md-8">
                                         <asp:TextBox ID="txtMatKhauMoi" TextMode="Password" CssClass="form-control" runat="server" placeholder="Mật khẩu Mới"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtMatKhauMoi" ErrorMessage="Not Empty!" ForeColor="Red" runat="server" CssClass="valerror" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                        
                                         </div>
                                     <div class="form-group">
                                         <label class="control-label col-md-4" for="TenDeTai">Nhập Lại:</label>
                                    <div class="col-md-8">
                                         <asp:TextBox ID="txtNhapLai" TextMode="Password" CssClass="form-control" runat="server" placeholder="Nhập lại mật khẩu mới"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtNhapLai" ErrorMessage="Not Empty!" ForeColor="Red" runat="server" CssClass="valerror" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ControlToValidate="txtNhapLai" ControlToCompare="txtMatKhauMoi"  ErrorMessage="Mật khẩu nhập lại phải giống nhau!" ForeColor="Red" runat="server" CssClass="valerror" Display="Dynamic"></asp:CompareValidator>
                                    </div>
                                        
                                     </div>
                                    <div class="col-md-12 text-center">
                                        <asp:Label ID="lblNoti" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <div class="col-md-6">
                                        <asp:Button ID="btnLogin" runat="server" Text="Đổi Mật Khẩu" OnClick="btnLogin_Click" CssClass="btn btn-md btn-success btn-block" />
                                    </div>
                                    <div class="col-md-6 text-center">
                                        <%--<asp:Button ID="btn1" runat ="server" Text="Hủy" CssClass="btn btn-md btn-primary btn-block" />--%>
                                        <a href="Welcome.aspx" class="btn btn-md btn-primary btn-block">Huỷ</a>
                                    </div>
                                    
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>    
</asp:Content>