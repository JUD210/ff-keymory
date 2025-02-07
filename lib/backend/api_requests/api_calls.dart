import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffOpenAIAPI';

/// Start OpenAI API Group Code

class OpenAIAPIGroup {
  static ListAssistantsCall listAssistantsCall = ListAssistantsCall();
  static CreateAssistantCall createAssistantCall = CreateAssistantCall();
  static GetAssistantCall getAssistantCall = GetAssistantCall();
  static ModifyAssistantCall modifyAssistantCall = ModifyAssistantCall();
  static DeleteAssistantCall deleteAssistantCall = DeleteAssistantCall();
  static CreateSpeechCall createSpeechCall = CreateSpeechCall();
  static CreateTranscriptionCall createTranscriptionCall =
      CreateTranscriptionCall();
  static CreateTranslationCall createTranslationCall = CreateTranslationCall();
  static CreateBatchCall createBatchCall = CreateBatchCall();
  static ListBatchesCall listBatchesCall = ListBatchesCall();
  static RetrieveBatchCall retrieveBatchCall = RetrieveBatchCall();
  static CancelBatchCall cancelBatchCall = CancelBatchCall();
  static CreateChatCompletionCall createChatCompletionCall =
      CreateChatCompletionCall();
  static CreateCompletionCall createCompletionCall = CreateCompletionCall();
  static CreateEmbeddingCall createEmbeddingCall = CreateEmbeddingCall();
  static ListFilesCall listFilesCall = ListFilesCall();
  static CreateFileCall createFileCall = CreateFileCall();
  static DeleteFileCall deleteFileCall = DeleteFileCall();
  static RetrieveFileCall retrieveFileCall = RetrieveFileCall();
  static DownloadFileCall downloadFileCall = DownloadFileCall();
  static CreateFineTuningJobCall createFineTuningJobCall =
      CreateFineTuningJobCall();
  static ListPaginatedFineTuningJobsCall listPaginatedFineTuningJobsCall =
      ListPaginatedFineTuningJobsCall();
  static RetrieveFineTuningJobCall retrieveFineTuningJobCall =
      RetrieveFineTuningJobCall();
  static CancelFineTuningJobCall cancelFineTuningJobCall =
      CancelFineTuningJobCall();
  static ListFineTuningJobCheckpointsCall listFineTuningJobCheckpointsCall =
      ListFineTuningJobCheckpointsCall();
  static ListFineTuningEventsCall listFineTuningEventsCall =
      ListFineTuningEventsCall();
  static CreateImageEditCall createImageEditCall = CreateImageEditCall();
  static CreateImageCall createImageCall = CreateImageCall();
  static CreateImageVariationCall createImageVariationCall =
      CreateImageVariationCall();
  static ListModelsCall listModelsCall = ListModelsCall();
  static RetrieveModelCall retrieveModelCall = RetrieveModelCall();
  static DeleteModelCall deleteModelCall = DeleteModelCall();
  static CreateModerationCall createModerationCall = CreateModerationCall();
  static AdminApiKeysListCall adminApiKeysListCall = AdminApiKeysListCall();
  static AdminApiKeysCreateCall adminApiKeysCreateCall =
      AdminApiKeysCreateCall();
  static AdminApiKeysGetCall adminApiKeysGetCall = AdminApiKeysGetCall();
  static AdminApiKeysDeleteCall adminApiKeysDeleteCall =
      AdminApiKeysDeleteCall();
  static ListAuditLogsCall listAuditLogsCall = ListAuditLogsCall();
  static UsageCostsCall usageCostsCall = UsageCostsCall();
  static ListInvitesCall listInvitesCall = ListInvitesCall();
  static InviteUserCall inviteUserCall = InviteUserCall();
  static RetrieveInviteCall retrieveInviteCall = RetrieveInviteCall();
  static DeleteInviteCall deleteInviteCall = DeleteInviteCall();
  static ListProjectsCall listProjectsCall = ListProjectsCall();
  static CreateProjectCall createProjectCall = CreateProjectCall();
  static RetrieveProjectCall retrieveProjectCall = RetrieveProjectCall();
  static ModifyProjectCall modifyProjectCall = ModifyProjectCall();
  static ListProjectApiKeysCall listProjectApiKeysCall =
      ListProjectApiKeysCall();
  static RetrieveProjectApiKeyCall retrieveProjectApiKeyCall =
      RetrieveProjectApiKeyCall();
  static DeleteProjectApiKeyCall deleteProjectApiKeyCall =
      DeleteProjectApiKeyCall();
  static ArchiveProjectCall archiveProjectCall = ArchiveProjectCall();
  static ListProjectRateLimitsCall listProjectRateLimitsCall =
      ListProjectRateLimitsCall();
  static UpdateProjectRateLimitsCall updateProjectRateLimitsCall =
      UpdateProjectRateLimitsCall();
  static ListProjectServiceAccountsCall listProjectServiceAccountsCall =
      ListProjectServiceAccountsCall();
  static CreateProjectServiceAccountCall createProjectServiceAccountCall =
      CreateProjectServiceAccountCall();
  static RetrieveProjectServiceAccountCall retrieveProjectServiceAccountCall =
      RetrieveProjectServiceAccountCall();
  static DeleteProjectServiceAccountCall deleteProjectServiceAccountCall =
      DeleteProjectServiceAccountCall();
  static ListProjectUsersCall listProjectUsersCall = ListProjectUsersCall();
  static CreateProjectUserCall createProjectUserCall = CreateProjectUserCall();
  static RetrieveProjectUserCall retrieveProjectUserCall =
      RetrieveProjectUserCall();
  static ModifyProjectUserCall modifyProjectUserCall = ModifyProjectUserCall();
  static DeleteProjectUserCall deleteProjectUserCall = DeleteProjectUserCall();
  static UsageAudioSpeechesCall usageAudioSpeechesCall =
      UsageAudioSpeechesCall();
  static UsageAudioTranscriptionsCall usageAudioTranscriptionsCall =
      UsageAudioTranscriptionsCall();
  static UsageCodeInterpreterSessionsCall usageCodeInterpreterSessionsCall =
      UsageCodeInterpreterSessionsCall();
  static UsageCompletionsCall usageCompletionsCall = UsageCompletionsCall();
  static UsageEmbeddingsCall usageEmbeddingsCall = UsageEmbeddingsCall();
  static UsageImagesCall usageImagesCall = UsageImagesCall();
  static UsageModerationsCall usageModerationsCall = UsageModerationsCall();
  static UsageVectorStoresCall usageVectorStoresCall = UsageVectorStoresCall();
  static ListUsersCall listUsersCall = ListUsersCall();
  static RetrieveUserCall retrieveUserCall = RetrieveUserCall();
  static ModifyUserCall modifyUserCall = ModifyUserCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static CreateRealtimeSessionCall createRealtimeSessionCall =
      CreateRealtimeSessionCall();
  static CreateThreadCall createThreadCall = CreateThreadCall();
  static CreateThreadAndRunCall createThreadAndRunCall =
      CreateThreadAndRunCall();
  static GetThreadCall getThreadCall = GetThreadCall();
  static ModifyThreadCall modifyThreadCall = ModifyThreadCall();
  static DeleteThreadCall deleteThreadCall = DeleteThreadCall();
  static ListMessagesCall listMessagesCall = ListMessagesCall();
  static CreateMessageCall createMessageCall = CreateMessageCall();
  static GetMessageCall getMessageCall = GetMessageCall();
  static ModifyMessageCall modifyMessageCall = ModifyMessageCall();
  static DeleteMessageCall deleteMessageCall = DeleteMessageCall();
  static ListRunsCall listRunsCall = ListRunsCall();
  static CreateRunCall createRunCall = CreateRunCall();
  static GetRunCall getRunCall = GetRunCall();
  static ModifyRunCall modifyRunCall = ModifyRunCall();
  static CancelRunCall cancelRunCall = CancelRunCall();
  static ListRunStepsCall listRunStepsCall = ListRunStepsCall();
  static GetRunStepCall getRunStepCall = GetRunStepCall();
  static SubmitToolOuputsToRunCall submitToolOuputsToRunCall =
      SubmitToolOuputsToRunCall();
  static CreateUploadCall createUploadCall = CreateUploadCall();
  static CancelUploadCall cancelUploadCall = CancelUploadCall();
  static CompleteUploadCall completeUploadCall = CompleteUploadCall();
  static AddUploadPartCall addUploadPartCall = AddUploadPartCall();
  static ListVectorStoresCall listVectorStoresCall = ListVectorStoresCall();
  static CreateVectorStoreCall createVectorStoreCall = CreateVectorStoreCall();
  static GetVectorStoreCall getVectorStoreCall = GetVectorStoreCall();
  static ModifyVectorStoreCall modifyVectorStoreCall = ModifyVectorStoreCall();
  static DeleteVectorStoreCall deleteVectorStoreCall = DeleteVectorStoreCall();
  static CreateVectorStoreFileBatchCall createVectorStoreFileBatchCall =
      CreateVectorStoreFileBatchCall();
  static GetVectorStoreFileBatchCall getVectorStoreFileBatchCall =
      GetVectorStoreFileBatchCall();
  static CancelVectorStoreFileBatchCall cancelVectorStoreFileBatchCall =
      CancelVectorStoreFileBatchCall();
  static ListFilesInVectorStoreBatchCall listFilesInVectorStoreBatchCall =
      ListFilesInVectorStoreBatchCall();
  static ListVectorStoreFilesCall listVectorStoreFilesCall =
      ListVectorStoreFilesCall();
  static CreateVectorStoreFileCall createVectorStoreFileCall =
      CreateVectorStoreFileCall();
  static GetVectorStoreFileCall getVectorStoreFileCall =
      GetVectorStoreFileCall();
  static DeleteVectorStoreFileCall deleteVectorStoreFileCall =
      DeleteVectorStoreFileCall();
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
  static CreateDiaryCommentCall createDiaryCommentCall =
      CreateDiaryCommentCall();
}

