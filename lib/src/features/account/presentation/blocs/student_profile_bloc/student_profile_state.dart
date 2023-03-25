part of 'student_profile_bloc.dart';

abstract class StudentProfileState {
  const StudentProfileState();
}

class StudentProfileInitState extends StudentProfileState {
  const StudentProfileInitState();
}

class StudentProfileLoadingState extends StudentProfileState {
  const StudentProfileLoadingState();
}

class StudentProfileLoadDoneState extends StudentProfileState {
  const StudentProfileLoadDoneState(
    this.avatarUrl,
    this.fullName,
    this.englishName,
    this.bio,
    this.selectedInterestedTopicIds,
    this.topics,
  );

  final String avatarUrl;
  final String fullName;
  final String englishName;
  final String bio;
  final List<String> selectedInterestedTopicIds;
  final List<TopicItemEntity> topics;
}

class StudentProfileLoadFailedState extends StudentProfileState {
  const StudentProfileLoadFailedState(this.message);

  final String message;
}

class StudentProfileSavingState extends StudentProfileState {
  const StudentProfileSavingState();
}

class StudentProfileSaveDoneState extends StudentProfileState {
  const StudentProfileSaveDoneState();
}

class StudentProfileSaveFailureState extends StudentProfileState {
  const StudentProfileSaveFailureState(this.message);

  final String message;
}

class StudentProfileChangedState extends StudentProfileState {
  const StudentProfileChangedState({
    this.avatarUrl,
    required this.avatarException,
    required this.fullNameError,
    required this.englishNameError,
    required this.bioError,
    required this.forceDisabled,
  });

  final String? avatarUrl;
  final String avatarException;
  final String fullNameError;
  final String englishNameError;
  final String bioError;
  final bool forceDisabled;
}
