import 'package:equatable/equatable.dart';

class TwitchHypeTrain extends Equatable {
  final String id;
  final int total;
  final int progress;
  final int goal;
  final int level;
  final List<Contribution> topContributions;
  final Contribution lastContribution;

  const TwitchHypeTrain({
    required this.id,
    required this.total,
    required this.progress,
    required this.goal,
    required this.level,
    required this.topContributions,
    required this.lastContribution,
  });

  Map toJson() => {
    'id': id,
    'total': total,
    'progress': progress,
    'goal': goal,
    'level': level,
    'topContributions': topContributions,
    'lastContribution': lastContribution,
  };

  @override
  List<Object?> get props {
    return [
      id,
      total,
      progress,
      goal,
      level,
      topContributions,
      lastContribution,
    ];
  }

  @override
  bool get stringify => true;
}

class Contribution extends Equatable {
  final String userId;
  final String userLogin;
  final String userName;
  final String type;
  final int total;

  const Contribution({
    required this.userId,
    required this.userLogin,
    required this.userName,
    required this.type,
    required this.total,
  });

  Map toJson() => {
    'userId': userId,
    'userLogin': userLogin,
    'userName': userName,
    'type': type,
    'total': total,
  };

  @override
  List<Object?> get props {
    return [
      userId,
      userLogin,
      userName,
      type,
      total,
    ];
  }

  @override
  bool get stringify => true;
}
