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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["login"] = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ConnectDatabase conn = new ConnectDatabase();

            string tai_khoan = txtTaiKhoan.Text;
            string mat_khau = txtMatKhau.Text;

            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("get_thongtintaikhoan", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Taikhoan", tai_khoan);
                cmd.Parameters.AddWithValue("@MatKhau", mat_khau);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        if (!rd["TrangThai"].Equals("hoatdong"))
                        {
                            lblNoti.Text = "Tài khoản đã bị khoá!";
                        }
                        else if (rd["TenTaiKhoan"].Equals(tai_khoan) && rd["MatKhau"].Equals(mat_khau))
                        {
                            Session["login"] = true;
                            Session["tenTK"] = rd["TenTaiKhoan"];
                            Session["maCB"] = rd["MaCB"];
                            Session["maGV"] = rd["MaGV"];
                            Session["quyen"] = rd["MaQuyen"];
                            Response.Redirect("Welcome.aspx");
                        }
                        else
                        {
                            lblNoti.Text = "Sai tên tài khoản hoặc mật khẩu!";
                        }
                    }
                }
                else
                {
                    lblNoti.Text = "Sai tên tài khoản hoặc mật khẩu!";
                }
            }
        }
    }
}