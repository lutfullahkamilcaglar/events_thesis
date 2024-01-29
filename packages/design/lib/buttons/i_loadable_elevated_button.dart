import 'package:design/animation/animation_transitions.dart';
import 'package:design/animation/i_animated_size.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ILoadableElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;
  final double height;
  final String? childText;
  final EdgeInsetsGeometry padding;
  final bool isLoading;

  const ILoadableElevatedButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
    this.childText,
    this.height = 42,
    this.padding = const EdgeInsets.symmetric(horizontal: 16), required this.isLoading,
  })  : assert(child != null || childText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
        ),
        child: AnimatedContainer(
          alignment: Alignment.center,
          width: double.infinity,
          height: height,
          duration: const Duration(milliseconds: 300),
          child: IAnimatedSize(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child ??
                    Text(
                      childText!,
                      textAlign: TextAlign.center,
                    ),
                IAnimatedCrossFade(
                  firstChild: SizedBox(
                    height: height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                  secondChild: SizedBox(height: height),
                  condition: isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
