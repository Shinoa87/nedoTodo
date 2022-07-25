import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stajirovka2_todo_list/norm_app/norm_sheduled_page.dart';
import '../classes/new_task_screen.dart';
import '../classes/task_item.dart';
import 'package:table_calendar/table_calendar.dart';
import '../const.dart' ;
import '../norm_app/norm_completed_page.dart';
import '../widgets/reusable_task_card.dart';

class MyTodoApp extends StatefulWidget {
  const MyTodoApp({Key? key}) : super(key: key);

  @override
  State<MyTodoApp> createState() => _MyTodoAppState();
}

class _MyTodoAppState extends State<MyTodoApp> {
  // List<TaskItem> items = [];
  // int selectedIndex = 0;
  final Color scaffoldBackGroundColor = Colors.white;
  List<Widget> screens = [
    const NormSheduledPage(),
    const NormCompletedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackGroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.blue,
              pinned: false,
              expandedHeight: 90,
              leading: IconButton(
                alignment: Alignment.center,
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'To Do List',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontFamily: 'Avenir'
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Do something, you lazy ass',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Avenir',
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ),
            // items.isEmpty ? SliverFillRemaining(
            //   child: Container(
            //     color: scaffoldBackGroundColor,
            //     child: const Center(
            //       child: Text(
            //         'No tasks for today',
            //         style: TextStyle(
            //             color: Colors.grey,
            //             fontSize: 20
            //         ),
            //       ),
            //     ),
            //   ),
            // ) :
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //         (_, index) => reusableTaskCard(item: items[index],onClicked: () => removeItem(index)),
            //     childCount: items.length,
            //   ),
            // ),
            screens[selectedIndex],
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color:Colors.white,
        width: double.infinity,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey[400],
              selectedItemColor: const Color(0xff97D7B2) ,
              currentIndex: selectedIndex,
              onTap: (index)=> setState((){
                selectedIndex = index;
              }),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check_outlined),
                  label: 'Sheduled'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: 'Completed'
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(20.0))),
            backgroundColor: Colors.white,
            context: context,
            isScrollControlled: true,
            builder: (context) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: SizedBox(child: NewTaskScreen())),
          ).then((value){
            setState((){
              items.add(value as TaskItem);
            });
          });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
  // void removeItem(int index){
  //
  //   // final removedItem = items[index];
  //
  //   items.removeAt(index);
  //   setState((){});
  // }
}
