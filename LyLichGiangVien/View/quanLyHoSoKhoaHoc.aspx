<%@ Page Title="" Language="C#" MasterPageFile="~/Layout/App.Master" AutoEventWireup="true" CodeBehind="quanLyHoSoKhoaHoc.aspx.cs" Inherits="LyLichGiangVien.View.quanLyHoSoKhoaHoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container">
         <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Quản lý hồ sơ khoa học</h1>
            </div>
        </div>
        <form class="form-inline" runat="server">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="tengv" class="col-md-4">Tên Giảng Viên:</label>
                    <div class="col-md-5">
                        <asp:TextBox ID="tenGV" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <asp:Button ID="btnTimKiem" runat="server" CssClass="btn btn-primary" Text="Tìm Kiếm" OnClick="btnTimKiem_Click" />
                    </div>
                </div>
            </div>
        </form>
        <div class="row">
            <div class="col-md-11 text-center" style="margin-top: 15px;">
                <asp:GridView ID="gridView_lyLich" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" CellPadding="3" GridLines="Vertical"
            DataKeyNames="" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px"  PageSize="3">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="TenGV" HeaderText="Tên GV"  />
                <asp:TemplateField HeaderText="Ngày Sinh">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("NgaySinh","{0:dd/MM/yyyy}") %>' DataFormatString="{0:dd/MM/yyyy}" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Giới tính">
                    <ItemTemplate>
                        <asp:Label Text='<%# Eval("GioiTinh").ToString().Equals("Nữ") ? "Nữ" : "Nam" %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ"  />
                <asp:BoundField DataField="SDT" HeaderText="SĐT" />
                <asp:BoundField DataField="Email" HeaderText="Email"  />
                <asp:BoundField DataField="TenDeTaiNC" HeaderText="Tên Đề Tài"  />
                <asp:BoundField DataField="TenHH" HeaderText="Học Hàm"  />
                <asp:BoundField DataField="TenHV" HeaderText="Học Vị"  />
                <asp:BoundField DataField="TenDV" HeaderText="Đơn Vị"  />
                 <asp:BoundField DataField="GiaiThuong" HeaderText="Giải Thưởng"  />
              
                <asp:TemplateField HeaderText="Duyệt">
                    <ItemTemplate>
                       <a href="quanLyHoSoKhoaHoc.aspx?magv=<%# Eval("MaGV") %>&tt=<%# Eval("TrangThai") %>&func=duyet"><%# Eval("TrangThai").ToString().Equals("chuaduyet") ? " Chưa Duyệt" : "Đã Duyệt" %></a>
                        </ItemTemplate>
                </asp:TemplateField>
                
                <%--<asp:TemplateField>
                    <ItemTemplate>
                        <a href="SuaLyLich.aspx?func=sua&mabs=<%# Eval("Magv") %>">Sửa</a>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            
        </asp:GridView>
                </div>




                </div>
</div>
</asp:Content>