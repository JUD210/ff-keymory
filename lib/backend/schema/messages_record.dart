import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "role" field.
  Role? _role;
  Role? get role => _role;
  bool hasRole() => _role != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _role = snapshotData['role'] is Role
        ? snapshotData['role']
        : deserializeEnum<Role>(snapshotData['role']);
    _created = snapshotData['created'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _content = snapshotData['content'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('messages')
          : FirebaseFirestore.instance.collectionGroup('messages');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('messages').doc(id);

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  Role? role,
  DateTime? created,
  String? id,
  String? content,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'created': created,
      'id': id,
      'content': content,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.created == e2?.created &&
        e1?.id == e2?.id &&
        e1?.content == e2?.content;
  }

  @override
  int hash(MessagesRecord? e) =>
      const ListEquality().hash([e?.role, e?.created, e?.id, e?.content]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
