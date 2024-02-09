import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationBar(),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Home1Page(),
    Home2Page(),
    Home3Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MYAPP'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home3',
          ),
        ],
      ),
    );
  }
}

class Home1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Вы любите UIB?'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ответьте честно'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Да'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Нет'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('Нажми на кнопку'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Привееет'),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: Text('Нажми на кнопку'),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Home2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.green,
                    title: Row(
                      children: [
                        Icon(Icons.album),
                        SizedBox(width: 8),
                        Text('Sonu Nigam'),
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Best of Sonu Nigam Music'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Play'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Pause'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text('SONY'),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Center(child: Text('Имя')),
                    ),
                    TableCell(
                      child: Center(child: Text('Фамилия')),
                    ),
                    TableCell(
                      child: Center(child: Text('Год рождения')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(child: Text('Краш')),
                    ),
                    TableCell(
                      child: Center(child: Text('Камила')),
                    ),
                    TableCell(
                      child: Center(child: Text('2004')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(child: Text('Асылхан')),
                    ),
                    TableCell(
                      child: Center(child: Text('Арман')),
                    ),
                    TableCell(
                      child: Center(child: Text('2003')),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Center(child: Text('Кенжехан')),
                    ),
                    TableCell(
                      child: Center(child: Text('Алихан')),
                    ),
                    TableCell(
                      child: Center(child: Text('2006')),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Home3Page extends StatefulWidget {
  @override
  _Home3PageState createState() => _Home3PageState();
}

class _Home3PageState extends State<Home3Page> {
  bool? isFemale;
  List<String> hobbies = [];

  void _updateHobbies(String hobby, bool? isChecked) {
    setState(() {
      if (isChecked ?? false) {
        hobbies.add(hobby);
      } else {
        hobbies.remove(hobby);
      }
    });
  }

  void _updateGender(bool? isFemaleSelected) {
    setState(() {
      isFemale = isFemaleSelected ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home3'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Выбери то что ты любишь',
              style: TextStyle(fontSize: 18),
            ),
            CheckboxListTile(
              title: Text('футбол'),
              value: hobbies.contains('футбол'),
              onChanged: (isChecked) => _updateHobbies('футбол', isChecked),
            ),
            CheckboxListTile(
              title: Text('волейбол'),
              value: hobbies.contains('волейбол'),
              onChanged: (isChecked) => _updateHobbies('волейбол', isChecked),
            ),
            CheckboxListTile(
              title: Text('баскетбол'),
              value: hobbies.contains('баскетбол'),
              onChanged: (isChecked) => _updateHobbies('баскетбол', isChecked),
            ),
            SizedBox(height: 10),
            Text(
              'Я ЛЮБЛЮ: ${hobbies.join(", ")}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Выбери пол:',
              style: TextStyle(fontSize: 16),
            ),
            RadioListTile<bool>(
              title: Text('женский'),
              value: true,
              groupValue: isFemale ?? false,
              onChanged: _updateGender,
            ),
            RadioListTile<bool>(
              title: Text('мужской'),
              value: false,
              groupValue: isFemale ?? false,
              onChanged: _updateGender,
            ),
            SizedBox(height: 30),
            Text(
              'Привет: ${isFemale == true ? "Девушка" : "Парень"}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_2),
              title: Text('Имя'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Фамилия'),
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Контакты'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Настройки'),
            ),
          ],
        ),
      ),
    );
  }
}
