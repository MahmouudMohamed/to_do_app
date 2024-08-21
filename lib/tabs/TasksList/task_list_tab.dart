import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:to_do_app/firebase/firebase_functions.dart';
import 'package:to_do_app/tabs/TasksList/task_item.dart';

import '../../app_color.dart';

class TaskListTab extends StatefulWidget {
  TaskListTab({super.key});

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "todo".tr(),
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          EasyDateTimeLine(
            locale: "en",
            onDateChange: (selectDate) {
              selectedDate = selectDate;
              setState(() {
              });
            },
            initialDate: selectedDate,
            headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                dateFormatter: DateFormatter.fullDateMonthAsStrDY()),
            activeColor: AppColor.primaryColor,
            dayProps: const EasyDayProps(
                todayHighlightStyle: TodayHighlightStyle.withBorder,
                todayHighlightColor: Colors.cyan),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFunctions.getTasks(selectedDate),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ));
                }
                if (snapshot.hasError) {
                  return Center(child: Text("There is Something Wrong"));
                }
                var tasks =
                    snapshot.data?.docs.map((docs) => docs.data()).toList();
                if (tasks?.isEmpty ?? true) {
                  return Text("No Tasks");
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return TaskItem(
                        model: tasks[index],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: tasks!.length);
              },
            ),
          )
        ],
      ),
    );
  }
}
// SizedBox(height: 25,),
//         CalendarTimeline(
//           showYears: true,
//           initialDate: DateTime.now(),
//           firstDate: DateTime.now().subtract(Duration(days: 365)),
//           lastDate: DateTime.now().add(Duration(days: 365)),
//           onDateSelected: (date) => print(date),
//           leftMargin: 10,
//           monthColor: Colors.black,
//           dayColor: AppColor.primaryColor,
//           activeDayColor: Colors.white,
//           activeBackgroundDayColor: AppColor.primaryColor,
//           dotColor: AppColor.whiteColor,
//           selectableDayPredicate: (date) => date.day != 23,
//           locale: 'en',
//         ),

// DatePicker(
//   height: 100,
//   DateTime.now(),
//   initialSelectedDate: DateTime.now(),
//   selectionColor: Colors.blue,
//   selectedTextColor: Colors.white,
//   onDateChange: (date) {
//     // New date selected
//   },
// ),
