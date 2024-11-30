import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Conttroles/wetherconttrols.dart';
import '../../../Helper/api_helper.dart';
import '../../../Modal/wethermodals.dart';

String city = "Mumbai";
TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Consumer<WeatherConttrols>(builder: (context, provider, _) {
          return FutureBuilder(
              future: provider.fetchWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("error : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  Weather? data = snapshot.data;
                  return SafeArea(
                    child: Stack(
                      children: [
                        Container(
                          height: 950,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://static.vecteezy.com/system/resources/thumbnails/030/353/225/small_2x/beautiful-night-sky-background-ai-generated-photo.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Welcome",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  TextFormField(
                                    controller: searchController,
                                    cursorColor: Colors.white,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      focusColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      hintText: "Search City",
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Text(
                                    "${data?.current.tempC}°C",
                                    style: const TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ), //allWeatherData['current']['condition']['icon']
                                  Image.network(
                                    "https:${data?.current.condition.icon}",
                                    scale: 0.6,
                                  ),
                                  Text(
                                    "${data?.location.name}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 200,
                                  ),
                                ],
                              ),
                              Text(
                                "Time : ${data?.location.localtime}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Temp : ${data?.current.tempC}",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "City : ${data?.location.name}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            city = searchController.text;
          },
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}
