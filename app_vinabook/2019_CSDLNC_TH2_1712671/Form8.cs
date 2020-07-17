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
    public partial class Form8 : Form
    {
        public Form8()
        {
            InitializeComponent();
            string query = "select * from DON_HANG";
            DataProvider provider1 = new DataProvider();
            dataGridView1.DataSource = provider1.ExecuteQuery(query, new object[] { });
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "Exec sp_XoaDonHang @ma_dh";
            DataProvider provider = new DataProvider();
            int data = 0;
            data = provider.ExecuteNonQuery(query, new object[] { Convert.ToInt32(textBox1.Text)});
            if (data > 0)
            {
                MessageBox.Show("Xóa thành công.");
                query = "select * from DON_HANG";
                DataProvider provider1 = new DataProvider();
                dataGridView1.DataSource = provider1.ExecuteQuery(query, new object[] {});
            }
            else
                MessageBox.Show("Xóa không thành công.");
        }
    }
}
