import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/tabs/TasksList/add_task_bt_sheet.dart';
import 'package:to_do_app/tabs/setting_tab.dart';
import 'package:to_do_app/tabs/TasksList/task_list_tab.dart';

import 'app_color.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BottomAppBar(
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Task List",),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Setting"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: AppColor.backgroundColorLight,
            context: context,
            builder: (context) => AddTaskBtSheet(),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColor.whiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Expanded(child: tabs[selectedIndex]),
        ],
      ),
    );
  }

  List<Widget> tabs = [
    TaskListTab(),
    SettingTab(),
  ];
}
