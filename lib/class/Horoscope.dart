class Horoscope {
  String _horoscopeName;
  String _horoscopeDate;
  String _dailyFeatures;
  String _miniImage;
  String _highImage;

  Horoscope(this._horoscopeName, this._horoscopeDate, this._dailyFeatures,
      this._miniImage, this._highImage);

  String get horoscopeName => _horoscopeName;

  set horoscopeName(String value) => _horoscopeName = value;

  String get horoscopeDate => _horoscopeDate;

  set horoscopeDate(String value) => _horoscopeDate = value;

  String get dailyFeatures => _dailyFeatures;

  set dailyFeatures(String value) => _dailyFeatures = value;

  String get miniImage => _miniImage;

  set miniImage(String value) => _miniImage = value;

  String get highImage => _highImage;

  set highImage(String value) => _highImage = value;

  
}
