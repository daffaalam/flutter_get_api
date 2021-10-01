import 'package:flutter/material.dart';

import '../../common/constant.dart';
import '../../model/earthquake.dart';
import '../../network/api_client.dart';

// TODO 04
// Gunakan widget FutureBuilder untuk pengambilan data yang bernilai Future atau bersifat async
// isi nilai future dengan fungsi pengambilan data API yang ada pada kelas ApiClient
// isi nilai builder dengan fungsi yang berparameter BuildContext dan AsyncSnapshot
// dimana nilai dari AsyncSnapshot adalah nilai balik dari fungsi yang ada pada future
// atau kelas yang ada pada T di FutureBuilder
// dan lakukan pengecekan jika data ada dan koneksi selesai munculkan data
// jika tidak munculkan indicator

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _widgetHasData(Earthquake data) {
    Gempa? earthquake = data.infogempa?.gempa;
    return ListView(
      children: <Widget>[
        Image.network(
          '${Constant.baseUrl}${earthquake?.shakemap}',
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${earthquake?.potensi}',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Earthquake>(
        future: ApiClient.getData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<Earthquake> snapshot,
        ) {
          bool connect = snapshot.connectionState == ConnectionState.done;
          if (snapshot.hasData && connect) {
            return _widgetHasData(snapshot.data!);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Oops! Something went wrong...',
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Sumber: BMKG (Badan Meteorologi, Klimatologi, dan Geofisika)',
          ),
        ),
      ),
    );
  }
}
