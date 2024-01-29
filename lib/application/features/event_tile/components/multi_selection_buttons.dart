import 'package:d_events/application/resource/theme_color.dart';
import 'package:design/buttons/i_elevated_button.dart';
import 'package:design/buttons/loading_button.dart';
import 'package:flutter/material.dart';

class MultiSelectionButtons extends StatelessWidget {
  final Function() onClickAttend;
  final Function() onClickCancelAttendance;
  final bool isLoading;

  const MultiSelectionButtons({
    Key? key,
    required this.onClickAttend,
    required this.onClickCancelAttendance,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: !isLoading ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: IElevatedButton(
              onPressed: onClickAttend,
              backgroundColor: ThemeColor.DarkPetrol,
              foregroundColor: Colors.white,
              childText: "Attending",
            ),
          ),
          Flexible(
            child: IElevatedButton(
              onPressed: onClickCancelAttendance,
              childText: "Not attending",
            ),
          ),
        ],
      ) : const LoadingButton(),
    );
  }
}