class ListAssistantsCall {
  Future<ApiCallResponse> call({
    int? limit = 20,
    String? order = 'desc',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListAssistantsCall',
        'variables': {
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateAssistantCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateAssistantCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = 'asst_wPsD5ln34oAGBVfNT7giLfir',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = 'asst_wPsD5ln34oAGBVfNT7giLfir',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteAssistantCall {
  Future<ApiCallResponse> call({
    String? assistantId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteAssistantCall',
        'variables': {
          'assistantId': assistantId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateSpeechCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateSpeechCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateTranscriptionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateTranscriptionCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateTranslationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateTranslationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateBatchCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateBatchCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListBatchesCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListBatchesCall',
        'variables': {
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveBatchCall',
        'variables': {
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelBatchCall {
  Future<ApiCallResponse> call({
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelBatchCall',
        'variables': {
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateChatCompletionCall {
  Future<ApiCallResponse> call({
    dynamic? messagesJson,
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateChatCompletionCall',
        'variables': {
          'messages': messages,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? gptResponseContent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateCompletionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateCompletionCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateEmbeddingCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateEmbeddingCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFilesCall {
  Future<ApiCallResponse> call({
    String? purpose = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFilesCall',
        'variables': {
          'purpose': purpose,
          'limit': limit,
          'order': order,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateFileCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateFileCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DownloadFileCall {
  Future<ApiCallResponse> call({
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DownloadFileCall',
        'variables': {
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateFineTuningJobCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListPaginatedFineTuningJobsCall {
  Future<ApiCallResponse> call({
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListPaginatedFineTuningJobsCall',
        'variables': {
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveFineTuningJobCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelFineTuningJobCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelFineTuningJobCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFineTuningJobCheckpointsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFineTuningJobCheckpointsCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFineTuningEventsCall {
  Future<ApiCallResponse> call({
    String? fineTuningJobId = '',
    String? after = '',
    int? limit,
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFineTuningEventsCall',
        'variables': {
          'fineTuningJobId': fineTuningJobId,
          'after': after,
          'limit': limit,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageEditCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageEditCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateImageVariationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateImageVariationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListModelsCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListModelsCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveModelCall',
        'variables': {
          'model': model,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteModelCall {
  Future<ApiCallResponse> call({
    String? model = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteModelCall',
        'variables': {
          'model': model,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateModerationCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateModerationCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AdminApiKeysListCall {
  Future<ApiCallResponse> call({
    String? after = '',
    String? order = '',
    int? limit,
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AdminApiKeysListCall',
        'variables': {
          'after': after,
          'order': order,
          'limit': limit,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AdminApiKeysCreateCall {
  Future<ApiCallResponse> call() async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AdminApiKeysCreateCall',
        'variables': {},
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AdminApiKeysGetCall {
  Future<ApiCallResponse> call({
    String? keyId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AdminApiKeysGetCall',
        'variables': {
          'keyId': keyId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AdminApiKeysDeleteCall {
  Future<ApiCallResponse> call({
    String? keyId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AdminApiKeysDeleteCall',
        'variables': {
          'keyId': keyId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListAuditLogsCall {
  Future<ApiCallResponse> call({
    String? effectiveAt = '',
    List<String>? projectIdsList,
    List<String>? eventTypesList,
    List<String>? actorIdsList,
    List<String>? actorEmailsList,
    List<String>? resourceIdsList,
    int? limit,
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final eventTypes = _serializeList(eventTypesList);
    final actorIds = _serializeList(actorIdsList);
    final actorEmails = _serializeList(actorEmailsList);
    final resourceIds = _serializeList(resourceIdsList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListAuditLogsCall',
        'variables': {
          'effectiveAt': effectiveAt,
          'projectIds': projectIds,
          'eventTypes': eventTypes,
          'actorIds': actorIds,
          'actorEmails': actorEmails,
          'resourceIds': resourceIds,
          'limit': limit,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageCostsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageCostsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListInvitesCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListInvitesCall',
        'variables': {
          'limit': limit,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class InviteUserCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'InviteUserCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveInviteCall {
  Future<ApiCallResponse> call({
    String? inviteId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveInviteCall',
        'variables': {
          'inviteId': inviteId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteInviteCall {
  Future<ApiCallResponse> call({
    String? inviteId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteInviteCall',
        'variables': {
          'inviteId': inviteId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListProjectsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    bool? includeArchived,
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListProjectsCall',
        'variables': {
          'limit': limit,
          'after': after,
          'includeArchived': includeArchived,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateProjectCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateProjectCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveProjectCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveProjectCall',
        'variables': {
          'projectId': projectId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyProjectCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyProjectCall',
        'variables': {
          'projectId': projectId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListProjectApiKeysCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListProjectApiKeysCall',
        'variables': {
          'projectId': projectId,
          'limit': limit,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveProjectApiKeyCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? keyId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveProjectApiKeyCall',
        'variables': {
          'projectId': projectId,
          'keyId': keyId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteProjectApiKeyCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? keyId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteProjectApiKeyCall',
        'variables': {
          'projectId': projectId,
          'keyId': keyId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ArchiveProjectCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ArchiveProjectCall',
        'variables': {
          'projectId': projectId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListProjectRateLimitsCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListProjectRateLimitsCall',
        'variables': {
          'projectId': projectId,
          'limit': limit,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UpdateProjectRateLimitsCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? rateLimitId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UpdateProjectRateLimitsCall',
        'variables': {
          'projectId': projectId,
          'rateLimitId': rateLimitId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListProjectServiceAccountsCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListProjectServiceAccountsCall',
        'variables': {
          'projectId': projectId,
          'limit': limit,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateProjectServiceAccountCall',
        'variables': {
          'projectId': projectId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? serviceAccountId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveProjectServiceAccountCall',
        'variables': {
          'projectId': projectId,
          'serviceAccountId': serviceAccountId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteProjectServiceAccountCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? serviceAccountId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteProjectServiceAccountCall',
        'variables': {
          'projectId': projectId,
          'serviceAccountId': serviceAccountId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListProjectUsersCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListProjectUsersCall',
        'variables': {
          'projectId': projectId,
          'limit': limit,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateProjectUserCall',
        'variables': {
          'projectId': projectId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveProjectUserCall',
        'variables': {
          'projectId': projectId,
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyProjectUserCall',
        'variables': {
          'projectId': projectId,
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteProjectUserCall {
  Future<ApiCallResponse> call({
    String? projectId = '',
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteProjectUserCall',
        'variables': {
          'projectId': projectId,
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageAudioSpeechesCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageAudioSpeechesCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageAudioTranscriptionsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageAudioTranscriptionsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageCodeInterpreterSessionsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageCodeInterpreterSessionsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageCompletionsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    bool? batch,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageCompletionsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'batch': batch,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageEmbeddingsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageEmbeddingsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageImagesCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? sourcesList,
    List<String>? sizesList,
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final sources = _serializeList(sourcesList);
    final sizes = _serializeList(sizesList);
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageImagesCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'sources': sources,
          'sizes': sizes,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageModerationsCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? userIdsList,
    List<String>? apiKeyIdsList,
    List<String>? modelsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final userIds = _serializeList(userIdsList);
    final apiKeyIds = _serializeList(apiKeyIdsList);
    final models = _serializeList(modelsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageModerationsCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'userIds': userIds,
          'apiKeyIds': apiKeyIds,
          'models': models,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UsageVectorStoresCall {
  Future<ApiCallResponse> call({
    int? startTime,
    int? endTime,
    String? bucketWidth = '',
    List<String>? projectIdsList,
    List<String>? groupByList,
    int? limit,
    String? page = '',
    String? apiKeyAuth = '',
  }) async {
    final projectIds = _serializeList(projectIdsList);
    final groupBy = _serializeList(groupByList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UsageVectorStoresCall',
        'variables': {
          'startTime': startTime,
          'endTime': endTime,
          'bucketWidth': bucketWidth,
          'projectIds': projectIds,
          'groupBy': groupBy,
          'limit': limit,
          'page': page,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListUsersCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? after = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListUsersCall',
        'variables': {
          'limit': limit,
          'after': after,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class RetrieveUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'RetrieveUserCall',
        'variables': {
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyUserCall',
        'variables': {
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteUserCall',
        'variables': {
          'userId': userId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateRealtimeSessionCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateRealtimeSessionCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateThreadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateThreadCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateThreadAndRunCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateThreadAndRunCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteThreadCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteThreadCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListMessagesCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListMessagesCall',
        'variables': {
          'threadId': threadId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateMessageCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteMessageCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? messageId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteMessageCall',
        'variables': {
          'threadId': threadId,
          'messageId': messageId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListRunsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListRunsCall',
        'variables': {
          'threadId': threadId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? apiKeyAuth = '',
    List<String>? includeList,
  }) async {
    final include = _serializeList(includeList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateRunCall',
        'variables': {
          'threadId': threadId,
          'apiKeyAuth': apiKeyAuth,
          'include': include,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListRunStepsCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    List<String>? includeList,
    String? apiKeyAuth = '',
  }) async {
    final include = _serializeList(includeList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListRunStepsCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'include': include,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetRunStepCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? stepId = '',
    List<String>? includeList,
    String? apiKeyAuth = '',
  }) async {
    final include = _serializeList(includeList);

    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetRunStepCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'stepId': stepId,
          'include': include,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SubmitToolOuputsToRunCall {
  Future<ApiCallResponse> call({
    String? threadId = '',
    String? runId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SubmitToolOuputsToRunCall',
        'variables': {
          'threadId': threadId,
          'runId': runId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateUploadCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateUploadCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelUploadCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CompleteUploadCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CompleteUploadCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class AddUploadPartCall {
  Future<ApiCallResponse> call({
    String? uploadId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'AddUploadPartCall',
        'variables': {
          'uploadId': uploadId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListVectorStoresCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListVectorStoresCall',
        'variables': {
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreCall {
  Future<ApiCallResponse> call({
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreCall',
        'variables': {
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ModifyVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ModifyVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteVectorStoreCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteVectorStoreCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelVectorStoreFileBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelVectorStoreFileBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListFilesInVectorStoreBatchCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? batchId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListFilesInVectorStoreBatchCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'batchId': batchId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'filter': filter,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ListVectorStoreFilesCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    int? limit,
    String? order = '',
    String? after = '',
    String? before = '',
    String? filter = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ListVectorStoreFilesCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'limit': limit,
          'order': order,
          'after': after,
          'before': before,
          'filter': filter,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CreateVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class GetVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'GetVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DeleteVectorStoreFileCall {
  Future<ApiCallResponse> call({
    String? vectorStoreId = '',
    String? fileId = '',
    String? apiKeyAuth = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DeleteVectorStoreFileCall',
        'variables': {
          'vectorStoreId': vectorStoreId,
          'fileId': fileId,
          'apiKeyAuth': apiKeyAuth,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey =
        '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',
    dynamic? promptJson,
  }) async {
    final prompt = _serializeJson(promptJson, true);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'SendFullPromptCall',
        'variables': {
          'apiKey': apiKey,
          'prompt': prompt,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? model(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.model''',
      ));
  String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class CreateDiaryCommentCall {
  Future<ApiCallResponse> call({
    dynamic? messagesJson,
    dynamic? promptJson,
  }) async {
    final messages = _serializeJson(messagesJson, true);
    final prompt = _serializeJson(promptJson);
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CreateDiaryCommentCall',
        'variables': {
          'messages': messages,
          'prompt': prompt,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  String? gptResponseContent(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

/// End OpenAI API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
