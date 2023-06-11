import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irllink/src/domain/entities/twitch_poll.dart';
import 'package:irllink/src/domain/entities/twitch_prediction.dart';
import 'package:irllink/src/presentation/controllers/twitch_tab_view_controller.dart';
import 'package:irllink/src/presentation/widgets/alert_message_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TwitchTabView extends GetView<TwitchTabViewController> {
  const TwitchTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.refreshData();
        return Future.delayed(const Duration(seconds: 1));
      },
      child: SingleChildScrollView(
        child: Obx(
          () => Container(
            padding: const EdgeInsets.only(left: 20.0, top: 12.0, right: 20.0),
            color: Theme.of(context).colorScheme.background,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: controller.isDemo.value,
                  child: const AlertMessageView(
                    color: Color(0xFF196DEE),
                    message: "DEMO",
                    isProgress: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    animateFromLastPercent: true,
                    barRadius: const Radius.circular(8),
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    lineHeight: 3.0,
                    percent: controller.myDuration.value.inSeconds / 15,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    progressColor: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: controller.twitchStreamInfos.value.isOnline!
                              ? Colors.red
                              : Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        const Padding(padding: EdgeInsets.only(right: 6.0)),
                        Text(
                          controller.twitchStreamInfos.value.isOnline!
                              ? "live".tr
                              : "offline".tr,
                          style: TextStyle(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyLarge!
                                .color,
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: controller.twitchStreamInfos.value.isOnline!,
                      child: Text(controller
                          .twitchStreamInfos.value.startedAtDuration
                          .toString()
                          .substring(0, 7)),
                    ),
                    Visibility(
                      visible: controller.homeViewController.settings.value
                          .displayViewerCount!,
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline, color: Colors.red),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            controller.twitchStreamInfos.value.viewerCount
                                .toString(),
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "viewers".tr,
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .textTheme
                                  .bodyLarge!
                                  .color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 12, right: 10),
                        child: TextFormField(
                          controller: controller.titleFormController,
                          focusNode: controller.focus,
                          style: Theme.of(Get.context!).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 7),
                            hintText: 'Your stream\'s title',
                            labelText: 'stream_title'.tr,
                            labelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 11),
                        backgroundColor: Colors.deepPurpleAccent,
                        fixedSize: const Size(50, 20),
                      ),
                      onPressed: () {
                        controller.setStreamTitle();
                        FocusScope.of(context).unfocus();
                      },
                      child: Text(
                        'change'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 40,
                  thickness: 4,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Text(
                  "shortcuts".tr,
                  style: TextStyle(
                    color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.only(top: 10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  children: [
                    _shortcutButton(
                      context,
                      'follower_only'.tr,
                      () => {
                        controller.toggleFollowerOnly(),
                      },
                      controller.twitchStreamInfos.value.isFollowerMode!,
                    ),
                    _shortcutButton(
                      context,
                      'subscriber_only'.tr,
                      () => {
                        controller.toggleSubOnly(),
                      },
                      controller.twitchStreamInfos.value.isSubscriberMode!,
                    ),
                    _shortcutButton(
                      context,
                      'emote_only'.tr,
                      () => {
                        controller.toggleEmoteOnly(),
                      },
                      controller.twitchStreamInfos.value.isEmoteMode!,
                    ),
                    _shortcutButton(
                      context,
                      'slow_mode'.tr,
                      () => {
                        controller.toggleSlowMode(),
                      },
                      controller.twitchStreamInfos.value.isSlowMode!,
                    ),
                  ],
                ),
                // Divider(
                //   height: 40,
                //   thickness: 4,
                //   indent: 0,
                //   endIndent: 0,
                //   color: Theme.of(context).colorScheme.secondary,
                // ),
                // _prediction(context, controller),
                // Divider(
                //   height: 40,
                //   thickness: 4,
                //   indent: 0,
                //   endIndent: 0,
                //   color: Theme.of(context).colorScheme.secondary,
                // ),
                // _poll(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget prediction(
  BuildContext context,
  TwitchTabViewController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Prediction",
        style: TextStyle(
          color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      controller.prediction != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.prediction!.value.title),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.prediction!.value.outcomes.length,
                  itemBuilder: (context, index) {
                    final outcome =
                        controller.prediction!.value.outcomes[index];
                    final percentage =
                        outcome.users / controller.prediction!.value.totalUsers;
                    return Visibility(
                      visible: (controller.prediction!.value.status ==
                              PredictionStatus.active ||
                          controller.prediction!.value.status ==
                              PredictionStatus.locked ||
                          (controller.prediction!.value.status ==
                                  PredictionStatus.resolved &&
                              outcome.id ==
                                  controller
                                      .prediction!.value.winningOutcomeId)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.prediction!.value.status ==
                                    PredictionStatus.resolved
                                ? "Winner: ${outcome.title}"
                                : outcome.title,
                            style: TextStyle(
                              color: Theme.of(Get.context!)
                                  .textTheme
                                  .bodyLarge!
                                  .color,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          LinearPercentIndicator(
                            animation: true,
                            animateFromLastPercent: true,
                            barRadius: const Radius.circular(8),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 0.0),
                            lineHeight: 20.0,
                            percent: percentage,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            progressColor: outcome.color,
                            center: Text(
                                "${(percentage * 100).toStringAsFixed(2)} %"),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
                Visibility(
                  visible: controller.prediction!.value.status !=
                      PredictionStatus.canceled,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        onPressed: () {
                          controller.endPrediction("CANCELED", null);
                        },
                        child: Text(
                          "cancel".tr,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          controller.prediction!.value.status ==
                                  PredictionStatus.active
                              ? controller.endPrediction("LOCKED", null)
                              : pickWinnerDialog(
                                  context,
                                  controller.prediction!.value,
                                  controller.endPrediction,
                                  controller);
                        },
                        child: Text(
                          controller.prediction!.value.status ==
                                  PredictionStatus.active
                              ? 'Lock'
                              : 'End',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No prediction running",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Create one',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
    ],
  );
}

Widget poll(
  BuildContext context,
  TwitchTabViewController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Poll",
        style: TextStyle(
          color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),
      controller.poll != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.poll!.value.title),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.poll!.value.choices.length,
                  itemBuilder: (context, index) {
                    final choice = controller.poll!.value.choices[index];
                    final percentage =
                        choice.votes / controller.poll!.value.totalVotes;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          choice.title,
                          style: TextStyle(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyLarge!
                                .color,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          barRadius: const Radius.circular(8),
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          lineHeight: 20.0,
                          percent: percentage,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          progressColor: ((controller.poll!.value.status ==
                                          PollStatus.completed ||
                                      controller.poll!.value.status ==
                                          PollStatus.terminated) &&
                                  percentage > 0.5)
                              ? Colors.green
                              : Theme.of(context).colorScheme.background,
                          center: Text(
                              "${(percentage * 100).toStringAsFixed(2)} %"),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
                Visibility(
                  visible: controller.poll!.value.status == PollStatus.active,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        onPressed: () {
                          controller.endPoll("ARCHIVED");
                        },
                        child: Text(
                          "cancel".tr,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          controller.endPoll("TERMINATED");
                        },
                        child: const Text(
                          'End',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "No poll running",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 12),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Create one',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
      const SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget _shortcutButton(
    BuildContext context, String text, Function onTap, bool isOn) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isOn
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

void pickWinnerDialog(BuildContext context, TwitchPrediction prediction,
    Function endPrediction, TwitchTabViewController controller) {
  Get.defaultDialog(
    title: prediction.title,
    titleStyle: const TextStyle(color: Colors.white),
    backgroundColor: const Color(0xFF282828),
    buttonColor: const Color(0xFF9147ff),
    cancelTextColor: const Color(0xFF9147ff),
    confirmTextColor: Colors.white,
    textCancel: "Back",
    textConfirm: "Confirm",
    radius: 10,
    onCancel: () {
      controller.selectedOutcomeId.value = "-1";
    },
    onConfirm: () {
      endPrediction('RESOLVED', 'outcome_id');
      controller.selectedOutcomeId.value = "-1";
    },
    content: Obx(
      () => Column(
        children: List<Widget>.generate(
          prediction.outcomes.length,
          (int index) => ListTile(
            title: Text(prediction.outcomes[index].title),
            leading: Radio(
              value: prediction.outcomes[index].id,
              groupValue: controller.selectedOutcomeId.value,
              onChanged: (String? value) {
                controller.selectedOutcomeId.value = value!;
              },
              activeColor: Colors.green,
            ),
          ),
        ),
      ),
    ),
  );
}