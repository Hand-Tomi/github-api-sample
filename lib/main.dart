import 'package:dio/dio.dart';
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

class Repo {
  const Repo({
    required this.id,
    required this.fullName,
  });

  final int id;
  final String fullName;
}

class _RepoListPageState extends State<RepoListPage> {
  final repoList = <Repo>[];

  @override
  void initState() {
    super.initState();
    _getRepos();
  }

  void _getRepos() async {
    try {
      var response = await Dio().get('https://api.github.com/orgs/flutter/repos');
      final data = response.data;
      setState(() {
        repoList.clear();
        repoList.addAll(data.map<Repo>((item) => Repo(id: item['id'], fullName: item['full_name'])).toList());
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Github List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: repoList.length,
        itemBuilder: (BuildContext context, int index) {
          final text = repoList[index].fullName;
          return ListTile(
            leading: const Icon(Icons.home, color: Colors.red),
            title: Text(text),
            onTap: () => Navigator.of(context).push(RepoDetail.route(text)),
          );
        },
      ),
    );
  }
}

class RepoDetail extends StatelessWidget {
  const RepoDetail({super.key, required this.title});

  static MaterialPageRoute route(final String text) {
    return MaterialPageRoute(
      builder: (context) {
        return RepoDetail(title: text);
      },
    );
  }

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