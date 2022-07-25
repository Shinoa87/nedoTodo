import 'package:flutter/material.dart';

import '../classes/task_item.dart';
import '../const.dart';
import '../widgets/reusable_task_card.dart';


class NormCompletedPage extends StatefulWidget {
  const NormCompletedPage({Key? key}) : super(key: key);

  @override
  State<NormCompletedPage> createState() => _NormCompletedPageState();
}

class _NormCompletedPageState extends State<NormCompletedPage> {
  // List<TaskItem> completedItems = [];

  @override
  Widget build(BuildContext context) {
    return completedItems.isEmpty ? SliverFillRemaining(
      child: Container(
        color: scaffoldBackGroundColor,
        child: const Center(
          child: Text(
            'No completed tasks for today',
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
            (_, index) => reusableTaskCard(item: completedItems[index],onClicked:() => removeCompleteItem(index)),
        childCount: completedItems.length,
      ),
    );
  }
  void removeCompleteItem(int index){

    setState((){
      completedItems.removeAt(index);
    });
  }
}