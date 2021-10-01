import 'package:http/http.dart';

import '../common/constant.dart';
import '../model/earthquake.dart';

// TODO 03
// Buat fungsi Future yang dimana artinya nilai balik dari fungsi tersebut bersifat async
// atau nilai akan terisi setelah semua perintah selesai dijalankan
// dengan nilai T nya adalah kelas model yang sebelumnya dibuat untuk menampung data dari JSON
// jadikan fungsi tersebut bersifat async agar dapat menggunakan perintah await
// yg digunakan untuk fungsi get dari http atau mengambil data dari pemanggilan url tersebut
// dan ditampung kedalam Response
// dan nilai balik (return) dari fungsi ini adalah fungsi dari kelas model sebelumnya
// yang dimana tipe data fungsi tersebut adalah nilai T pada Future (kelas model data)
// jadikan fungsi bernilai static agar nilainya tetap dan ketika pemanggilan fungsi cukup
// ApiClient.getData()
// jika tidak menggunakan static panggil fungsi tersebut dengan cara
// ApiClient().getData()

class ApiClient {
  static Future<Earthquake> getData() async {
    Uri uri = Uri.parse('${Constant.baseUrl}autogempa.json');
    Response response = await get(uri);
    return earthquakeFromJson(response.body);
  }
}
