import 'package:flutter/material.dart';

class ToutesPages extends StatefulWidget {
  const ToutesPages({Key? key}) : super(key: key);

  @override
  State<ToutesPages> createState() => _ToutesPagesState();
}

class _ToutesPagesState extends State<ToutesPages> {
  bool isLoading = true;
  bool check = true;
  List<dynamic> pages = [];
  void getPages() async {
    if (isLoading == true) {
      try {

        setState(() {
          pages = [];
        });
        isLoading = false;
      } catch (e) {
        isLoading = true;
        if (check == true) {
          setState(() {
            pages = [1];
          });
          check = false;
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}