import 'package:d_events/application/features/auth/util/extensions.dart';
import 'package:design/animation/animation_transitions.dart';
import 'package:design/animation/i_animated_size.dart';
import 'package:design/buttons/i_elevated_button.dart';
import 'package:design/buttons/i_loadable_elevated_button.dart';
import 'package:design/textfield/i_text_field.dart';
import 'package:design/textfield/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/util/loadable_completion_state.dart';
import '../../../domain/static/platforms.dart';
import '../../resource/theme_color.dart';
import 'bloc/profile_cubit.dart';
import 'bloc/profile_view_state.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController displayNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileViewState>(
      builder: (context, state) {
        return FractionallySizedBox(
          widthFactor: 0.9,
          heightFactor: 0.9,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 48),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          ITextField(
                            labelText: "Display name",
                            height: 52,
                            initialValue: state.displayName,
                            onChanged: BlocProvider.of<ProfileCubit>(context).onDisplayNameChanged,
                            validator: Validators.requiredValidator,
                            enabled: !state.isLocked,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    Card(
                      margin: EdgeInsets.zero,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          focusNode: FocusNode(canRequestFocus: false),
                          value: state.platformIndex,
                          isExpanded: true,
                          iconSize: 0.0,
                          items: [...Platforms.entries.map((it) => DropdownMenuItem(value: it.key, child: _dText(it.value))).toList()],
                          onChanged: state.isLocked
                              ? null
                              : BlocProvider.of<ProfileCubit>(context).onPlatformIndexChanged,
                        ),
                      ),
                    ),
                    const SizedBox(height: 56),
                    ILoadableElevatedButton(
                      isLoading: state.completionState is Loading,
                      onPressed: () {
                        final cubit = BlocProvider.of<ProfileCubit>(context);
                        if (state.isLocked) {
                          cubit.onUnlockClicked();
                        } else {
                          formKey.tryAction(
                            ifValid: cubit.onSaveClicked,
                            ifNotValid: () {},
                          );
                        }
                      },
                      backgroundColor: ThemeColor.DarkPetrol,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      height: 48,
                      childText: state.isLocked ? "Edit" : "Save",
                    ),
                    IAnimatedSize(
                      child: IAnimatedCrossFade(
                        firstChild: SizedBox(
                          width: constraints.maxWidth,
                          child: IElevatedButton(
                            onPressed: BlocProvider.of<ProfileCubit>(context).lockScreen,
                            childText: "Cancel",
                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                          ),
                        ),
                        secondChild: SizedBox(width: constraints.maxWidth),
                        condition: !state.isLocked && state.completionState is! Loading,
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        );
      },
    );
  }

  Widget _dText(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        value,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
