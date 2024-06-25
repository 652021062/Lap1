import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: nextpage(),
    ));

class nextpage extends StatefulWidget {
  const nextpage({Key? key}) : super(key: key);

  @override
  _nextpageState createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  String? _selectedMajor;
  String? _selectedLanguage;
  bool _agreedToTerms = false;

  Widget _buildLanguageButton(String language) {
    bool isSelected = _selectedLanguage == language;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Color.fromARGB(255, 240, 111, 212) : Colors.grey,
          elevation: isSelected ? 10.0 : 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        ),
        onPressed: () {
          setState(() {
            _selectedLanguage = language;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: language,
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              language,
              style: TextStyle(
                fontSize: 20.0,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Form'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 237, 103, 197), // กำหนดสีพื้นหลังของ AppBar ที่นี่
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 229, 89, 89),
        ),
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Major',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Center(
                  child: ToggleButtons(
                    isSelected: [
                      _selectedMajor == 'Computer Science',
                      _selectedMajor == 'Information Technology'
                    ],
                    onPressed: (index) {
                      setState(() {
                        if (index == 0) {
                          _selectedMajor = 'Computer Science';
                        } else {
                          _selectedMajor = 'Information Technology';
                        }
                      });
                    },
                    borderColor: Colors.grey,
                    selectedBorderColor: Colors.blue,
                    borderWidth: 2,
                    selectedColor: Colors.white,
                    fillColor: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            'Computer Science',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedMajor == 'Computer Science'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 25,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 46, vertical: 8),
                          child: Text(
                            'Information Technology',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _selectedMajor == 'Information Technology'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Language',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildLanguageButton('Thai'),
                    _buildLanguageButton('English'),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      value: _agreedToTerms,
                      activeColor: const Color.fromARGB(255, 124, 183, 231),
                      onChanged: (value) {
                        setState(() {
                          _agreedToTerms = value!;
                        });
                      },
                    ),
                    Text(
                      'Agree Condition Terms',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 97, 22),
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _agreedToTerms ? () {} : null,
                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _agreedToTerms
                        ? const Color.fromARGB(255, 5, 9, 12)
                        : Colors.grey,
                    padding: EdgeInsets.symmetric(
                        horizontal: 150, vertical: 15),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
