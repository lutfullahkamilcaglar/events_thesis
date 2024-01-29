import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'i_text_button.dart';

class LoadingButton extends StatelessWidget {
  final String? message;

  const LoadingButton({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ITextButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message ?? "Loading",
              style: const TextStyle().copyWith(
                color: Colors.white,
              ),
            ), // TODO ext
            const SizedBox(width: 16),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.white,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}