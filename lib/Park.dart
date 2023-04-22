import 'dart:convert';

class Park{
  late String parkName;
  late int numberOfTimesCleaned;
  late DateTime date;

  // Park({required this.parkName, required this.numberOfTimesCleaned});

  Park(String parkName, int numberOfTimesCleaned) {
    this.parkName = parkName ;
    this.numberOfTimesCleaned = numberOfTimesCleaned;
    date = DateTime.now();
  }

  Park.withDate({required String parkName,
    required int numberOfTimesCleaned, required DateTime date});

  Map<String, dynamic> toJson() => {
    'parkName':parkName,
    'numberOfTimesCleaned':numberOfTimesCleaned,
    'date':date
  };

  factory Park.fromJson(Map<String, dynamic> json) =>
  Park.withDate(parkName: json['parkName'],
    numberOfTimesCleaned: json['numberOfTimesCleaned'],
    date: json['date']);

  cleanPark() {
    date = DateTime.now();
  }

  subtractNumberOfTimesCleaned() {
    if(numberOfTimesCleaned > 0){
      numberOfTimesCleaned--;
    }
  }

  int getTimeSinceLastCleaned() {
    var elapsedDate = DateTime.now().difference(date);
    return elapsedDate.inDays;
  }

  String getDate(){
    return '${date.month}-${date.day}-${date.year}';
  }

}