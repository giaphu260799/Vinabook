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
    public partial class Form11 : Form
    {
        public Form11(string username)
        {
            InitializeComponent();
            label3.Text = username;
        }

        public Form11()
        {
            // TODO: Complete member initialization
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form12 f = new Form12(label3.Text);
            this.Hide();
            f.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string query = "exec sp_ThemGio @id , @ma_sach , @sl";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { label3.Text, Convert.ToInt32(textBox1.Text), Convert.ToInt32(textBox2.Text)});
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string query = "exec sp_XoaGio @id , @ma_sach , @sl";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { label3.Text, Convert.ToInt32(textBox1.Text), Convert.ToInt32(textBox2.Text) });
        }
    }
}
