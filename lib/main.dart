import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: ShoesListApp(),
        ),
      ),
    );
  }
}

class ShoesListApp extends StatelessWidget {
  final List<Map<String, dynamic>> shoesList = [
    {
      'name': 'Nike Zoom M2',
      'deskripsi': 'Nike Premium 20352',
      'imagePath': 'assets/images/nike1.png',
      'backgroundColor': Color(0xFFCFC6E4),
    },
    {
      'name': 'Adidas Shoes',
      'deskripsi': 'New Adidas Black mat ',
      'imagePath': 'assets/images/nike2.png',
      'backgroundColor': Color(0xFFFBE9E9),
    },
    {
      'name': 'Puma Shoes',
      'deskripsi': 'Puma Origanal Rb',
      'imagePath': 'assets/images/nike3.png',
      'backgroundColor': Color(0xFFEAE8E9),
    },
    {
      'name': 'Reebok Shoes',
      'deskripsi': 'Rebook Origanal 2253',
      'imagePath': 'assets/images/adidas.png',
      'backgroundColor': Color(0xFFFCF2B2),
    },
    {
      'name': 'New Balance Shoes',
      'deskripsi': 'Vans Origanal Vietnam',
      'imagePath': 'assets/images/vans.png',
      'backgroundColor': Color(0xFFBABAE8),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shoes',
          style: TextStyle(
            color: const Color.fromARGB(255, 75, 75, 75),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, top: 8, right: 30, bottom: 8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/myavatar.png'),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoesList.length,
        itemBuilder: (context, index) {
          final shoes = shoesList[index];
          return ShoesCard(
            name: shoes['name'],
            deskripsi: shoes['deskripsi'],
            imagePath: shoes['imagePath'],
            backgroundColor: shoes['backgroundColor'],
          );
        },
      ),
    );
  }
}

class ShoesCard extends StatelessWidget {
  final String? name;
  final String? deskripsi;
  final String? imagePath;
  final Color? backgroundColor;

  const ShoesCard({
    this.deskripsi,
    this.name,
    this.imagePath,
    this.backgroundColor = Colors.lightBlue, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                deskripsi ?? '',
                style: TextStyle(
                  color: const Color.fromARGB(255, 75, 75, 75),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Image(
            image: AssetImage(imagePath ?? ''),
            height: 150.0,
            width: 150.0,
          ),
        ],
      ),
    );
  }
}
