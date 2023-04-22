import 'package:flutter/material.dart';
import 'package:trash_app/user_secure_storage.dart';
import 'Park.dart';
import 'package:buttons_flutter/buttons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Park> parks = [];
  // List<Park> parks = [
  //   Park(parkName: "Park Point", numberOfTimesCleaned: 0),
  //   Park(parkName: "Fake park 1", numberOfTimesCleaned: 0),
  //   Park(parkName: "Fake Park 2", numberOfTimesCleaned: 0)
  // ];

  @override
  void initState() {
    super.initState();

    init();
  }

  Widget parkTemplate(Park park) {
    return Card(
      color: Colors.green[100],
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
        //Row is breaking stuff
        // child: Row(
        //   children: <Widget>[
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  park.parkName,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.greenAccent
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Cleaned ${park.numberOfTimesCleaned} times',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.green[500]
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Last cleaned ${park.getTimeSinceLastCleaned()}'
                      ' days ago on ${park.getDate()}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.green[300]
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20
                      ),
                      bgColor: Colors.green[600],
                      child: const Text(
                        'Just Cleaned!'
                      ),
                      onPressed: () {setState(() {
                        park.cleanPark();
                      });},
                    ),
                    Button(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20
                      ),
                      bgColor: Colors.red[400],
                      child: const Text(
                        'Undo Cleaned'
                      ),
                      onPressed: () {setState(() {
                        park.subtractNumberOfTimesCleaned();
                      });},
                    )
                  ],
                )

              ],
            )
      ),
    );
  }

  Future init() async {
    UserSecureStorage.setParks([
      Park(parkName: "Park Point", numberOfTimesCleaned: 0),
      Park(parkName: "Fake park 1", numberOfTimesCleaned: 0),
      Park(parkName: "Fake Park 2", numberOfTimesCleaned: 0)
    ]);
    final parks = await UserSecureStorage.getParks() ?? [];

    setState(() {
      this.parks = parks;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trash App',
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 3,
          ),
          ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        color: Colors.yellow[150],
        child: Column(
          children: parks.map((park) => parkTemplate(park)).toList()
          ),
      )
    );
  }
}

void main() {

  runApp(const MaterialApp(
    home: HomeScreen()),
  );

}
