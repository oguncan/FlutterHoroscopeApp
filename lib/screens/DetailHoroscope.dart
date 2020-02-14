import 'package:HoroscopeApp/class/Horoscope.dart';
import 'package:HoroscopeApp/screens/ListHoroscope.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class DetailHoroscope extends StatefulWidget {
  int _index;
  DetailHoroscope(this._index);

  @override
  _DetailHoroscopeState createState() => _DetailHoroscopeState();
}

class _DetailHoroscopeState extends State<DetailHoroscope> {
  Color baskinRenk;
  Horoscope selectedHoroscope;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    super.initState();
    selectedHoroscope = ListHoroscope.horoscopeList[widget._index];
    heavyColor();
  }

  void heavyColor() {
    Future<PaletteGenerator> fPaletGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage(selectedHoroscope.highImage));
    fPaletGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        baskinRenk = paletteGenerator.vibrantColor.color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Detail Page"),
        //   centerTitle: true,
        // ),
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          primary: true,
          backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
                "${ListHoroscope.horoscopeList[widget._index].horoscopeName} Burcu ve Özellikleri"),
            background: Image.asset(
              ListHoroscope.horoscopeList[widget._index].highImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ListHoroscope.horoscopeList[widget._index].dailyFeatures,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
