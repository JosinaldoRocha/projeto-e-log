import 'package:e_log_social/app/modules/refer-and-win/views/states/indications_state.dart';
import 'package:flutter/material.dart';

class SuccessIndicationWidget extends StatelessWidget {
  const SuccessIndicationWidget({
    super.key,
    required this.index,
    required this.state,
  });
  final int index;
  final SuccessIndicationsState state;

  @override
  Widget build(BuildContext context) {
    return (state.listData[index].successIndications)
        ? const SizedBox(
            width: 34.24,
            height: 34.24,
            child: CircleAvatar(
              backgroundColor: Color.fromRGBO(21, 192, 171, 1),
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 25,
              ),
            ),
          )
        : Container(
            width: 34.24,
            height: 34.24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 5,
                color: const Color.fromRGBO(251, 176, 59, 1),
              ),
            ),
          );
  }
}
