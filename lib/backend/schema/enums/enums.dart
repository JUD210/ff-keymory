import 'package:collection/collection.dart';

enum Role {
  assistant,
  user,
  developer,
}

enum CharacterPersonality {
  Shy,
  Tough,
  Mild,
  Smart,
}

enum Days {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

enum SenderType {
  User,
  Character,
}

enum AICommentMethodology {
  informative,
  cheerful,
  kpt,
  swot,
}

enum DateCommand {
  increaseDay,
  decreaseDay,
  increaseMonth,
  decreaseMonth,
  gotoToday,
  getFirstDayOfMonth,
  getLastDayOfMonth,
  getStartOfDay,
  getLastTimeOfPrevDay,
  getFirstTimeOfNextDay,
}

enum CharacterTone {
  Informative,
  Cheerful,
  Comforting,
}

enum MBTIType {
  Unknown,
  ISTP,
  ISTJ,
  ISFP,
  ISFJ,
  INTP,
  INTJ,
  INFP,
  INFJ,
  ESTP,
  ESTJ,
  ESFP,
  ESFJ,
  ENTP,
  ENTJ,
  ENFP,
  ENFJ,
}

enum Gender {
  Male,
  Female,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (CharacterPersonality):
      return CharacterPersonality.values.deserialize(value) as T?;
    case (Days):
      return Days.values.deserialize(value) as T?;
    case (SenderType):
      return SenderType.values.deserialize(value) as T?;
    case (AICommentMethodology):
      return AICommentMethodology.values.deserialize(value) as T?;
    case (DateCommand):
      return DateCommand.values.deserialize(value) as T?;
    case (CharacterTone):
      return CharacterTone.values.deserialize(value) as T?;
    case (MBTIType):
      return MBTIType.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    default:
      return null;
  }
}
