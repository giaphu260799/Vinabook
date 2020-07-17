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
    public partial class Form10 : Form
    {
        public Form10()
        {
            InitializeComponent();
            string query = "select * from KHO_SACH";
            DataProvider provider1 = new DataProvider();
            dataGridView1.DataSource = provider1.ExecuteQuery(query, new object[] { });
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "Exec sp_CapNhatSoLuongSach @ma_sach , @ma_kho , @so_luong";
            DataProvider provider = new DataProvider();
            int data = 0;
            data = provider.ExecuteNonQuery(query, new object[] { Convert.ToInt32(textBox3.Text), Convert.ToInt32(textBox1.Text) , Convert.ToInt32(textBox2.Text) });
            if (data > 0)
            {
                MessageBox.Show("Cập nhật thành công.");
                query = "select * from KHO_SACH";
                DataProvider provider1 = new DataProvider();
                dataGridView1.DataSource = provider1.ExecuteQuery(query, new object[] { });
            }
            else
                MessageBox.Show("Cập nhật không thành công.");

        }
    }
}
