import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CharactersRecord extends FirestoreRecord {
  CharactersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "updated_time" field.
  DateTime? _updatedTime;
  DateTime? get updatedTime => _updatedTime;
  bool hasUpdatedTime() => _updatedTime != null;

  // "official_name" field.
  String? _officialName;
  String get officialName => _officialName ?? '';
  bool hasOfficialName() => _officialName != null;

  // "personality" field.
  CharacterPersonality? _personality;
  CharacterPersonality? get personality => _personality;
  bool hasPersonality() => _personality != null;

  // "tone" field.
  CharacterTone? _tone;
  CharacterTone? get tone => _tone;
  bool hasTone() => _tone != null;

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "mbti" field.
  String? _mbti;
  String get mbti => _mbti ?? '';
  bool hasMbti() => _mbti != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _updatedTime = snapshotData['updated_time'] as DateTime?;
    _officialName = snapshotData['official_name'] as String?;
    _personality = snapshotData['personality'] is CharacterPersonality
        ? snapshotData['personality']
        : deserializeEnum<CharacterPersonality>(snapshotData['personality']);
    _tone = snapshotData['tone'] is CharacterTone
        ? snapshotData['tone']
        : deserializeEnum<CharacterTone>(snapshotData['tone']);
    _profileImage = snapshotData['profile_image'] as String?;
    _mbti = snapshotData['mbti'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('characters');

  static Stream<CharactersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CharactersRecord.fromSnapshot(s));

  static Future<CharactersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CharactersRecord.fromSnapshot(s));

  static CharactersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CharactersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CharactersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CharactersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CharactersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CharactersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCharactersRecordData({
  DateTime? createdTime,
  DateTime? updatedTime,
  String? officialName,
  CharacterPersonality? personality,
  CharacterTone? tone,
  String? profileImage,
  String? mbti,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'updated_time': updatedTime,
      'official_name': officialName,
      'personality': personality,
      'tone': tone,
      'profile_image': profileImage,
      'mbti': mbti,
    }.withoutNulls,
  );

  return firestoreData;
}

class CharactersRecordDocumentEquality implements Equality<CharactersRecord> {
  const CharactersRecordDocumentEquality();

  @override
  bool equals(CharactersRecord? e1, CharactersRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.updatedTime == e2?.updatedTime &&
        e1?.officialName == e2?.officialName &&
        e1?.personality == e2?.personality &&
        e1?.tone == e2?.tone &&
        e1?.profileImage == e2?.profileImage &&
        e1?.mbti == e2?.mbti;
  }

  @override
  int hash(CharactersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.updatedTime,
        e?.officialName,
        e?.personality,
        e?.tone,
        e?.profileImage,
        e?.mbti
      ]);

  @override
  bool isValidKey(Object? o) => o is CharactersRecord;
}
