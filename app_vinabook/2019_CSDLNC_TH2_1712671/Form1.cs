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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent(); 
            string query = "SELECT S.MA_SACH,S.TEN_SACH,S.GIA_TIEN FROM CHI_TIET_DON_HANG C, SACH S WHERE C.MA_SACH = S.MA_SACH GROUP BY S.MA_SACH,S.TEN_SACH,S.GIA_TIEN HAVING COUNT(C.MA_DH) > 6";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] { });
            query = "SELECT * FROM SACH WHERE NGAY_PHAT_HANH >= '2019-11-15'";
            provider = new DataProvider();
            dataGridView2.DataSource = provider.ExecuteQuery(query, new object[] { });
        }

        private void dangnhap_Click(object sender, EventArgs e)
        {
            Form2 dn = new Form2();
            this.Hide();
            dn.ShowDialog();
        }

        private void dangky_Click(object sender, EventArgs e)
        {
            Form3 dk = new Form3();
            dk.ShowDialog();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form6 f = new Form6(textBox1.Text);
            f.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form2 dk = new Form2();
            dk.ShowDialog();
        }
    }
}
