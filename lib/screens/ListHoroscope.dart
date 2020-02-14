import 'package:HoroscopeApp/class/Horoscope.dart';
import 'package:HoroscopeApp/screens/DetailHoroscope.dart';
import 'package:flutter/material.dart';
import '../utils/DumpData.dart';

class ListHoroscope extends StatelessWidget {
  static List<Horoscope> horoscopeList = [];
  @override
  Widget build(BuildContext context) {
    horoscopeList = createHoroscopeList();
    // _horoscopeList = createHoroscopeList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Horoscope APP"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: horoscopeList.length,
        itemBuilder: (BuildContext context, int index) {
          return _horoscopeCard(context, horoscopeList, index);
        },
      ),
    );
  }

  Widget _horoscopeCard(
      BuildContext context, List<Horoscope> horoscopeList, int index) {
    return Container(
      child: Card(
        color: Colors.orange.shade100,
        child: ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailHoroscope(index),
            ),
          ),
          leading: Image.asset(horoscopeList[index].miniImage),
          trailing: Icon(Icons.navigate_next, size: 40.0, color: Colors.pink),
          title: Text(
            horoscopeList[index].horoscopeName,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.pink),
          ),
          subtitle: Text(
            horoscopeList[index].horoscopeDate,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }

  List<Horoscope> createHoroscopeList() {
    List<Horoscope> _burcList = [];
    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      String _miniImage = "assets\\images\\" +
          Strings.BURC_ADLARI[i].toLowerCase() +
          "${i + 1}.png";
      String _highImage = "assets\\images\\" +
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk${i + 1}.png";
      // print(_miniImage + _highImage);
      String _horoscopeName = Strings.BURC_ADLARI[i];
      String _dailyFeatures = Strings.BURC_GENEL_OZELLIKLERI[i];
      String _horoscopeDate = Strings.BURC_TARIHLERI[i];
      Horoscope _addHoroscope = Horoscope(_horoscopeName, _horoscopeDate,
          _dailyFeatures, _miniImage, _highImage);
      _burcList.add(_addHoroscope);
    }
    print(_burcList);
    return _burcList;
  }
}
