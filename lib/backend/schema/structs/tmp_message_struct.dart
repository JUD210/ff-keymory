// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TmpMessageStruct extends FFFirebaseStruct {
  TmpMessageStruct({
    String? id,
    String? role,
    List<String>? messages,
    DateTime? createdAt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _role = role,
        _messages = messages,
        _createdAt = createdAt,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "messages" field.
  List<String>? _messages;
  List<String> get messages => _messages ?? const [];
  set messages(List<String>? val) => _messages = val;

  void updateMessages(Function(List<String>) updateFn) {
    updateFn(_messages ??= []);
  }

  bool hasMessages() => _messages != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  static TmpMessageStruct fromMap(Map<String, dynamic> data) =>
      TmpMessageStruct(
        id: data['id'] as String?,
        role: data['role'] as String?,
        messages: getDataList(data['messages']),
        createdAt: data['created_at'] as DateTime?,
      );

  static TmpMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? TmpMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'role': _role,
        'messages': _messages,
        'created_at': _createdAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'messages': serializeParam(
          _messages,
          ParamType.String,
          isList: true,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TmpMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      TmpMessageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        messages: deserializeParam<String>(
          data['messages'],
          ParamType.String,
          true,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TmpMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TmpMessageStruct &&
        id == other.id &&
        role == other.role &&
        listEquality.equals(messages, other.messages) &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, role, messages, createdAt]);
}

TmpMessageStruct createTmpMessageStruct({
  String? id,
  String? role,
  DateTime? createdAt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TmpMessageStruct(
      id: id,
      role: role,
      createdAt: createdAt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TmpMessageStruct? updateTmpMessageStruct(
  TmpMessageStruct? tmpMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tmpMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTmpMessageStructData(
  Map<String, dynamic> firestoreData,
  TmpMessageStruct? tmpMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tmpMessage == null) {
    return;
  }
  if (tmpMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tmpMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tmpMessageData = getTmpMessageFirestoreData(tmpMessage, forFieldValue);
  final nestedData = tmpMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tmpMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTmpMessageFirestoreData(
  TmpMessageStruct? tmpMessage, [
  bool forFieldValue = false,
]) {
  if (tmpMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tmpMessage.toMap());

  // Add any Firestore field values
  tmpMessage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTmpMessageListFirestoreData(
  List<TmpMessageStruct>? tmpMessages,
) =>
    tmpMessages?.map((e) => getTmpMessageFirestoreData(e, true)).toList() ?? [];
