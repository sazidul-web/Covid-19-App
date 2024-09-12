import 'package:covid_19_api_project/Sarvices/State_sarvice.dart';
import 'package:covid_19_api_project/Screen/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Countriespagelist extends StatefulWidget {
  @override
  State<Countriespagelist> createState() => _CountriespagelistState();
}

class _CountriespagelistState extends State<Countriespagelist> {
  TextEditingController serchController =
      TextEditingController(); // Typer korle ai controller chole ashbe alda vabe nita hobe na.
  StateSarvice stateSarvice = StateSarvice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: serchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search with Country name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateSarvice.CountriesList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Loding...');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (serchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detailscreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['flag'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                todayrecovari:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                totaldeats: snapshot
                                                    .data![index]['deaths'],
                                                totalrecovari: snapshot
                                                    .data![index]['recovered'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                Active: snapshot.data![index]
                                                    ['active'],
                                                critacal: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50.h,
                                    width: 50.w,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(serchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detailscreen(
                                                name: snapshot.data![index]
                                                    ['country'],
                                                image: snapshot.data![index]
                                                    ['flag'],
                                                totalCases: snapshot
                                                    .data![index]['cases'],
                                                todayrecovari:
                                                    snapshot.data![index]
                                                        ['todayRecovered'],
                                                totaldeats: snapshot
                                                    .data![index]['deaths'],
                                                totalrecovari: snapshot
                                                    .data![index]['recovered'],
                                                test: snapshot.data![index]
                                                    ['tests'],
                                                Active: snapshot.data![index]
                                                    ['active'],
                                                critacal: snapshot.data![index]
                                                    ['critical'],
                                              )));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]['country'],
                                  ),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                  leading: Image(
                                    height: 50.h,
                                    width: 50.w,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
