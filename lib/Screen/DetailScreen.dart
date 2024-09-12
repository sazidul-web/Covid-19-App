import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Detailscreen extends StatefulWidget {
  String? image;
  String? name;
  int totalCases,
      totaldeats,
      totalrecovari,
      Active,
      critacal,
      test,
      todayrecovari;

  Detailscreen({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totaldeats,
    required this.totalrecovari,
    required this.Active,
    required this.critacal,
    required this.todayrecovari,
    required this.test,
  });

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name ?? 'No name provided'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .050),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReusableRow(
                          title: 'Total Cases',
                          value: widget.totalCases.toString(),
                        ),
                        ReusableRow(
                          title: 'Total Deaths',
                          value: widget.totaldeats.toString(),
                        ),
                        ReusableRow(
                          title: 'Total Recovery',
                          value: widget.totalrecovari.toString(),
                        ),
                        ReusableRow(
                          title: 'Active',
                          value: widget.Active.toString(),
                        ),
                        ReusableRow(
                          title: 'Critical',
                          value: widget.critacal.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(widget.image ?? 'No image provided'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;

  ReusableRow({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Divider(),
        ],
      ),
    );
  }
}
