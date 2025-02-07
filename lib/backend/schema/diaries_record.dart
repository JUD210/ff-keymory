import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiariesRecord extends FirestoreRecord {
  DiariesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  bool hasIsPublic() => _isPublic != null;

  // "tmp_ai_comment" field.
  String? _tmpAiComment;
  String get tmpAiComment => _tmpAiComment ?? '';
  bool hasTmpAiComment() => _tmpAiComment != null;

  // "mood_score_by_user" field.
  int? _moodScoreByUser;
  int get moodScoreByUser => _moodScoreByUser ?? 0;
  bool hasMoodScoreByUser() => _moodScoreByUser != null;

  // "mood_keywords" field.
  List<String>? _moodKeywords;
  List<String> get moodKeywords => _moodKeywords ?? const [];
  bool hasMoodKeywords() => _moodKeywords != null;

  // "mood_keywords_description" field.
  String? _moodKeywordsDescription;
  String get moodKeywordsDescription => _moodKeywordsDescription ?? '';
  bool hasMoodKeywordsDescription() => _moodKeywordsDescription != null;

  // "ai_comment_by" field.
  DocumentReference? _aiCommentBy;
  DocumentReference? get aiCommentBy => _aiCommentBy;
  bool hasAiCommentBy() => _aiCommentBy != null;

  // "diary_content_summarized" field.
  String? _diaryContentSummarized;
  String get diaryContentSummarized => _diaryContentSummarized ?? '';
  bool hasDiaryContentSummarized() => _diaryContentSummarized != null;

  // "linked_chats" field.
  List<DocumentReference>? _linkedChats;
  List<DocumentReference> get linkedChats => _linkedChats ?? const [];
  bool hasLinkedChats() => _linkedChats != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _content = snapshotData['content'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isPublic = snapshotData['is_public'] as bool?;
    _tmpAiComment = snapshotData['tmp_ai_comment'] as String?;
    _moodScoreByUser = castToType<int>(snapshotData['mood_score_by_user']);
    _moodKeywords = getDataList(snapshotData['mood_keywords']);
    _moodKeywordsDescription =
        snapshotData['mood_keywords_description'] as String?;
    _aiCommentBy = snapshotData['ai_comment_by'] as DocumentReference?;
    _diaryContentSummarized =
        snapshotData['diary_content_summarized'] as String?;
    _linkedChats = getDataList(snapshotData['linked_chats']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('diaries');

  static Stream<DiariesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiariesRecord.fromSnapshot(s));

  static Future<DiariesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiariesRecord.fromSnapshot(s));

  static DiariesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiariesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiariesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiariesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiariesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiariesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiariesRecordData({
  DocumentReference? user,
  String? title,
  String? content,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isPublic,
  String? tmpAiComment,
  int? moodScoreByUser,
  String? moodKeywordsDescription,
  DocumentReference? aiCommentBy,
  String? diaryContentSummarized,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'title': title,
      'content': content,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_public': isPublic,
      'tmp_ai_comment': tmpAiComment,
      'mood_score_by_user': moodScoreByUser,
      'mood_keywords_description': moodKeywordsDescription,
      'ai_comment_by': aiCommentBy,
      'diary_content_summarized': diaryContentSummarized,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiariesRecordDocumentEquality implements Equality<DiariesRecord> {
  const DiariesRecordDocumentEquality();

  @override
  bool equals(DiariesRecord? e1, DiariesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.user == e2?.user &&
        e1?.title == e2?.title &&
        e1?.content == e2?.content &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isPublic == e2?.isPublic &&
        e1?.tmpAiComment == e2?.tmpAiComment &&
        e1?.moodScoreByUser == e2?.moodScoreByUser &&
        listEquality.equals(e1?.moodKeywords, e2?.moodKeywords) &&
        e1?.moodKeywordsDescription == e2?.moodKeywordsDescription &&
        e1?.aiCommentBy == e2?.aiCommentBy &&
        e1?.diaryContentSummarized == e2?.diaryContentSummarized &&
        listEquality.equals(e1?.linkedChats, e2?.linkedChats);
  }

  @override
  int hash(DiariesRecord? e) => const ListEquality().hash([
        e?.user,
        e?.title,
        e?.content,
        e?.createdTime,
        e?.modifiedTime,
        e?.isPublic,
        e?.tmpAiComment,
        e?.moodScoreByUser,
        e?.moodKeywords,
        e?.moodKeywordsDescription,
        e?.aiCommentBy,
        e?.diaryContentSummarized,
        e?.linkedChats
      ]);

  @override
  bool isValidKey(Object? o) => o is DiariesRecord;
}
