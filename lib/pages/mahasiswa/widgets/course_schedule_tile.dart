import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';
import '../models/course_schedule_model.dart';

class CourseScheduleTile extends StatelessWidget {
  final CourseScheduleModel data;
  const CourseScheduleTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 65.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(data.startTime),
                  Text(
                    data.endTime,
                    style: const TextStyle(
                      color: ColorName.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          const VerticalDivider(),
          const SizedBox(width: 12.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown, // Sesuaikan dengan preferensi Anda
                  child: Text(
                    data.course,
                    style: const TextStyle(
                      color: ColorName.primary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 18.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Dosen: ${data.lecturer}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 18.0),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    data.description,
                    style: const TextStyle(
                      color: ColorName.grey,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
