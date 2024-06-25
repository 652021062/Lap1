import 'package:flutter/material.dart';
import 'package:BangYodz/nextpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 187, 207, 96),
      ),
      home: Finnishpage(),
    );
  }
}

class Finnishpage extends StatefulWidget {
  const Finnishpage({Key? key}) : super(key: key);

  @override
  State<Finnishpage> createState() => _FinnishpageState();
}

class _FinnishpageState extends State<Finnishpage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String username = '';
  String password = '';
  double weight = 60;
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 229, 106, 229), // กำหนดสีพื้นหลังของ AppBar ที่นี่
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 110, 110),
        ),
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  radius: 110,
                  backgroundImage: NetworkImage(
                    'https://xn--s3cfp2bu4c.com/image/552264a772c9846de279957fd636a8d2.RxOyA',
                  ),
                  onBackgroundImageError: (_, __) {
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      username = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value ?? '';
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Weight: ${weight.toStringAsFixed(1)} KG'),
              Slider(
                value: weight,
                min: 1,
                max: 200,
                divisions: 120,
                label: weight.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
              SizedBox(height: 12),
              Text('Height: ${height.toStringAsFixed(1)} CM'),
              Slider(
                value: height,
                min: 100,
                max: 300,
                divisions: 150,
                label: height.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => nextpage()),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    return const Color.fromARGB(255, 0, 2, 3);
                  }),
                ),
                child: Text('NEXT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
