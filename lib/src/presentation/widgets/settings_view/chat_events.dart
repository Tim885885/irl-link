import 'package:flutter/material.dart';
import 'package:irllink/src/presentation/controllers/settings_view_controller.dart';
import 'package:get/get.dart';
import 'package:irllink/src/presentation/widgets/chat_message/event_container.dart';
import 'package:twitch_chat/twitch_chat.dart';

class ChatEvents extends StatelessWidget {
  final SettingsViewController controller;

  const ChatEvents({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            onPressed: () => Get.back(),
          ),
          actions: const [],
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(
            "Chat events",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
            color: Theme.of(context).colorScheme.background,
            child: Column(
              children: [
                Column(
                  children: [
                    EventContainer(
                      message: ChatMessage.randomGeneration(
                        HighlightType.firstTimeChatter,
                        "Hey guys, I'm new here!",
                        "Lezd",
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "First time chatter",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.firstsMessages,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                firstsMessages: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: Subscription.randomGeneration(),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subscriptions",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.subscriptions,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                subscriptions: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: BitDonation.randomGeneration(),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bits donations",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.bitsDonations,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                bitsDonations: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: Announcement.randomGeneration(),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Announcements",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.announcements,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                announcements: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: IncomingRaid.randomGeneration(),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Incoming raids",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.incomingRaids,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                incomingRaids: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: RewardRedemption.randomGeneration(),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Channelpoint redemptions",
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.redemptions,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                redemptions: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                          inactiveTrackColor:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          activeTrackColor:
                              Theme.of(context).colorScheme.tertiary,
                          activeColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
