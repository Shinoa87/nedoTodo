import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stajirovka2_todo_list/classes/task_item.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({Key? key,}) : super(key: key);

  @override
  NewTaskFormState createState() => NewTaskFormState();
}

class NewTaskFormState extends State<NewTaskForm> {
  final _formKey = GlobalKey<FormState>();
  final timeController = TextEditingController();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final _priorities = ['Очень важно', 'Просто нужно', 'Пофиг, пляшем'];
  var _currentItemSelected = 'Просто нужно';
  static const colorPriority = [Color(0xffED638B),Color(0xff68E3BE),Color(0xff82C0F1)];
  DateTime selectedDate = DateTime.now();
   String formattedTime = 'Выбрать дату';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a name for your task";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                  child: TextFormField(
                    maxLines: 4,
                    controller: descController,
                    decoration: InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child:  Text(_getFormattedTime(), style: const TextStyle(),),
                    ),
                    DropdownButton<String>(
                      items: _priorities.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),

                      onChanged: (String? newValueSelected) {
                        _onDropDownItemSelected(newValueSelected!);
                      },
                      value: _currentItemSelected,
                    ),
                  ],
                ),
                ElevatedButton(
                  child: const Text('Создать задачу', style: TextStyle(color: Color(0xff97D7B2), fontSize: 16),),
                  onPressed: () => _createTaskForm(context),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  _createTaskForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final TaskItem taskItem = TaskItem(date: _getFormattedTime(), color: colorPriority[_priorities.indexOf(_currentItemSelected)],priority:_currentItemSelected ,title:titleController.text,description:descController.text);
      Navigator.of(context).pop(taskItem);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  String _getFormattedTime() {
    final String formattedDateTime =
    DateFormat.yMMMMd('en_US').format(selectedDate).toString();
    setState(() {
      formattedTime = formattedDateTime;
    });
    return formattedTime;
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }
}

