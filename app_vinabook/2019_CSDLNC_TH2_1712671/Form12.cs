using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using _2019_CSDLNC_TH2_1712671.DAO;
namespace _2019_CSDLNC_TH2_1712671
{
    public partial class Form12 : Form
    {
        public Form12(string username)
        {
            InitializeComponent();
            label1.Text = username;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string query = "EXEC sp_ThemDonHang @id , @code , @thanhtoan , @sdt , @so_nha , @duong , @quan_huyen , @tinh_thanh , @ghi_chu";
            DataProvider provider = new DataProvider();
            int data = 0;
            data = provider.ExecuteNonQuery(query, new object[] { label1.Text, code.Text, thanhtoan.Text, sdt.Text, sonha.Text, duong.Text , quanhuyen.Text,tinhthanh.Text,ghichu.Text});
            if (data > 0)
            {
                MessageBox.Show("Đặt hàng thành công.");
                this.Hide();
                Form4 f = new Form4(label1.Text);
                f.ShowDialog();
            }
            else
                MessageBox.Show("Đặt hàng không thành công.");
        }
    }
}
