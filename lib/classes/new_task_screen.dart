import 'package:flutter/material.dart';
import '../classes/task_item.dart';
import 'new_task_form.dart';



class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.50,
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 8.0, top: 24, left: 16, right: 16),
                  child: Text(
                    "Add new Task",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
              ],
            ),
            const NewTaskForm(),
          ],
        ),
      ),
    );
  }
}


