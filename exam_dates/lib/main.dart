import 'package:exam_dates/model/exam_date.dart';
import 'package:exam_dates/widgets/my_list_tyle.dart';
import 'package:exam_dates/widgets/new_element.dart';
import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exams',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Exams'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ExamDate> _examDates = [];

  void _removeExamDate(String id) {
    setState(() {
      _examDates.removeWhere((element) => element.id == id);
    });
  }

  void _addItem(ExamDate examDate) {
    setState(() {
      _examDates.add(examDate);
    });
  }

  void _addItemFunction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewElement(addItem: _addItem),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () => _addItemFunction(context),
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _examDates.length,
          itemBuilder: (contx, index) {
            return MyListTile(
              examDate: _examDates[index],
              removeExamDate: _removeExamDate,
            );
          },
        ),
      ),
    );
  }
}
