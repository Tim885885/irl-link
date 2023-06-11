import 'package:irllink/src/data/entities/settings/chat_events_settings_dto.dart';
import 'package:irllink/src/data/entities/settings/chat_settings_dto.dart';
import 'package:irllink/src/data/entities/settings/floating_dashboard_settings_dto.dart';
import 'package:irllink/src/data/entities/settings/stream_elements_settings_dto.dart';
import 'package:irllink/src/domain/entities/settings.dart';
import 'package:irllink/src/domain/entities/settings/chat_settings.dart';

import '../../domain/entities/settings/chat_events_settings.dart';
import '../../domain/entities/settings/floating_dashboard_settings.dart';
import '../../domain/entities/settings/stream_elements_settings.dart';

class SettingsDTO extends Settings {
  const SettingsDTO({
    //CHAT SETTINGS
    required bool isEmotes,
    required double textSize,
    required double emotesSize,
    required bool displayTimestamp,
    required List hiddenUsersIds,
    required ChatEventsSettings chatEventsSettings,
    required ChatSettings chatSettings,
    //GENERAL SETTINGS
    required bool isDarkMode,
    required bool keepSpeakerOn,
    required bool displayViewerCount,
    required Map appLanguage,
    required FloatingDashboardSettings floatingDashboardSettings,
    //CONNECTIONS SETTINGS
    required bool isObsConnected,
    required String obsWebsocketUrl,
    required String obsWebsocketPassword,
    required String streamElementsAccessToken,
    required List browserTabs,
    required List obsConnectionsHistory,
    required StreamElementsSettings streamElementsSettings,
    //TTS SETTINGS
    required bool ttsEnabled,
    required String language,
    required List prefixsToIgnore,
    required List prefixsToUseTtsOnly,
    required double volume,
    required double pitch,
    required double rate,
    required Map<String, String> voice,
    required List ttsUsersToIgnore,
    required bool ttsMuteViewerName,
  }) : super(
          //CHAT SETTINGS
          isEmotes: isEmotes,
          textSize: textSize,
          emotesSize: emotesSize,
          displayTimestamp: displayTimestamp,
          hiddenUsersIds: hiddenUsersIds,
          chatEventsSettings: chatEventsSettings,
          chatSettings: chatSettings,
          //GENERAL SETTINGS
          isDarkMode: isDarkMode,
          keepSpeakerOn: keepSpeakerOn,
          displayViewerCount: displayViewerCount,
          appLanguage: appLanguage,
          floatingDashboardSettings: floatingDashboardSettings,
          //CONNECTIONS SETTINGS
          obsWebsocketUrl: obsWebsocketUrl,
          obsWebsocketPassword: obsWebsocketPassword,
          isObsConnected: isObsConnected,
          streamElementsAccessToken: streamElementsAccessToken,
          browserTabs: browserTabs,
          obsConnectionsHistory: obsConnectionsHistory,
          streamElementsSettings: streamElementsSettings,
          //TTS SETTINGS
          ttsEnabled: ttsEnabled,
          language: language,
          prefixsToIgnore: prefixsToIgnore,
          prefixsToUseTtsOnly: prefixsToUseTtsOnly,
          volume: volume,
          pitch: pitch,
          rate: rate,
          voice: voice,
          ttsUsersToIgnore: ttsUsersToIgnore,
          ttsMuteViewerName: ttsMuteViewerName,
        );

  @override
  Map toJson() => {
        //CHAT
        'isEmotes': isEmotes,
        'textSize': textSize,
        'emotesSize': emotesSize,
        'displayTimestamp': displayTimestamp,
        'hiddenUsersIds': hiddenUsersIds,
        'chatEventsSettings': chatEventsSettings?.toJson(),
        'chatSettings': chatSettings?.toJson(),
        //GENERAL
        'isDarkMode': isDarkMode,
        'keepSpeakerOn': keepSpeakerOn,
        'displayViewerCount': displayViewerCount,
        'appLanguage': appLanguage,
        'floatingDashboardSettings': floatingDashboardSettings?.toJson(),
        //CONNECTIONS
        'isObsConnected': isObsConnected,
        'obsWebsocketUrl': obsWebsocketUrl,
        'obsWebsocketPassword': obsWebsocketPassword,
        'streamElementsAccessToken': streamElementsAccessToken,
        'browserTabs': browserTabs,
        'obsConnectionsHistory': obsConnectionsHistory,
        'streamElementsSettings': streamElementsSettings?.toJson(),
        //TTS
        'ttsEnabled': ttsEnabled,
        'language': language,
        'prefixsToIgnore': prefixsToIgnore,
        'prefixsToUseTtsOnly': prefixsToUseTtsOnly,
        'volume': volume,
        'pitch': pitch,
        'rate': rate,
        'voice': voice,
        'ttsUsersToIgnore': ttsUsersToIgnore,
        'ttsMuteViewerName': ttsMuteViewerName,
      };

