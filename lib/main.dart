import 'package:flutter/material.dart';
import 'package:flutter_get_api/api_client.dart';
import 'package:flutter_get_api/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// TODO 04 - Gunakan widget FutureBuilder untuk pengambilan data yang bernilai Future atau bersifat async
// isi nilai future dengan fungsi pengambilan data API yang ada pada kelas ApiClient
// isi nilai builder dengan fungsi yang berparameter BuildContext dan AsyncSnapshot
// dimana nilai dari AsyncSnapshot adalah nilai balik dari fungsi yang ada pada future
// atau kelas yang ada pada T di FutureBuilder
// dan lakukan pengecekan jika data ada dan koneksi selesai munculkan data
// jika tidak munculkan indicator

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<IpApi>(
          future: ApiClient.getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            IpApi ipApi = snapshot.data;
            bool connect = snapshot.connectionState == ConnectionState.done;
            if (snapshot.hasData && connect) {
              return Text(
                ipApi.ip,
                style: TextStyle(
                  fontSize: 32,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
