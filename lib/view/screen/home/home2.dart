import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/onclicked.dart';
import '../auth/animatedhover.dart';

class Client {
  final String name;
  final String photo;
  final String phoneNumber;
  final String city;
  final String street;

  Client({
    required this.name,
    required this.photo,
    required this.phoneNumber,
    required this.city,
    required this.street,
  });
}

class City {
  final String name;

  City({required this.name});
}

class Street {
  final String name;

  Street({required this.name});
}

class CitySearchPage extends StatefulWidget {
  @override
  _CitySearchPageState createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Durian',
    'Elderberry',
    'Fig',
    'Grapes',
    'Honeydew',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Pineapple',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tangerine',
    'Watermelon',
  ];
  List<String> filteredSuggestions = [];

  TextEditingController searchController = TextEditingController();

  void filterSuggestions(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredSuggestions = suggestions
            .where((suggestion) =>
                suggestion.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredSuggestions.clear();
      });
    }
  }

  final List<Client> clients = [
    Client(
      name: 'Boukhobza Sofiane',
      photo: 'assets/images/profil2.jpg',
      phoneNumber: '123456789',
      city: 'Algiers',
      street: 'Main Street',
    ),
    Client(
      name: 'Moh Larbito',
      photo: 'assets/images/profil1.png',
      phoneNumber: '987654321',
      city: 'Oran',
      street: 'Park Avenue',
    ),
    Client(
      name: 'Boukhobza toufik',
      photo: 'assets/images/profil4.png',
      phoneNumber: '123456789',
      city: 'Algiers',
      street: 'Main Street',
    ),
    Client(
      name: 'Boukhobza Sofiane',
      photo: 'assets/images/profil3.jpg',
      phoneNumber: '987654321',
      city: 'Oran',
      street: 'Park Avenue',
    ),
    Client(
      name: 'John Doe',
      photo: 'assets/images/profil2.jpg',
      phoneNumber: '123456789',
      city: 'Algiers',
      street: 'Main Street',
    ),
    Client(
      name: 'Jane Smith',
      photo: 'assets/images/logo.jpg',
      phoneNumber: '987654321',
      city: 'Oran',
      street: 'Park Avenue',
    ),
    Client(
      name: 'John Doe',
      photo: 'assets/images/logo.jpg',
      phoneNumber: '123456789',
      city: 'Algiers',
      street: 'Main Street',
    ),
    Client(
      name: 'Jane Smith',
      photo: 'assets/images/logo.jpg',
      phoneNumber: '987654321',
      city: 'Oran',
      street: 'Park Avenue',
    ),
    // Add more clients
  ];

  final List<City> cities = [
    City(name: 'Algiers'),
    City(name: 'Oran'),
    City(name: 'Constantine'),
    // Add more cities in Algeria
  ];
  final List<Street> street = [
    Street(name: 'Main Street'),
    Street(name: 'Main Street'),
    Street(name: 'Park Avenue'),
    // Add more cities in Algeria
  ];

  List<Client> filteredClients = [];

  @override
  void initState() {
    filteredClients = clients; // Initialize filteredClients with all clients
    super.initState();
  }

  void filterClientsByCity(String query) {
    setState(() {
      filteredClients = clients
          .where((client) =>
              client.city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void filterClientsByStreet(String query) {
    setState(() {
      filteredClients = clients
          .where((client) =>
              client.street.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Search for Dabah',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: searchController,
                            onChanged: (value) {
                              filterSuggestions(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12.0),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            // Perform search
                          },
                        ),
                      ],
                    ),
                    if (filteredSuggestions.isNotEmpty)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredSuggestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          final suggestion = filteredSuggestions[index];
                          return ListTile(
                            title: Text(suggestion),
                            onTap: () {
                              setState(() {
                                searchController.text = suggestion;
                                filteredSuggestions.clear();
                              });
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredClients.length,
                  itemBuilder: (context, index) {
                    final client = filteredClients[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AnimatedHover(
                        size: Size(365, 100),
                        hoverColor: Color(0xFFF7F1FB),
                        bgColor: Colors.white,
                        offset: Offset(10, 4),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                        borderRadiusShadow: BorderRadius.circular(12),
                        clicked: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: Container(
                            color: const Color(0xFFF7F1FB),
                            height: 100,
                            width: 300,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(client.photo),
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      client.name,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text('Willaya : ${client.city}'),
                                    Text('Telephone : ${client.phoneNumber}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
