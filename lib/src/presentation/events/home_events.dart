import 'package:dio/dio.dart';
import 'package:irllink/src/core/params/twitch_auth_params.dart';
import 'package:irllink/src/core/resources/data_state.dart';
import 'package:irllink/src/domain/entities/settings.dart';
import 'package:irllink/src/domain/entities/twitch_credentials.dart';
import 'package:irllink/src/domain/entities/twitch_poll.dart';
import 'package:irllink/src/domain/entities/twitch_prediction.dart';
import 'package:irllink/src/domain/entities/twitch_stream_infos.dart';
import 'package:irllink/src/domain/entities/twitch_user.dart';
import 'package:irllink/src/domain/usecases/settings_usecase.dart';
import 'package:irllink/src/domain/usecases/twitch_usecase.dart';
import 'package:twitch_chat/twitch_chat.dart';

class HomeEvents {
  final TwitchUseCase twitchUseCase;
  final SettingsUseCase settingsUseCase;

  HomeEvents({required this.twitchUseCase, required this.settingsUseCase});

  Future<DataState<TwitchCredentials>> getTwitchFromLocal() {
    return twitchUseCase.getTwitchFromLocal();
  }

  Future<DataState<TwitchCredentials>> getTwitchOauth(
      {TwitchAuthParams? params}) {
    return twitchUseCase.getTwitchOauth(params: params!);
  }

  Future<DataState<TwitchUser>> getTwitchUser({
    String? username,
    required String accessToken,
  }) {
    return twitchUseCase.getTwitchUser(
      username: username,
      accessToken: accessToken,
    );
  }

  Future<DataState<TwitchCredentials>> refreshAccessToken({
    required TwitchCredentials twitchData,
  }) {
    return twitchUseCase.refreshAccessToken(twitchData: twitchData);
  }

  Future<DataState<TwitchStreamInfos>> getStreamInfo(
      String accessToken, String broadcasterId) {
    return twitchUseCase.getStreamInfo(accessToken, broadcasterId);
  }

  Future<DataState<Response<dynamic>>> setChatSettings(String accessToken,
      String broadcasterId, TwitchStreamInfos? twitchStreamInfos) {
    return twitchUseCase.setChatSettings(
        accessToken, broadcasterId, twitchStreamInfos);
  }

  Future<DataState<void>> setStreamTitle(
      String accessToken, String broadcasterId, String title) {
    return twitchUseCase.setStreamTitle(accessToken, broadcasterId, title);
  }

  Future<DataState<Settings>> getSettings() {
    return settingsUseCase.getSettings();
  }

  Future<void> setSettings({required Settings settings}) {
    return settingsUseCase.setSettings(settings: settings);
  }

  Future<DataState<TwitchPoll>> getPoll(
      String accessToken, String broadcasterId) {
    return twitchUseCase.getPoll(accessToken, broadcasterId);
  }

  Future<void>? createPoll(
      String accessToken, String broadcasterId, TwitchPoll newPoll) {
    return twitchUseCase.createPoll(accessToken, broadcasterId, newPoll);
  }

  Future<DataState<TwitchPoll>> endPoll(
      String accessToken, String broadcasterId, String pollId, String status) {
    return twitchUseCase.endPoll(accessToken, broadcasterId, pollId, status);
  }

  Future<DataState<TwitchPrediction>> getPrediction(
      String accessToken, String broadcasterId) {
    return twitchUseCase.getPrediction(accessToken, broadcasterId);
  }

  Future<void> banUser(
    String accessToken,
    String broadcasterId,
    ChatMessage message,
    int? duration,
  ) {
    return twitchUseCase.banUser(accessToken, broadcasterId, message, duration);
  }

  Future<void> deleteMessage(
    String accessToken,
    String broadcasterId,
    ChatMessage message,
  ) {
    return twitchUseCase.deleteMessage(accessToken, broadcasterId, message);
  }
}
