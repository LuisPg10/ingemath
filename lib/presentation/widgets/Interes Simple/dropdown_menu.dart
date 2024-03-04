import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DropdownMenuItemVariable(),
    );
  }
}


class DropdownMenuItemVariable extends StatefulWidget {
  const DropdownMenuItemVariable({super.key});

  @override
  State<DropdownMenuItemVariable> createState() => _DropdownMenuItemVariableState();
}

class _DropdownMenuItemVariableState extends State<DropdownMenuItemVariable> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}