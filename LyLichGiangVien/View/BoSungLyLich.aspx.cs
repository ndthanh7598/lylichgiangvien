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
    public partial class BoSungLyLich : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNoti.CssClass = Session["type"].ToString();
            lblNoti.Text = Session["mess"].ToString();
            Session["type"] = "";
            Session["mess"] = "";
            ConnectDatabase conn = new ConnectDatabase();
            string maBS = "";
            if (Request.QueryString.Count > 0)
            {
                maBS = Request.QueryString["ma"];
                using (SqlConnection myCnn = conn.connectDatabase())
                {
                    if (!IsPostBack)
                    {
                        SqlCommand cmd = new SqlCommand("check_lylichchuaduyet", myCnn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@MaBS", maBS);
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (!rd.HasRows)
                        {
                            Session["type"] = "text-danger";
                            Session["mess"] = "Lý lịch đã được duyệt không thể chỉnh sửa";
                            Response.Redirect("BoSungLyLich.aspx");
                        }
                        else
                        {
                            rd.Close();
                            cmd = new SqlCommand("get_lylichbosung_theoid", myCnn);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@MaBS", maBS);
                            rd = cmd.ExecuteReader();
                            if (rd.HasRows)
                            {
                                while (rd.Read())
                                {
                                    tenDeTai.Text = rd["TenDeTaiNC"].ToString();
                                    namBatDau.Text = Convert.ToDateTime(rd["NamBatDau"].ToString()).ToString("yyyy-MM-dd");
                                    giaiThuong.Text = rd["GiaiThuong"].ToString();
                                    namKetThuc.Text = Convert.ToDateTime(rd["NamKetThuc"].ToString()).ToString("yyyy-MM-dd");
                                    btnSave.Visible = false;
                                    btnSaveFix.Visible = true;
                                    btnHuy.Visible = true;
                                }
                                titleForm.InnerText = "Chỉnh sửa lý lịch bổ sung";
                            }
                        }
                    }
                }
            }
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                if (!IsPostBack)
                {
                    if (Session["maGV"].ToString().Equals(""))
                    {
                        Response.Redirect("Login.aspx");
                    }
                    int maGV = Convert.ToInt32(Session["maGV"].ToString());

                    SqlCommand cmd = new SqlCommand("get_lylichbosung", myCnn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@MaGV", maGV);
                    using (SqlDataAdapter data = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        data.Fill(dt);
                        rptLyLich.DataSource = dt;
                        rptLyLich.DataBind();
                    }
                }
            }
        }

        public String LabelTrangThai(string trangthai)
        {
            if (trangthai.Equals("chuaduyet"))
            {
                return "warning";
            }

            if (trangthai.Equals("daduyet"))
            {
                return "success";
            }
            return "";
        }

        public String NameTrangThai(string trangthai)
        {
            if (trangthai.Equals("chuaduyet"))
            {
                return "Chưa duyệt";
            }

            if (trangthai.Equals("daduyet"))
            {
                return "Đã duyệt";
            }
            return "";
        }

        public Boolean View(string trangthai)
        {
            if (trangthai.Equals("chuaduyet"))
            {
                return true;
            }

            return false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int maGV = Convert.ToInt32(Session["maGV"].ToString());
            string tendetai = tenDeTai.Text.ToString();
            string nambatdau = namBatDau.Text.ToString();
            string namketthuc = namKetThuc.Text.ToString();
            string giaithuong = giaiThuong.Text.ToString();
            
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("insert_lylichbosung", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ThoiGianBS", DateTime.Now.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@TenDeTaiNC", tendetai);
                cmd.Parameters.AddWithValue("@NamBatDau", nambatdau);
                cmd.Parameters.AddWithValue("@NamKetThuc", namketthuc);
                cmd.Parameters.AddWithValue("@GiaiThuong", giaithuong);
                cmd.Parameters.AddWithValue("@TrangThai", "chuaduyet");
                cmd.Parameters.AddWithValue("@MaGV", maGV);
                int rs = cmd.ExecuteNonQuery();

                if (rs > 0)
                {
                    Session["type"] = "text-success";
                    Session["mess"] = "Bổ sung lý lịch giảng viên thành công";
                }
                else
                {
                    Session["type"] = "text-danger";
                    Session["mess"] = "Bổ sung lý lịch giảng viên không thành công";
                }
                Response.Redirect("BoSungLyLich.aspx");
            }
        }

        protected void btnFix_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string maBS = btn.CommandArgument;
            Response.Redirect("BoSungLyLich.aspx?ma=" + maBS);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)(sender);
            string maBS = btn.CommandArgument;
            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("delete_lylichbosung", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaBS", maBS);
                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    Session["type"] = "text-success";
                    Session["mess"] = "Xoá lý lịch bổ sung thành công";
                }
                else
                {
                    Session["type"] = "text-danger";
                    Session["mess"] = "Xoá lý lịch bổ sung không thành công";
                }
            }
            Response.Redirect("BoSungLyLich.aspx");
        }

        protected void btnSaveFix_Click(object sender, EventArgs e)
        {
            string maBS = "";
            maBS = Request.QueryString["ma"];
            string tendetai = tenDeTai.Text.ToString();
            string nambatdau = namBatDau.Text.ToString();
            string namketthuc = namKetThuc.Text.ToString();
            string giaithuong = giaiThuong.Text.ToString();

            ConnectDatabase conn = new ConnectDatabase();
            using (SqlConnection myCnn = conn.connectDatabase())
            {
                SqlCommand cmd = new SqlCommand("update_lylichbosung", myCnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaBS", maBS);
                cmd.Parameters.AddWithValue("@ThoiGianBS", DateTime.Now.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@TenDeTaiNC", tendetai);
                cmd.Parameters.AddWithValue("@NamBatDau", nambatdau);
                cmd.Parameters.AddWithValue("@NamKetThuc", namketthuc);
                cmd.Parameters.AddWithValue("@GiaiThuong", giaithuong);
                int rs = cmd.ExecuteNonQuery();

                if (rs > 0)
                {
                    Session["type"] = "text-success";
                    Session["mess"] = "Cập nhật lý lịch bổ sung giảng viên thành công";
                }
                else
                {
                    Session["type"] = "text-danger";
                    Session["mess"] = "Cập nhật lý lịch không thành công";
                }
                Response.Redirect("BoSungLyLich.aspx");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("BoSungLyLich.aspx");
        }
    }
}