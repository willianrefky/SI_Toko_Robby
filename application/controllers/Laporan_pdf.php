<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Laporan_pdf extends CI_Controller {

	function __construct()
	{
		parent::__construct();

		// jika user belum login, arahkan ke halaman login
        if($this->session->userdata('status') != "login"){
        	$this->session->set_flashdata("alert", "<script>alert('Login terlebih dahulu!');</script>"); // session flash data, ditampilkan jika user mencoba membuka halaman tertentu.
            redirect(base_url("login"));
        }

        $this->load->library('pdf');
        $this->load->library('moneyformat');
        $this->load->model('laporanpdf_m');
	}

	public function laporan_masuk_harian_pdf () {
		$moneyformat = new Mformat();
		$pdf = new FPDF('P','mm','A4');
		// membuat halaman baru
		$pdf->AddPage();
		// setting jenis font yang akan digunakan
		$pdf->SetFont('Times','B',16);
		// mencetak string
		$pdf->Cell(190,7,'Laporan Barang Masuk Harian Toko Robby',0,1,'C');
		// memberikan space ke bawah
		$tglmasuk = $this->input->post('tanggal_masuk');
		$data = $this->laporanpdf_m->datamasuk($tglmasuk)->result();
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(20,7,"Tanggal:",0,0);
		foreach ($data as $row) {
			$pdf->Cell(20,7,date('d-m-Y', strtotime(substr($row->tanggal_masuk,0,10))),0,1); 
			break; 
		}
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(8,7,'No.',1,0,'C');
		$pdf->Cell(40,7,'No. Transaksi',1,0);
		$pdf->Cell(40,7,'Total',1,0);
		$pdf->Cell(25,7,'Jumlah Masuk',1,0);
		$pdf->Cell(25,7,'Tanggal Masuk',1,1);
		$pdf->SetFont('Times','','10');
		$no = 0;
		foreach ($data as $row) {
			$no++;
			$pdf->Cell(8,7,$no,1,0);
			$pdf->Cell(40,7,$row->id_barang_masuk,1,0);
			$pdf->Cell(40,7,$row->total_masuk,1,0);
			$pdf->Cell(25,7,$row->jumlah_masuk,1,0);
			$pdf->Cell(25,7,$row->tanggal_masuk,1,1);
		}

		// detail transaksi
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','B',14);
		$pdf->Cell(190,7,'Detail Transaksi',0,1,'');
		$pdf->Cell(3,3,'',0,1);
		// query data
		$datatransaksi = $this->laporanpdf_m->datamasuk($tglmasuk)->result();
		foreach ($datatransaksi as $rowtransaksi) {
			$pdf->SetFont('Times','','10');
			$pdf->Cell(22,7,"No. Transaksi: ",0,0);
			$pdf->Cell(28,7,$rowtransaksi->id_barang_masuk,0,1);
			$idtransaksi = $rowtransaksi->id_barang_masuk;
			$datadetailkeluar = $this->laporanpdf_m->datadetailmasuk($idtransaksi)->result();
			$no = 0;
			// tabel detail transaksi
			$pdf->SetFont('Times','B','10');
			$pdf->Cell(30,7,'Barcode',1,0);
			$pdf->Cell(60,7,'Nama Barang',1,0);
			$pdf->Cell(30,7,'Jumlah Pembelian',1,0);
			$pdf->Cell(25,7,'Harga Satuan',1,0);
			$pdf->Cell(25,7,'Harga Total',1,1);
			// isi tabel transaksi
			$pdf->SetFont('Times','','10');
			foreach ($datadetailkeluar as $rowdetail) {
				$pdf->Cell(30,7,$rowdetail->barcode,1,0);
				$pdf->Cell(60,7,$rowdetail->name,1,0);
				$pdf->Cell(30,7,$rowdetail->jumlah,1,0);
				$pdf->Cell(25,7,$moneyformat->money_format("%.2n", $rowdetail->hargabeli),1,0);
				$pdf->Cell(25,7,$moneyformat->money_format("%.2n", $rowdetail->hargabeli * $rowdetail->jumlah),1,1);
			}

			$pdf->Cell(3,7,'',0,1);

		}

		$pdf->Output();

	}

	public function laporan_masuk_bulanan_pdf () {
		$moneyformat = new Mformat();
		$pdf = new FPDF('P','mm','A4');
		// membuat halaman baru
		$pdf->AddPage();
		// setting jenis font yang akan digunakan
		$pdf->SetFont('Times','B',16);
		// mencetak string
		$pdf->Cell(190,7,'Laporan Barang Masuk Bulanan Toko Robby',0,1,'C');
		// memberikan space ke bawah
		$blnmasuk = $this->input->post('bulan_masuk');
		$data = $this->laporanpdf_m->datamasuk($blnmasuk)->result();
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(12,7,"Bulan:",0,0);
		foreach ($data as $row) {
			$pdf->Cell(10,7,date('m-Y', strtotime(substr($row->tanggal_masuk,0,10))),0,1); 
			break; 
		}
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(8,7,'No.',1,0,'C');
		$pdf->Cell(40,7,'No. Transaksi',1,0);
		$pdf->Cell(40,7,'Total',1,0);
		$pdf->Cell(25,7,'Jumlah Masuk',1,0);
		$pdf->Cell(25,7,'Tanggal Masuk',1,1);
		$pdf->SetFont('Times','','10');
		$no = 0;
		foreach ($data as $row) {
			$no++;
			$pdf->Cell(8,7,$no,1,0);
			$pdf->Cell(40,7,$row->id_barang_masuk,1,0);
			$pdf->Cell(40,7,$row->total_masuk,1,0);
			$pdf->Cell(25,7,$row->jumlah_masuk,1,0);
			$pdf->Cell(25,7,$row->tanggal_masuk,1,1);
		}

		// detail transaksi
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','B',14);
		$pdf->Cell(190,7,'Detail Transaksi',0,1,'');
		$pdf->Cell(3,3,'',0,1);
		// query data
		$datatransaksi = $this->laporanpdf_m->datamasuk($blnmasuk)->result();
		foreach ($datatransaksi as $rowtransaksi) {
			$pdf->SetFont('Times','','10');
			$pdf->Cell(22,7,"No. Transaksi: ",0,0);
			$pdf->Cell(28,7,$rowtransaksi->id_barang_masuk,0,1);
			$idtransaksi = $rowtransaksi->id_barang_masuk;
			$datadetailkeluar = $this->laporanpdf_m->datadetailmasuk($idtransaksi)->result();
			$no = 0;
			// tabel detail transaksi
			$pdf->SetFont('Times','B','10');
			$pdf->Cell(30,7,'Barcode',1,0);
			$pdf->Cell(60,7,'Nama Barang',1,0);
			$pdf->Cell(30,7,'Jumlah Pembelian',1,0);
			$pdf->Cell(25,7,'Harga Satuan',1,0);
			$pdf->Cell(25,7,'Harga Total',1,1);
			// isi tabel transaksi
			$pdf->SetFont('Times','','10');
			foreach ($datadetailkeluar as $rowdetail) {
				$pdf->Cell(30,7,$rowdetail->barcode,1,0);
				$pdf->Cell(60,7,$rowdetail->name,1,0);
				$pdf->Cell(30,7,$rowdetail->jumlah,1,0);
				$pdf->Cell(25,7,$moneyformat->money_format("%.2n", $rowdetail->hargabeli),1,0);
				$pdf->Cell(25,7,$moneyformat->money_format("%.2n", $rowdetail->hargabeli * $rowdetail->jumlah),1,1);
			}

			$pdf->Cell(3,7,'',0,1);

		}


		$pdf->Output();
		
	}

	public function laporan_keluar_harian_pdf () {
		$moneyformat = new Mformat();
		$pdf = new FPDF('P','mm','A4');
		// membuat halaman baru
		$pdf->AddPage();
		// setting jenis font yang akan digunakan
		$pdf->SetFont('Times','B',16);
		// mencetak string
		$pdf->Cell(190,7,'Laporan Barang Keluar Harian Toko Robby',0,1,'C');
		// memberikan space ke bawah
		$tglkeluar = $this->input->post('tanggal_keluar');
		$data = $this->laporanpdf_m->datakeluar($tglkeluar)->result();
		$querykeluar = $this->db->query("SELECT sum(harga) as totalbulankeluar from barang_keluar WHERE tanggal_keluar LIKE '%$tglkeluar%'")->row_array();
		$querymasuk = $this->db->query("SELECT sum(total_masuk) as totalbulanmasuk from barang_masuk WHERE tanggal_masuk LIKE '%$tglkeluar%'")->row_array();
		$querydata = $querykeluar['totalbulankeluar']-$querymasuk['totalbulanmasuk'];
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(20,7,"Tanggal:",0,0);
		foreach ($data as $row) {
			$pdf->Cell(20,7,date('d-m-Y', strtotime(substr($row->tanggal_keluar,0,10))),0,1); 
			break; 
		}
		// tabel transaksi
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(8,7,'No.',1,0,'C');
		$pdf->Cell(60,7,'No. Transaksi Keluar',1,0);
		$pdf->Cell(60,7,'Tanggal Keluar',1,0);
		$pdf->Cell(50,7,'Harga Total',1,1);
		// isi tabel transaksi
		$pdf->SetFont('Times','','10');
		$no = 0;
		foreach ($data as $row) {
			$no++;
			$pdf->Cell(8,7,$no,1,0,'C');
			$pdf->Cell(60,7,$row->id_barang_keluar,1,0);
			$pdf->Cell(60,7,date('d-m-Y H:i:s', strtotime($row->tanggal_keluar)),1,0);
			$pdf->Cell(50,7,$moneyformat->money_format("%.2n", $row->harga),1,1);
		}
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(128,7,"         LABA",1,0);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(50,7,$moneyformat->money_format("%.2n", $querydata),1,1);
		$pdf->Cell(3,7,'',0,1);

		// detail transaksi
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','B',14);
		$pdf->Cell(190,7,'Detail Transaksi',0,1,'');
		$pdf->Cell(3,3,'',0,1);
		// query data
		$datatransaksi = $this->laporanpdf_m->datakeluar($tglkeluar)->result();
		foreach ($datatransaksi as $rowtransaksi) {
			$pdf->SetFont('Times','','10');
			$pdf->Cell(22,7,"No. Transaksi: ",0,0);
			$pdf->Cell(28,7,$rowtransaksi->id_barang_keluar,0,1);
			$idtransaksi = $rowtransaksi->id_barang_keluar;
			$datadetailkeluar = $this->laporanpdf_m->datadetailkeluar($idtransaksi)->result();
			$no = 0;
			// tabel detail transaksi
			$pdf->SetFont('Times','B','10');
			$pdf->Cell(30,7,'Barcode',1,0);
			$pdf->Cell(60,7,'Nama Barang',1,0);
			$pdf->Cell(30,7,'Harga Satuan',1,0);
			$pdf->Cell(10,7,'Jml',1,0);
			$pdf->Cell(30,7,'Harga Total',1,1);
			// isi tabel transaksi
			$pdf->SetFont('Times','','10');
			foreach ($datadetailkeluar as $rowdetail) {
				$pdf->Cell(30,7,$rowdetail->barcode,1,0);
				$pdf->Cell(60,7,$rowdetail->name,1,0);
				$pdf->Cell(30,7,$moneyformat->money_format("%.2n", $rowdetail->hargajual),1,0);
				$pdf->Cell(10,7,$rowdetail->jumlah,1,0);
				$pdf->Cell(30,7,$moneyformat->money_format("%.2n", $rowdetail->hargajual * $rowdetail->jumlah),1,1);
			}

			$pdf->Cell(3,7,'',0,1);

		}

		$pdf->Output();
	
	}

	public function laporan_keluar_bulanan_pdf () {
		$moneyformat = new Mformat();
		$pdf = new FPDF('P','mm','A4');
		// membuat halaman baru
		$pdf->AddPage();
		// setting jenis font yang akan digunakan
		$pdf->SetFont('Times','B',16);
		// mencetak string
		$pdf->Cell(190,7,'Laporan Barang Keluar Bulanan Toko Robby',0,1,'C');
		// memberikan space ke bawah
		$tglkeluar = $this->input->post('bulan_keluar');
		$data = $this->laporanpdf_m->datakeluar($tglkeluar)->result();
		$querykeluar = $this->db->query("SELECT sum(harga) as totalbulankeluar from barang_keluar WHERE tanggal_keluar LIKE '%$tglkeluar%'")->row_array();
		$querymasuk = $this->db->query("SELECT sum(total_masuk) as totalbulanmasuk from barang_masuk WHERE tanggal_masuk LIKE '%$tglkeluar%'")->row_array();
		$querydata = $querykeluar['totalbulankeluar']-$querymasuk['totalbulanmasuk'];
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(12,7,"Bulan:",0,0);
		foreach ($data as $row) {
			$pdf->Cell(10,7,date('m-Y', strtotime(substr($row->tanggal_keluar,0,10))),0,1); 
			break; 
		}
		// tabel transaksi
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(8,7,'No.',1,0,'C');
		$pdf->Cell(60,7,'No. Transaksi Keluar',1,0);
		$pdf->Cell(60,7,'Tanggal Keluar',1,0);
		$pdf->Cell(50,7,'Harga Total',1,1);
		// isi tabel transaksi
		$pdf->SetFont('Times','','10');
		$no = 0;
		foreach ($data as $row) {
			$no++;
			$pdf->Cell(8,7,$no,1,0,'C');
			$pdf->Cell(60,7,$row->id_barang_keluar,1,0);
			$pdf->Cell(60,7,date('d-m-Y H:i:s', strtotime($row->tanggal_keluar)),1,0);
			$pdf->Cell(50,7,$moneyformat->money_format("%.2n", $row->harga),1,1);
		}
		$pdf->SetFont('Times','B','10');
		$pdf->Cell(128,7,"         LABA",1,0);
		$pdf->SetFont('Times','','10');
		$pdf->Cell(50,7,$moneyformat->money_format("%.2n", $querydata),1,1);
		$pdf->Cell(3,7,'',0,1);

		// detail transaksi
		$pdf->Cell(3,7,'',0,1);
		$pdf->SetFont('Times','B',14);
		$pdf->Cell(190,7,'Detail Transaksi',0,1,'');
		$pdf->Cell(3,3,'',0,1);
		// query data
		$datatransaksi = $this->laporanpdf_m->datakeluar($tglkeluar)->result();
		foreach ($datatransaksi as $rowtransaksi) {
			$pdf->SetFont('Times','','10');
			$pdf->Cell(22,7,"No. Transaksi: ",0,0);
			$pdf->Cell(28,7,$rowtransaksi->id_barang_keluar,0,1);
			$idtransaksi = $rowtransaksi->id_barang_keluar;
			$datadetailkeluar = $this->laporanpdf_m->datadetailkeluar($idtransaksi)->result();
			$no = 0;
			// tabel detail transaksi
			$pdf->SetFont('Times','B','10');
			$pdf->Cell(30,7,'Barcode',1,0);
			$pdf->Cell(60,7,'Nama Barang',1,0);
			$pdf->Cell(30,7,'Harga Satuan',1,0);
			$pdf->Cell(10,7,'Jml',1,0);
			$pdf->Cell(30,7,'Harga Total',1,1);
			// isi tabel transaksi
			$pdf->SetFont('Times','','10');
			foreach ($datadetailkeluar as $rowdetail) {
				$pdf->Cell(30,7,$rowdetail->barcode,1,0);
				$pdf->Cell(60,7,$rowdetail->name,1,0);
				$pdf->Cell(30,7,$moneyformat->money_format("%.2n", $rowdetail->hargajual),1,0);
				$pdf->Cell(10,7,$rowdetail->jumlah,1,0);
				$pdf->Cell(30,7,$moneyformat->money_format("%.2n", $rowdetail->hargajual * $rowdetail->jumlah),1,1);
			}

			$pdf->Cell(3,7,'',0,1);

		}

		$pdf->Output();
	
	}

}