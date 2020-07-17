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
    public partial class Form9 : Form
    {
        public Form9()
        {
            InitializeComponent();
            string query = "Exec sp_ThongKeDonTheoNgay";
            DataProvider provider = new DataProvider();
            dataGridView1.DataSource = provider.ExecuteQuery(query, new object[] {});
        }

    }
}
