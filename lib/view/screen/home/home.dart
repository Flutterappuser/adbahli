import 'package:adbahli/view/screen/auth/animatedhover.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text('Search For dabah'),
              SizedBox(
                height: 45,
                width: 360,
                child: TextField(
                  style: TextStyle(
                    color: const Color(0xff020202),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xfff1f1f1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search for Items",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [],
                    )
                  ],
                ),
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow

                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(4, 4), // changes position of shadow
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
