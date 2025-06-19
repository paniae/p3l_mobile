import 'package:flutter/material.dart';
import '/entity/Pegawai.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:p3l_mobile/view/LoginPage.dart';

class ProfileKurirPage extends StatelessWidget {
  final Pegawai pegawai;

  const ProfileKurirPage({super.key, required this.pegawai});

  // Fungsi untuk menampilkan dialog konfirmasi logout
  void _showLogoutDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      title: 'Konfirmasi Logout',
      desc: 'Apakah Anda yakin ingin keluar dari akun?',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
      },
      btnOkText: "Logout",
      btnCancelText: "Batal",
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFFFEBD0);
    const primary = Color(0xFF173B61);

    InputDecoration inputStyle(IconData icon) {
      return InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        enabled: false,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Image.asset('assets/images/white.png', height: 40),
            const SizedBox(height: 8),
          ],
        ),
      ),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // Profil Kurir Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: const BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Center(
                child: Text(
                  'Profile Kurir ${pegawai.namaPegawai}',
                  style: TextStyle(
                    color: primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Expanded: Data Profil
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    _buildField(Icons.person, 'Nama', pegawai.namaPegawai),
                    _buildField(Icons.email, 'Email', pegawai.email),
                    _buildField(Icons.phone, 'Nomor Telepon', pegawai.nomorTelepon),
                    _buildField(Icons.calendar_today, 'Tanggal Lahir', pegawai.tglLahir),
                    _buildField(Icons.location_city, 'Alamat', pegawai.alamat),
                    _buildField(Icons.badge, 'ID Jabatan', pegawai.idJabatan),
                    const SizedBox(height: 80),
                    _buildButton(
                      text: 'Logout',
                      backgroundColor: Colors.red,
                      onPressed: () => _showLogoutDialog(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan field profil
  Widget _buildField(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        readOnly: true,
        initialValue: value,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Color(0xFF173B61)),
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black12),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan tombol
  Widget _buildButton({
    required String text,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}