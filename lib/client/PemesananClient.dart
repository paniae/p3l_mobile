import 'dart:convert';
import 'package:http/http.dart' as http;
import '/entity/Pemesanan.dart';

class PemesananClient {
  static Future<List<Pemesanan>> fetchHistoryPembelian(String idPembeli) async {
    final url = 'http://10.0.2.2:8000/api/pembeli/$idPembeli/history-data';
    final response = await http.get(Uri.parse(url));
    print("RESPONSE BODY: ${response.body}");  // <---- TAMBAHKAN INI
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Pemesanan.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load history');
    }
  }

  static Future<Pemesanan> fetchDetailPembelian(String idPembeli, String idPemesanan) async {
    final url = 'http://10.0.2.2:8000/api/pembeli/$idPembeli/history-detail/$idPemesanan';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Pemesanan.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load detail');
    }
  }

  static Future<List<Pemesanan>> fetchPengirimanByKurir(String idPegawai) async {
    final url = 'http://10.0.2.2:8000/api/pegawai/$idPegawai/pengiriman';
    final response = await http.get(Uri.parse(url));

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Pemesanan.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data pengiriman');
    }
  }

  static Future<List<Pemesanan>> fetchHistoryByKurir(String idKurir) async {
    final url = 'http://10.0.2.2:8000/api/kurir/$idKurir/history';
    final response = await http.get(Uri.parse(url));
    print("RESPONSE BODY: ${response.body}"); 
    if (response.statusCode == 200) {
      final List jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Pemesanan.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat riwayat pengiriman');
    }
  }
}
