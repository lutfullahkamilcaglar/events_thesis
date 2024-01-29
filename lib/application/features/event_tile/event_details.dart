import 'package:auto_route/auto_route.dart';
import 'package:d_events/application/resource/theme_color.dart';
import 'package:d_events/data/model/util/effect_state.dart';
import 'package:design/buttons/i_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../routes/app_router.dart';
import '../main/bloc/main_cubit.dart';
import '../main/bloc/main_view_state.dart';
import 'components/selection_buttons.dart';
import 'event_tile_attendants.dart';

class EventDetails extends StatefulWidget {
  final String eventUid;

  const EventDetails(this.eventUid, {Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  late MainCubit cubit;
  bool isLoading = false;

  @override
  void initState() {
    cubit = BlocProvider.of<MainCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: ThemeColor.DarkPetrol,
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<MainCubit, MainViewState>(
        listener: (context, state) {
          final inProgress = state.callInProgress[widget.eventUid] ?? false;
          if (mounted) setState(() => isLoading = inProgress);

          if (state.effectState is Effect) {
            final message = (state.effectState as Effect).message;
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
            BlocProvider.of<MainCubit>(context).onConsumeEffect();
          }
        },
        builder: (context, state) {
          final event = cubit.eventOf(widget.eventUid);
          return SafeArea(
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 16,
                        children: [
                          Text(
                            DateFormat('E, MMM d, y').format(event.eventDate),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ITextButton(
                                childText: "+${event.attendantCount} Attending",
                                width: 128,
                                onPressed: () => showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return EventTileAttendants(attendants: event.attendants);
                                  },
                                  settings: const RouteSettings(
                                    name: NavRoutes.attendantsBottomSheet,
                                  ),
                                ),
                                padding: EdgeInsets.zero,
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                onPressed: () =>
                                    cubit.launchEventUrl(event.eventLink),
                                icon: const Icon(Icons.link_rounded),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Description",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        event.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 36),
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 100),
                        alignment: MediaQuery.of(context).size.width <= 800 ? Alignment.center : Alignment.centerLeft,
                        child: SizedBox(
                          width: 420,
                          child: SelectionButtons(
                            padding: const EdgeInsets.only(bottom: 16),
                            isAttending: cubit.getUsersEventAttendance(event),
                            isLoading: isLoading,
                            onClickAttend: () => cubit.attendEvent(event),
                            onClickCancelAttendance: () => cubit.cancelAttendingEvent(event),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
