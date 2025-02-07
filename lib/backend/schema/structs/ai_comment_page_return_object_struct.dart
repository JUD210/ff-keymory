// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiCommentPageReturnObjectStruct extends FFFirebaseStruct {
  AiCommentPageReturnObjectStruct({
    String? aiCommentContent,
    DocumentReference? aiCommentBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _aiCommentContent = aiCommentContent,
        _aiCommentBy = aiCommentBy,
        super(firestoreUtilData);

  // "aiCommentContent" field.
  String? _aiCommentContent;
  String get aiCommentContent => _aiCommentContent ?? '';
  set aiCommentContent(String? val) => _aiCommentContent = val;

  bool hasAiCommentContent() => _aiCommentContent != null;

  // "aiCommentBy" field.
  DocumentReference? _aiCommentBy;
  DocumentReference? get aiCommentBy => _aiCommentBy;
  set aiCommentBy(DocumentReference? val) => _aiCommentBy = val;

  bool hasAiCommentBy() => _aiCommentBy != null;

  static AiCommentPageReturnObjectStruct fromMap(Map<String, dynamic> data) =>
      AiCommentPageReturnObjectStruct(
        aiCommentContent: data['aiCommentContent'] as String?,
        aiCommentBy: data['aiCommentBy'] as DocumentReference?,
      );

  static AiCommentPageReturnObjectStruct? maybeFromMap(dynamic data) => data
          is Map
      ? AiCommentPageReturnObjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'aiCommentContent': _aiCommentContent,
        'aiCommentBy': _aiCommentBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aiCommentContent': serializeParam(
          _aiCommentContent,
          ParamType.String,
        ),
        'aiCommentBy': serializeParam(
          _aiCommentBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AiCommentPageReturnObjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AiCommentPageReturnObjectStruct(
        aiCommentContent: deserializeParam(
          data['aiCommentContent'],
          ParamType.String,
          false,
        ),
        aiCommentBy: deserializeParam(
          data['aiCommentBy'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['characters'],
        ),
      );

  @override
  String toString() => 'AiCommentPageReturnObjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AiCommentPageReturnObjectStruct &&
        aiCommentContent == other.aiCommentContent &&
        aiCommentBy == other.aiCommentBy;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([aiCommentContent, aiCommentBy]);
}

AiCommentPageReturnObjectStruct createAiCommentPageReturnObjectStruct({
  String? aiCommentContent,
  DocumentReference? aiCommentBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AiCommentPageReturnObjectStruct(
      aiCommentContent: aiCommentContent,
      aiCommentBy: aiCommentBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AiCommentPageReturnObjectStruct? updateAiCommentPageReturnObjectStruct(
  AiCommentPageReturnObjectStruct? aiCommentPageReturnObject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aiCommentPageReturnObject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAiCommentPageReturnObjectStructData(
  Map<String, dynamic> firestoreData,
  AiCommentPageReturnObjectStruct? aiCommentPageReturnObject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aiCommentPageReturnObject == null) {
    return;
  }
  if (aiCommentPageReturnObject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      aiCommentPageReturnObject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aiCommentPageReturnObjectData =
      getAiCommentPageReturnObjectFirestoreData(
          aiCommentPageReturnObject, forFieldValue);
  final nestedData =
      aiCommentPageReturnObjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      aiCommentPageReturnObject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAiCommentPageReturnObjectFirestoreData(
  AiCommentPageReturnObjectStruct? aiCommentPageReturnObject, [
  bool forFieldValue = false,
]) {
  if (aiCommentPageReturnObject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aiCommentPageReturnObject.toMap());

  // Add any Firestore field values
  aiCommentPageReturnObject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAiCommentPageReturnObjectListFirestoreData(
  List<AiCommentPageReturnObjectStruct>? aiCommentPageReturnObjects,
) =>
    aiCommentPageReturnObjects
        ?.map((e) => getAiCommentPageReturnObjectFirestoreData(e, true))
        .toList() ??
    [];
