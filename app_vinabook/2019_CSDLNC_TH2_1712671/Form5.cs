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
    public partial class Form5 : Form
    {
        public Form5(string search,string username)
        {
            InitializeComponent();
            label1.Text = username;
            string query = "Exec sp_KiemSach @TenSach";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { search });
        }

        private void dangxuat_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 f = new Form1();
            f.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form11 f = new Form11(label1.Text);
            f.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "Exec sp_KiemSach @TenSach";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { textBox1.Text });
        }
    }
}
