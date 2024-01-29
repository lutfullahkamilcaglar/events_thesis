import 'package:design/buttons/loadable_text_button.dart';
import 'package:flutter/material.dart';
import '../../../resource/theme_color.dart';
import 'multi_selection_buttons.dart';

class SelectionButtons extends StatelessWidget {
  final Function() onClickAttend;
  final Function() onClickCancelAttendance;
  final bool? isAttending;
  final bool isLoading;
  final EdgeInsetsGeometry padding;

  const SelectionButtons({
    Key? key,
    required this.isAttending,
    required this.isLoading,
    required this.onClickAttend,
    required this.onClickCancelAttendance,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _getButton()
      ),
    );
  }

  Widget _getButton() {
    const String cancelAttendance = "Cancel attendance";
    const String considerAttending = "Attend";

    if (isAttending == null) {
      return MultiSelectionButtons(
        onClickAttend: onClickAttend,
        onClickCancelAttendance: onClickCancelAttendance,
        isLoading: isLoading,
      );
    } else {
      return LoadableTextButton(
        text1: cancelAttendance,
        color1: ThemeColor.Maize,
        text2: considerAttending,
        color2: ThemeColor.DarkPetrol,
        foregroundColor2: ThemeColor.White,
        condition: isAttending!,
        isLoading: isLoading,
        onTap1: onClickCancelAttendance,
        onTap2: onClickAttend,
      );
    }
  }
}
