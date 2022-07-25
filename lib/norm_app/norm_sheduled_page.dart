import 'package:flutter/material.dart';

import '../classes/task_item.dart';
import '../const.dart';
import '../widgets/reusable_task_card.dart';
import '../screens/my_todo_app.dart';


class NormSheduledPage extends StatefulWidget {
  const NormSheduledPage({Key? key}) : super(key: key);

  @override
  State<NormSheduledPage> createState() => _NormSheduledPageState();
}

class _NormSheduledPageState extends State<NormSheduledPage> {
  // List<TaskItem> items = [];

  @override
  Widget build(BuildContext context) {
    return items.isEmpty ? SliverFillRemaining(
      child: Container(
        color: scaffoldBackGroundColor,
        child: const Center(
          child: Text(
            'No tasks for today',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20
            ),
          ),
        ),
      ),
    ) :
    SliverList(
      delegate: SliverChildBuilderDelegate(
            (_, index) => reusableTaskCard(item: items[index],onClicked: () => removeItem(index)),
        childCount: items.length,
      ),
    );
  }
  void removeItem(int index){

    setState((){
      items.removeAt(index);
    });
  }
}