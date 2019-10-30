using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using LyLichGiangVien.Model;

namespace LyLichGiangVien.View
{
    public partial class doiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNoti.CssClass = Session["type"].ToString();
            lblNoti.Text = Session["mess"].ToString();
            Session["type"] = "";
            Session["mess"] = "";
            tenDangNhap.Text = Session["tenTK"].ToString();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ConnectDatabase cnn = new ConnectDatabase();
            ///TextBox UserName = (TextBox)CreateUserWizard.FindControl("UserName");
            string _txtMatKhauCu = txtMatKhauCu.Text;
            string _txtMatKhauMoi = txtMatKhauMoi.Text;
            using (SqlConnection sqlConnection = cnn.connectDatabase())
            {
                SqlCommand cmd1 = new SqlCommand("checkAcccount", sqlConnection);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@TaiKhoan", Session["tenTK"].ToString());
                cmd1.Parameters.AddWithValue("@matkhau", _txtMatKhauCu);
                // int i1 = cmd1.ExecuteNonQuery();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd1);
                DataTable dataTable = new DataTable();
                sqlDataAdapter.Fill(dataTable);
                if (dataTable.Rows.Count > 0)
                {

                    SqlCommand cmd = new SqlCommand("updatePassWord", sqlConnection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TaiKhoan", Session["tenTK"].ToString());
                    cmd.Parameters.AddWithValue("@MatKhau", _txtMatKhauMoi);
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Session["type"] = "text-success";
                        Session["mess"] = "Đổi mật khẩu thành công";
                        Response.Redirect("doiMatKhau.aspx");
                    }
                    else
                    {
                        lblNoti.Text = "Tài khoản đã đổi mật khẩu thất bại.";
                    }
                }

                else
                {
                    lblNoti.Text = "Mật khẩu cũ không đúng.";
                }
            }
        }
    }

}