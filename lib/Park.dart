class Park{
  String parkName;
  int numberOfTimesCleaned;
  DateTime date = DateTime.now();

  Park({required this.parkName, required this.numberOfTimesCleaned});

  cleanPark() {
    numberOfTimesCleaned++;
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