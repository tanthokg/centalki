part of 'meeting_bloc.dart';

abstract class MeetingState {
  const MeetingState();
}

class MeetingInitState extends MeetingState {
  const MeetingInitState();
}

class MeetingEndState extends MeetingState {
  const MeetingEndState(this.teacherId, this.sessionId);

  final String? teacherId;
  final String sessionId;
}
