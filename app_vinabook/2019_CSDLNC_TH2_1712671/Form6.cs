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
    public partial class Form6 : Form
    {
        public Form6(string text)
        {
            InitializeComponent();
            string query = "Exec sp_KiemSach @TenSach";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { text });
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form2 f = new Form2();
            f.ShowDialog();
        }

        private void dangky_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form3 f = new Form3();
            f.ShowDialog();
        }

        private void dangnhap_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form2 f = new Form2();
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
