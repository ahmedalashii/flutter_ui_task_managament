import "package:flutter/material.dart";

import '../../models/task.dart';
import 'widgets/date_picker.dart';
import 'widgets/task_timeline.dart';
import 'widgets/task_title.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    final detailList = task.description;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  DatePicker(),
                  TaskTitle(),
                ],
              ),
            ),
          ),
          (detailList == null)
              ? SliverFillRemaining(
                  child: Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "No Task Today",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                )
              : SliverList(
            delegate: SliverChildBuilderDelegate(
                (_,int index){
                  return TaskTimeLine(detail: detailList[index]);
                },
              childCount: detailList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
        ),
        iconSize: 20,
      ),
      actions: const [
        Icon(Icons.more_vert, size: 35),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${task.title} tasks",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "You Have ${task.left} tasks for today!",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