  factory SettingsDTO.fromJson(Map<String, dynamic> map) {
    return SettingsDTO(
      //CHAT SETTINGS
      isEmotes: map['isEmotes'] != null
          ? map['isEmotes'] as bool
          : const Settings.defaultSettings().isEmotes!,
      textSize: map['textSize'] != null
          ? map['textSize'] as double
          : const Settings.defaultSettings().textSize!,
      emotesSize: map['emotesSize'] != null
          ? map['emotesSize'] as double
          : const Settings.defaultSettings().emotesSize!,
      displayTimestamp: map['displayTimestamp'] != null
          ? map['displayTimestamp'] as bool
          : const Settings.defaultSettings().displayTimestamp!,
      hiddenUsersIds: map['hiddenUsersIds'] != null
          ? map['hiddenUsersIds'] as List
          : const Settings.defaultSettings().hiddenUsersIds!,
      chatEventsSettings: map['chatEventsSettings'] != null
          ? ChatEventsSettingsDTO.fromJson(map['chatEventsSettings'])
          : const Settings.defaultSettings().chatEventsSettings!,
      chatSettings: map['chatSettings'] != null
          ? ChatSettingsDTO.fromJson(map['chatSettings'])
          : const Settings.defaultSettings().chatSettings!,
      //GENERAL SETTINGS
      isDarkMode: map['isDarkMode'] != null
          ? map['isDarkMode'] as bool
          : const Settings.defaultSettings().isDarkMode!,
      keepSpeakerOn: map['keepSpeakerOn'] != null
          ? map['keepSpeakerOn'] as bool
          : const Settings.defaultSettings().keepSpeakerOn!,
      displayViewerCount: map['displayViewerCount'] != null
          ? map['displayViewerCount'] as bool
          : const Settings.defaultSettings().displayViewerCount!,
      appLanguage: map['appLanguage'] != null
          ? map['appLanguage'] as Map
          : const Settings.defaultSettings().appLanguage!,
      floatingDashboardSettings: map['floatingDashboardSettings'] != null
          ? FloatingDashboardSettingsDTO.fromJson(
              map['floatingDashboardSettings'])
          : const Settings.defaultSettings().floatingDashboardSettings!,
      //CONNECTIONS SETTINGS
      isObsConnected: map['isObsConnected'] != null
          ? map['isObsConnected'] as bool
          : const Settings.defaultSettings().isObsConnected!,
      obsWebsocketUrl: map['obsWebsocketUrl'] != null
          ? map['obsWebsocketUrl'] as String
          : const Settings.defaultSettings().obsWebsocketUrl!,
      obsWebsocketPassword: map['obsWebsocketPassword'] != null
          ? map['obsWebsocketPassword'] as String
          : const Settings.defaultSettings().obsWebsocketPassword!,
      streamElementsAccessToken: map['streamElementsAccessToken'] != null
          ? map['streamElementsAccessToken'] as String
          : const Settings.defaultSettings().streamElementsAccessToken!,
      browserTabs: map['browserTabs'] != null
          ? map['browserTabs'] as List
          : const Settings.defaultSettings().browserTabs!,
      obsConnectionsHistory: map['obsConnectionsHistory'] != null
          ? map['obsConnectionsHistory'] as List
          : const Settings.defaultSettings().obsConnectionsHistory!,
      streamElementsSettings: map['streamElementsSettings'] != null
          ? StreamElementsSettingsDTO.fromJson(map['streamElementsSettings'])
          : const Settings.defaultSettings().streamElementsSettings!,
      //TTS SETTINGS
      ttsEnabled: map['ttsEnabled'] != null
          ? map['ttsEnabled'] as bool
          : const Settings.defaultSettings().ttsEnabled!,
      language: map['language'] != null
          ? map['language'] as String
          : const Settings.defaultSettings().language!,
      prefixsToIgnore: map['prefixsToIgnore'] != null
          ? map['prefixsToIgnore'] as List
          : const Settings.defaultSettings().prefixsToIgnore!,
      prefixsToUseTtsOnly: map['prefixsToUseTtsOnly'] != null
          ? map['prefixsToUseTtsOnly'] as List
          : const Settings.defaultSettings().prefixsToUseTtsOnly!,
      volume: map['volume'] != null
          ? map['volume'] as double
          : const Settings.defaultSettings().volume!,
      pitch: map['pitch'] != null
          ? map['pitch'] as double
          : const Settings.defaultSettings().pitch!,
      rate: map['rate'] != null
          ? map['rate'] as double
          : const Settings.defaultSettings().rate!,
      voice: map['voice'] != null
          ? {"name": map["voice"]["name"], "locale": map["voice"]["locale"]}
          : const Settings.defaultSettings().voice!,
      ttsUsersToIgnore: map['ttsUsersToIgnore'] != null
          ? map['ttsUsersToIgnore'] as List
          : const Settings.defaultSettings().ttsUsersToIgnore!,
      ttsMuteViewerName: map['ttsMuteViewerName'] != null
          ? map['ttsMuteViewerName'] as bool
          : const Settings.defaultSettings().ttsMuteViewerName!,
    );
  }
}
