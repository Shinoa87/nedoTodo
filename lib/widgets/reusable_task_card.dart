import 'package:flutter/material.dart';
import '../classes/task_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../const.dart';


  Widget reusableTaskCard({required TaskItem item, required VoidCallback onClicked}) => Container(
      margin: const EdgeInsets.only(bottom: 20, left: 14,right: 14, top: 20),
      decoration: BoxDecoration(
        border: Border.all(color:item.color),
        boxShadow: [
          BoxShadow(
            color: item.color,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
          borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      child: ExpansionTile(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          color: Colors.white
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(icon:const Icon(Icons.check_box_outlined),onPressed: onClicked),
                      IconButton(icon:const Icon(Icons.delete), onPressed: onClicked),
                    ],
                  ),
                ],
              ),
              Text(
                item.date.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                    color: Color(0xFF0F0E17)
                ),
              ),
              const Divider(
                height: 1,
                color:Colors.black,
              ),
            ],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Статус : '
                      '${item.priority}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF0F0E17)
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 1,
                  decoration:BoxDecoration(
                    border: Border.all(color:Colors.black)
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Описание задачи: ${item.description}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF0F0E17)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );