module Fakturable
  # detail_transaction_code (string)
  # 01 - Kepada Pihak yang Bukan Pemungut PPN
  # 02 - Kepada Pemungut Bendaharawan
  # 03 - Kepada Pemungut Selain Bendaharawan
  # 04 - DPP Nilai Lain
  # 06 - Penyerahan Lainnya
  # 07 - Penyerahan yang PPN-nya Tidak Dipungut
  # 08 - Penyerahan yang PPN-nya Dibebaskan
  # 09 - Penyerahan Aktiva (Pasal 16D UU PPN)

  DETAIL_TRANSACTION = {
    '01' => 'Kepada Pihak yang Bukan Pemungut PPN',
    '02' => 'Kepada Pemungut Bendaharawan',
    '03' => 'Kepada Pemungut Selain Bendaharawan',
    '04' => 'DPP Nilai Lain',
    '06' => 'Penyerahan Lainnya',
    '07' => 'Penyerahan yang PPN-nya Tidak Dipungut',
    '08' => 'Penyerahan yang PPN-nya Dibebaskan',
    '09' => 'Penyerahan Aktiva (Pasal 16D UU PPN)'
  }.freeze

  # additional_information_code (string)
  # detail 07
  # 4 - Kawasan Bebas
  # 5 - Tempat Penimbunan Berikat
  # 6 - Hibah dan Bantuan Luar Negeri
  # 7 - Avtur
  # 88 - Lainnya
  # 8 - Kontraktor Perjanjian Karya Pengusahaan Pertambangan Batubara Generasi I
  # 9 - Penyerahan bahan bakar minyak untuk Kapal Angkutan Laut Luar Negeri
  # 10 - Penyerahan jasa kena pajak terkait alat angkutan tertentu
  # 12 - Penyerahan BPK Tertentu di KEK
  # 13 - BKP tertentu yang bersifat strategis berupa anode slime
  # detail 08
  # 1 - BKP dan JKP Tertentu
  # 2 - BKP Tertentu yang Bersifat Strategis sesuai PP NOMOR 12 TAHUN 2001
  # 3 - Jasa Kebandarudaraan
  # 99 - Lainnya
  # 11 - BKP Tertentu yang Bersifat Strategis sesuai PP NOMOR 81 TAHUN 2015
  # 14 - Penyerahan Jasa Kepelabuhan Tertentu untuk kegiatan angkutan laut luar negeri

  ADDITIONAL_INFORMATION = {
    '4' => 'Kawasan Bebas',
    '5' => 'Tempat Penimbunan Berikat',
    '6' => 'Hibah dan Bantuan Luar Negeri',
    '7' => 'Avtur',
    '88' => 'Lainnya',
    '8' => 'Kontraktor Perjanjian Karya Pengusahaan Pertambangan Batubara Generasi I',
    '9' => 'Penyerahan bahan bakar minyak untuk Kapal Angkutan Laut Luar Negeri',
    '10' => 'Penyerahan jasa kena pajak terkait alat angkutan tertentu',
    '12' => 'Penyerahan BPK Tertentu di KEK',
    '13' => 'BKP tertentu yang bersifat strategis berupa anode slime',
    '1' => 'BKP dan JKP Tertentu',
    '2' => 'BKP Tertentu yang Bersifat Strategis sesuai PP NOMOR 12 TAHUN 2001',
    '3' => 'Jasa Kebandarudaraan',
    '99' => 'Lainnya',
    '11' => 'BKP Tertentu yang Bersifat Strategis sesuai PP NOMOR 81 TAHUN 2015',
    '14' => 'Penyerahan Jasa Kepelabuhan Tertentu untuk kegiatan angkutan laut luar negeri'
  }.freeze

  # tax_type_code (string)
  # 0 - Faktur Pajak
  # 1 - Faktur Pajak Pengganti

  TAX_TYPE = {
    '0' => 'Faktur Pajak',
    '1' => 'Faktur Pajak Pengganti'
  }.freeze

  # faktur_status_code (string)
  # 0 - tidak dihitung (Diganti, Batal)
  # 1 - dihitung (Normal, Normal-Pengganti)
  # 2 - tidak dihitung (proses pembatalan sedang berjalan)

  FAKTUR_STATUS = {
    '0' => 'Normal',
    '1' => 'Normal-Pengganti'
  }.freeze

  # retur_status_code (string)
  # 0 - tidak dihitung (Diganti, Batal)
  # 1 - dihitung (Normal, Normal-Pengganti)
  # 2 - tidak dihitung (proses pembatalan sedang berjalan)

  RETUR_STATUS = {
    '0' => 'Normal',
    '1' => 'Normal-Pengganti'
  }.freeze

  # uang_muka_code (integer)
  # 0 - Pembayaran normal
  # 1 - Ada uang muka atau termin
  # 2 - Pelunasan

  # approval_status_code (string)
  # 0 - tidak dihitung, bisa diedit (Belum Approve)
  # 1 - tidak dihitung, tidak bisa diedit (Siap Approve)
  # 2 - dihitung, tidak bisa diedit (Approval Sukses)
  # 3 - tidak dihitung, bisa diedit (Reject, Bukan faktur etax)
end