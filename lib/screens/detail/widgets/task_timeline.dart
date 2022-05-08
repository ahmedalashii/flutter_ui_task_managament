import "package:flutter/material.dart";
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String, dynamic> detail;

  const TaskTimeLine({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeline(color: detail["tlColor"]),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detail["time"]),
                detail["title"].isNotEmpty
                    ? _buildCard(
                        bgColor: detail["bgColor"],
                        title: detail["title"],
                        slot: detail["slot"])
                    : _buildCard(bgColor: Colors.white, title: "", slot: ""),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      {required Color bgColor, required String title, required String slot}) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            slot,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline({required Color color}) {
    return SizedBox(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: color),
            ),
          ),
        ),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: color,
        ),
      ),
    );
  }
}
