import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RepoListPage(),
    );
  }
}

class RepoListPage extends StatefulWidget {
  const RepoListPage({super.key});

  @override
  State<RepoListPage> createState() => _RepoListPageState();
}

class _RepoListPageState extends State<RepoListPage> {

  List<String> list = ['前方よしを考える', 'コトに向かって走れ', '共闘が一番燃える', '挑戦と利益がエンジン'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Github List'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home, color: Colors.red),
            title: const Text('前方よしを考える'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const RepoDetail(title: '前方よしを考える');
                    },
                  ),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.home, color: Colors.red),
            title: Text('コトに向かって走れ'),
          ),
          const ListTile(
            leading: Icon(Icons.home, color: Colors.red),
            title: Text('共闘が一番燃える'),
          ),
          const ListTile(
            leading: Icon(Icons.home, color: Colors.red),
            title: Text('挑戦と利益がエンジン'),
          ),
        ]
      ),
    );
  }
}

class RepoDetail extends StatelessWidget {
  const RepoDetail({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      )
    );
  }
}