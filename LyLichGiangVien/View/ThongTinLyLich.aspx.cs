using LyLichGiangVien.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LyLichGiangVien.View
{
    public partial class ThongTinLyLich : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["maGV"].ToString().Equals(""))
            {
                Response.Redirect("Login.aspx");
            }
            lblNoti.CssClass = Session["type"].ToString();
            lblNoti.Text = Session["mess"].ToString();
            Session["type"] = "";
            Session["mess"] = "";
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                if (!IsPostBack)
                {
                    int maGV = Convert.ToInt32(Session["maGV"].ToString());

                    SqlCommand cmd = new SqlCommand("get_donvi", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter data = new SqlDataAdapter(cmd))
                    {
                        DataSet table = new DataSet();
                        data.Fill(table);
                        ddlDonVi.DataSource = table;
                        ddlDonVi.DataTextField = "TenDV";
                        ddlDonVi.DataValueField = "MaDV";
                        ddlDonVi.DataBind();
                    }

                    cmd = new SqlCommand("get_hocham", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter data = new SqlDataAdapter(cmd))
                    {
                        DataSet table = new DataSet();
                        data.Fill(table);
                        ddlHocHam.DataSource = table;
                        ddlHocHam.DataTextField = "TenHH";
                        ddlHocHam.DataValueField = "MaHH";
                        ddlHocHam.DataBind();
                    }

                    cmd = new SqlCommand("get_hocvi", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter data = new SqlDataAdapter(cmd))
                    {
                        DataSet table = new DataSet();
                        data.Fill(table);
                        ddlHocVi.DataSource = table;
                        ddlHocVi.DataTextField = "TenHV";
                        ddlHocVi.DataValueField = "MaHV";
                        ddlHocVi.DataBind();
                    }

                    cmd = new SqlCommand("get_thongtingiangvien", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@maGV", maGV);
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        while (rd.Read())
                        {
                            tenGV.Text = rd["TenGV"].ToString();
                            if (rd["GioiTinh"].Equals("Nam"))
                            {
                                gtGV.SelectedIndex = 0;
                            }
                            else
                            {
                                gtGV.SelectedIndex = 1;
                            }
                            ngaySinhGV.Text = Convert.ToDateTime(rd["NgaySinh"].ToString()).ToString("yyyy-MM-dd");
                            diaChiGV.Text = rd["DiaChi"].ToString();
                            sdtGV.Text = rd["SDT"].ToString();
                            emailGV.Text = rd["Email"].ToString();
                            ddlDonVi.Items.FindByValue(Convert.ToInt32(rd["MaDV"]).ToString()).Selected = true;
                            ddlHocHam.Items.FindByValue(Convert.ToInt32(rd["MaHH"]).ToString()).Selected = true;
                            ddlHocVi.Items.FindByValue(Convert.ToInt32(rd["MaHV"]).ToString()).Selected = true;
                            deTaiNC.Text = rd["TenDeTaiNC"].ToString();
                            namBatDau.Text = Convert.ToDateTime(rd["NamBatDau"].ToString()).ToString("yyyy-MM-dd");
                            namKetThuc.Text = Convert.ToDateTime(rd["NamKetThuc"].ToString()).ToString("yyyy-MM-dd");
                            giaiThuong.Text = rd["GiaiThuong"].ToString();
                            if (!rd["TrangThai"].ToString().Equals("chuaduyet"))
                            {
                                btnSave.Visible = false;
                                lblDaDuyet.Text = "Hồ sơ đã duyệt không thể cập nhật thông tin";
                            }
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string tengv = tenGV.Text.ToString();
            string gioitinh = gtGV.SelectedValue.ToString();
            string ngaysinh = ngaySinhGV.Text.ToString();
            string diachi = diaChiGV.Text;
            string sdt = sdtGV.Text.ToString();
            string email = emailGV.Text.ToString();
            int maDV = Convert.ToInt32(ddlDonVi.SelectedValue);
            int maHH = Convert.ToInt32(ddlHocHam.SelectedValue);
            int maHV = Convert.ToInt32(ddlHocVi.SelectedValue);
            string detainc = deTaiNC.Text.ToString();
            string nambd = namBatDau.Text.ToString();
            string namkt = namKetThuc.Text.ToString();
            string giaithuong = giaiThuong.Text.ToString();
            string trangthai = "chuaduyet";

            int maGV = Convert.ToInt32(Session["maGV"].ToString());
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("update_thongtingiangvien", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaGV", maGV);
                cmd.Parameters.AddWithValue("@TenGV", tengv);
                cmd.Parameters.AddWithValue("@GioiTinh", gioitinh);
                cmd.Parameters.AddWithValue("@NgaySinh", ngaysinh);
                cmd.Parameters.AddWithValue("@DiaChi", diachi);
                cmd.Parameters.AddWithValue("@SDT", sdt);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@TenDeTaiNC", detainc);
                cmd.Parameters.AddWithValue("@NamBatDau", nambd);
                cmd.Parameters.AddWithValue("@NamKetThuc", namkt);
                cmd.Parameters.AddWithValue("@GiaiThuong", giaithuong);
                cmd.Parameters.AddWithValue("@TrangThai", trangthai);
                cmd.Parameters.AddWithValue("@MaDV", maDV);
                cmd.Parameters.AddWithValue("@MaHH", maHH);
                cmd.Parameters.AddWithValue("@MaHV", maHV);
                int rs = cmd.ExecuteNonQuery();

                if (rs > 0)
                {
                    Session["type"] = "text-success";
                    Session["mess"] = "Cập nhật thông tin giảng viên thành công";
                }
                else
                {
                    Session["type"] = "text-danger";
                    Session["mess"] = "Cập nhật thông tin giảng viên không thành công";
                }
                Response.Redirect("ThongTinLyLich.aspx");
            }
        }
    }
}