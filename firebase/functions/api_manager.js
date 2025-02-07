const axios = require("axios").default;
const qs = require('qs');

/// Start OpenAI API Group Code

function createOpenAIAPIGroup() {
  return {
    baseUrl: `https://api.openai.com/v1`,
    headers: {"Authorization": `Bearer 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`,},
  };
}

async function _listAssistantsCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/assistants`;
  var headers = {"Authorization": `Bearer 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`,"OpenAI-Beta": `assistants=v2`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createAssistantCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/assistants`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = {"Authorization": `Bearer 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`,"OpenAI-Beta": `assistants=v2`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "name": "",
  "description": "",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteAssistantCall(context, ffVariables) {
  var assistantId = ffVariables["assistantId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/assistants/${assistantId}`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createSpeechCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/audio/speech`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "input": "",
  "voice": "alloy",
  "response_format": "mp3",
  "speed": 0
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createTranscriptionCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/audio/transcriptions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createTranslationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/audio/translations`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createBatchCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/batches`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "input_file_id": "",
  "endpoint": "/v1/chat/completions",
  "completion_window": "24h",
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listBatchesCall(context, ffVariables) {
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/batches`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'after': after,'limit': limit,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveBatchCall(context, ffVariables) {
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/batches/${batchId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelBatchCall(context, ffVariables) {
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/batches/${batchId}/cancel`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createChatCompletionCall(context, ffVariables) {
  var messages = ffVariables["messages"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/chat/completions`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = `
{
  "messages": ${messages},
  "model": "gpt-4o-mini"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createCompletionCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/completions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "",
  "prompt": "",
  "best_of": 0,
  "echo": false,
  "frequency_penalty": 0,
  "logit_bias": {},
  "logprobs": 0,
  "max_tokens": 16,
  "n": 1,
  "presence_penalty": 0,
  "seed": 0,
  "stop": "",
  "stream": false,
  "stream_options": {
    "include_usage": false
  },
  "suffix": "test.",
  "temperature": 1,
  "top_p": 1,
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createEmbeddingCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/embeddings`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "input": "The quick brown fox jumped over the lazy dog",
  "model": "text-embedding-3-small",
  "encoding_format": "float",
  "dimensions": 0,
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFilesCall(context, ffVariables) {
  var purpose = ffVariables["purpose"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/files`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'purpose': purpose,'limit': limit,'order': order,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createFileCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/files`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _downloadFileCall(context, ffVariables) {
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/files/${fileId}/content`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createFineTuningJobCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-4o-mini",
  "training_file": "file-abc123",
  "hyperparameters": {
    "batch_size": "",
    "learning_rate_multiplier": "",
    "n_epochs": ""
  },
  "suffix": "",
  "validation_file": "file-abc123",
  "integrations": [
    {
      "type": "",
      "wandb": {
        "project": "my-wandb-project",
        "name": "",
        "entity": "",
        "tags": [
          "custom-tag"
        ]
      }
    }
  ],
  "seed": 42,
  "method": {
    "type": "supervised",
    "supervised": {
      "hyperparameters": {
        "batch_size": "",
        "learning_rate_multiplier": "",
        "n_epochs": ""
      }
    },
    "dpo": {
      "hyperparameters": {
        "beta": "",
        "batch_size": "",
        "learning_rate_multiplier": "",
        "n_epochs": ""
      }
    }
  }
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listPaginatedFineTuningJobsCall(context, ffVariables) {
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'after': after,'limit': limit,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveFineTuningJobCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelFineTuningJobCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/cancel`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFineTuningJobCheckpointsCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/checkpoints`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'after': after,'limit': limit,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFineTuningEventsCall(context, ffVariables) {
  var fineTuningJobId = ffVariables["fineTuningJobId"];
  var after = ffVariables["after"];
  var limit = ffVariables["limit"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/fine_tuning/jobs/${fineTuningJobId}/events`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'after': after,'limit': limit,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageEditCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/images/edits`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/images/generations`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "prompt": "A cute baby sea otter",
  "model": "dall-e-3",
  "n": 1,
  "quality": "standard",
  "response_format": "url",
  "size": "1024x1024",
  "style": "vivid",
  "user": "user-1234"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createImageVariationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/images/variations`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listModelsCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/models`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveModelCall(context, ffVariables) {
  var model = ffVariables["model"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/models/${model}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteModelCall(context, ffVariables) {
  var model = ffVariables["model"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/models/${model}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createModerationCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/moderations`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "input": "",
  "model": "omni-moderation-2024-09-26"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _adminApiKeysListCall(context, ffVariables) {
  var after = ffVariables["after"];
  var order = ffVariables["order"];
  var limit = ffVariables["limit"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/admin_api_keys`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {'after': after,'order': order,'limit': limit,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _adminApiKeysCreateCall(context, ffVariables) {

  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/admin_api_keys`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = `
{
  "name": "New Admin Key"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _adminApiKeysGetCall(context, ffVariables) {
  var keyId = ffVariables["keyId"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/admin_api_keys/${keyId}`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _adminApiKeysDeleteCall(context, ffVariables) {
  var keyId = ffVariables["keyId"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/admin_api_keys/${keyId}`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listAuditLogsCall(context, ffVariables) {
  var effectiveAt = ffVariables["effectiveAt"];
  var projectIds = ffVariables["projectIds"];
  var eventTypes = ffVariables["eventTypes"];
  var actorIds = ffVariables["actorIds"];
  var actorEmails = ffVariables["actorEmails"];
  var resourceIds = ffVariables["resourceIds"];
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/audit_logs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'effective_at': effectiveAt,'project_ids[]': projectIds,'event_types[]': eventTypes,'actor_ids[]': actorIds,'actor_emails[]': actorEmails,'resource_ids[]': resourceIds,'limit': limit,'after': after,'before': before,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageCostsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/costs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listInvitesCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/invites`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _inviteUserCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/invites`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "email": "",
  "role": "reader",
  "projects": [
    {
      "id": "",
      "role": "member"
    }
  ]
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveInviteCall(context, ffVariables) {
  var inviteId = ffVariables["inviteId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/invites/${inviteId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteInviteCall(context, ffVariables) {
  var inviteId = ffVariables["inviteId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/invites/${inviteId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listProjectsCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var includeArchived = ffVariables["includeArchived"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,'include_archived': includeArchived,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createProjectCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "name": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveProjectCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyProjectCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "name": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listProjectApiKeysCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/api_keys`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveProjectApiKeyCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var keyId = ffVariables["keyId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/api_keys/${keyId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteProjectApiKeyCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var keyId = ffVariables["keyId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/api_keys/${keyId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _archiveProjectCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/archive`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listProjectRateLimitsCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/rate_limits`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,'before': before,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _updateProjectRateLimitsCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var rateLimitId = ffVariables["rateLimitId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/rate_limits/${rateLimitId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "max_requests_per_1_minute": 0,
  "max_tokens_per_1_minute": 0,
  "max_images_per_1_minute": 0,
  "max_audio_megabytes_per_1_minute": 0,
  "max_requests_per_1_day": 0,
  "batch_1_day_max_input_tokens": 0
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listProjectServiceAccountsCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/service_accounts`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createProjectServiceAccountCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/service_accounts`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "name": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveProjectServiceAccountCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var serviceAccountId = ffVariables["serviceAccountId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/service_accounts/${serviceAccountId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteProjectServiceAccountCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var serviceAccountId = ffVariables["serviceAccountId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/service_accounts/${serviceAccountId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listProjectUsersCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/users`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createProjectUserCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/users`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "user_id": "",
  "role": "owner"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveProjectUserCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyProjectUserCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "role": "owner"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteProjectUserCall(context, ffVariables) {
  var projectId = ffVariables["projectId"];
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/projects/${projectId}/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageAudioSpeechesCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/audio_speeches`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageAudioTranscriptionsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/audio_transcriptions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageCodeInterpreterSessionsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/code_interpreter_sessions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageCompletionsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var batch = ffVariables["batch"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/completions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'batch': batch,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageEmbeddingsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/embeddings`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageImagesCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var sources = ffVariables["sources"];
  var sizes = ffVariables["sizes"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/images`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'sources': sources,'sizes': sizes,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageModerationsCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var userIds = ffVariables["userIds"];
  var apiKeyIds = ffVariables["apiKeyIds"];
  var models = ffVariables["models"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/moderations`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'user_ids': userIds,'api_key_ids': apiKeyIds,'models': models,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _usageVectorStoresCall(context, ffVariables) {
  var startTime = ffVariables["startTime"];
  var endTime = ffVariables["endTime"];
  var bucketWidth = ffVariables["bucketWidth"];
  var projectIds = ffVariables["projectIds"];
  var groupBy = ffVariables["groupBy"];
  var limit = ffVariables["limit"];
  var page = ffVariables["page"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/usage/vector_stores`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'start_time': startTime,'end_time': endTime,'bucket_width': bucketWidth,'project_ids': projectIds,'group_by': groupBy,'limit': limit,'page': page,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listUsersCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var after = ffVariables["after"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/users`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'after': after,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _retrieveUserCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyUserCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "role": "owner"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteUserCall(context, ffVariables) {
  var userId = ffVariables["userId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/organization/users/${userId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createRealtimeSessionCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/realtime/sessions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "modalities": "",
  "model": "gpt-4o-realtime-preview",
  "instructions": "",
  "voice": "alloy",
  "input_audio_format": "pcm16",
  "output_audio_format": "pcm16",
  "input_audio_transcription": {
    "model": ""
  },
  "turn_detection": {
    "type": "",
    "threshold": 0,
    "prefix_padding_ms": 0,
    "silence_duration_ms": 0,
    "create_response": false
  },
  "tools": [
    {
      "type": "function",
      "name": "",
      "description": "",
      "parameters": {}
    }
  ],
  "tool_choice": "",
  "temperature": 0,
  "max_response_output_tokens": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createThreadCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ],
      "vector_stores": [
        {
          "file_ids": [
            ""
          ],
          "chunking_strategy": {},
          "metadata": {}
        }
      ]
    }
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createThreadAndRunCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/runs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "assistant_id": "",
  "thread": {
    "messages": [
      {
        "role": "user",
        "content": "",
        "attachments": [
          {
            "file_id": "",
            "tools": [
              ""
            ]
          }
        ],
        "metadata": {}
      }
    ],
    "tool_resources": {
      "code_interpreter": {
        "file_ids": [
          ""
        ]
      },
      "file_search": {
        "vector_store_ids": [
          ""
        ],
        "vector_stores": [
          {
            "file_ids": [
              ""
            ],
            "chunking_strategy": {},
            "metadata": {}
          }
        ]
      }
    },
    "metadata": {}
  },
  "model": "gpt-4o",
  "instructions": "",
  "tools": [
    ""
  ],
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "tool_resources": {
    "code_interpreter": {
      "file_ids": [
        ""
      ]
    },
    "file_search": {
      "vector_store_ids": [
        ""
      ]
    }
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteThreadCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listMessagesCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,'run_id': runId,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "role": "user",
  "content": "",
  "attachments": [
    {
      "file_id": "",
      "tools": [
        ""
      ]
    }
  ],
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteMessageCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var messageId = ffVariables["messageId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/messages/${messageId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listRunsCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  var include = ffVariables["include"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "assistant_id": "",
  "model": "gpt-4o",
  "instructions": "",
  "additional_instructions": "",
  "additional_messages": [
    {
      "role": "user",
      "content": "",
      "attachments": [
        {
          "file_id": "",
          "tools": [
            ""
          ]
        }
      ],
      "metadata": {}
    }
  ],
  "tools": [
    ""
  ],
  "metadata": {},
  "temperature": 1,
  "top_p": 1,
  "stream": false,
  "max_prompt_tokens": 0,
  "max_completion_tokens": 0,
  "truncation_strategy": {
    "type": "auto",
    "last_messages": 0
  },
  "tool_choice": "",
  "parallel_tool_calls": false,
  "response_format": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/cancel`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listRunStepsCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var include = ffVariables["include"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/steps`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,'include[]': include,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getRunStepCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var stepId = ffVariables["stepId"];
  var include = ffVariables["include"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/steps/${stepId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'include[]': include,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _submitToolOuputsToRunCall(context, ffVariables) {
  var threadId = ffVariables["threadId"];
  var runId = ffVariables["runId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/threads/${threadId}/runs/${runId}/submit_tool_outputs`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "tool_outputs": [
    {
      "tool_call_id": "",
      "output": ""
    }
  ],
  "stream": false
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createUploadCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/uploads`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "filename": "",
  "purpose": "assistants",
  "bytes": 0,
  "mime_type": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelUploadCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/cancel`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _completeUploadCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/complete`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "part_ids": [
    ""
  ],
  "md5": ""
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _addUploadPartCall(context, ffVariables) {
  var uploadId = ffVariables["uploadId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/uploads/${uploadId}/parts`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listVectorStoresCall(context, ffVariables) {
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreCall(context, ffVariables) {
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "file_ids": [
    ""
  ],
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "chunking_strategy": {},
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _modifyVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "name": "",
  "expires_after": {
    "anchor": "last_active_at",
    "days": 0
  },
  "metadata": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteVectorStoreCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "file_ids": [
    ""
  ],
  "chunking_strategy": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _cancelVectorStoreFileBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/cancel`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listFilesInVectorStoreBatchCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var batchId = ffVariables["batchId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var filter = ffVariables["filter"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/file_batches/${batchId}/files`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,'filter': filter,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _listVectorStoreFilesCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var limit = ffVariables["limit"];
  var order = ffVariables["order"];
  var after = ffVariables["after"];
  var before = ffVariables["before"];
  var filter = ffVariables["filter"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {'limit': limit,'order': order,'after': after,'before': before,'filter': filter,};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "file_id": "",
  "chunking_strategy": {}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _getVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "get",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _deleteVectorStoreFileCall(context, ffVariables) {
  var vectorStoreId = ffVariables["vectorStoreId"];
  var fileId = ffVariables["fileId"];
  var apiKeyAuth = ffVariables["apiKeyAuth"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/vector_stores/${vectorStoreId}/files/${fileId}`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKeyAuth}`,};
  var params = {};
  var ffApiRequestBody = undefined;

  return makeApiRequest({
    method: "delete",
    url,
    headers,
    params,
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _sendFullPromptCall(context, ffVariables) {
  var apiKey = ffVariables["apiKey"];
  var prompt = ffVariables["prompt"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/chat/completions`;
  var headers = {"Authorization": `Bearer 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`,"Authorization": `Bearer ${apiKey}`,};
  var params = {};
  var ffApiRequestBody = `
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}

async function _createDiaryCommentCall(context, ffVariables) {
  var messages = ffVariables["messages"];
  var prompt = ffVariables["prompt"];
  const openAIAPIGroup = createOpenAIAPIGroup()

  var url = `${openAIAPIGroup.baseUrl}/chat/completions`;
  var headers = {"Authorization": `Bearer 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`,};
  var params = {};
  var ffApiRequestBody = `
{
  "messages": ${messages},
  "model": "gpt-4o-mini"
}`;

  return makeApiRequest({
    method: "post",
    url,
    headers,
    params,
    body: createBody({ headers, params, body: ffApiRequestBody, bodyType: "JSON" }),
    returnBody: true,
    isStreamingApi: false,
  });
}


/// End OpenAI API Group Code



/// Helper functions to route to the appropriate API Call.

async function makeApiCall(context, data) {
  var callName = data["callName"] || "";
  var variables = data["variables"] || {};

  const callMap = {
    "ListAssistantsCall": _listAssistantsCall,
    "CreateAssistantCall": _createAssistantCall,
    "GetAssistantCall": _getAssistantCall,
    "ModifyAssistantCall": _modifyAssistantCall,
    "DeleteAssistantCall": _deleteAssistantCall,
    "CreateSpeechCall": _createSpeechCall,
    "CreateTranscriptionCall": _createTranscriptionCall,
    "CreateTranslationCall": _createTranslationCall,
    "CreateBatchCall": _createBatchCall,
    "ListBatchesCall": _listBatchesCall,
    "RetrieveBatchCall": _retrieveBatchCall,
    "CancelBatchCall": _cancelBatchCall,
    "CreateChatCompletionCall": _createChatCompletionCall,
    "CreateCompletionCall": _createCompletionCall,
    "CreateEmbeddingCall": _createEmbeddingCall,
    "ListFilesCall": _listFilesCall,
    "CreateFileCall": _createFileCall,
    "DeleteFileCall": _deleteFileCall,
    "RetrieveFileCall": _retrieveFileCall,
    "DownloadFileCall": _downloadFileCall,
    "CreateFineTuningJobCall": _createFineTuningJobCall,
    "ListPaginatedFineTuningJobsCall": _listPaginatedFineTuningJobsCall,
    "RetrieveFineTuningJobCall": _retrieveFineTuningJobCall,
    "CancelFineTuningJobCall": _cancelFineTuningJobCall,
    "ListFineTuningJobCheckpointsCall": _listFineTuningJobCheckpointsCall,
    "ListFineTuningEventsCall": _listFineTuningEventsCall,
    "CreateImageEditCall": _createImageEditCall,
    "CreateImageCall": _createImageCall,
    "CreateImageVariationCall": _createImageVariationCall,
    "ListModelsCall": _listModelsCall,
    "RetrieveModelCall": _retrieveModelCall,
    "DeleteModelCall": _deleteModelCall,
    "CreateModerationCall": _createModerationCall,
    "AdminApiKeysListCall": _adminApiKeysListCall,
    "AdminApiKeysCreateCall": _adminApiKeysCreateCall,
    "AdminApiKeysGetCall": _adminApiKeysGetCall,
    "AdminApiKeysDeleteCall": _adminApiKeysDeleteCall,
    "ListAuditLogsCall": _listAuditLogsCall,
    "UsageCostsCall": _usageCostsCall,
    "ListInvitesCall": _listInvitesCall,
    "InviteUserCall": _inviteUserCall,
    "RetrieveInviteCall": _retrieveInviteCall,
    "DeleteInviteCall": _deleteInviteCall,
    "ListProjectsCall": _listProjectsCall,
    "CreateProjectCall": _createProjectCall,
    "RetrieveProjectCall": _retrieveProjectCall,
    "ModifyProjectCall": _modifyProjectCall,
    "ListProjectApiKeysCall": _listProjectApiKeysCall,
    "RetrieveProjectApiKeyCall": _retrieveProjectApiKeyCall,
    "DeleteProjectApiKeyCall": _deleteProjectApiKeyCall,
    "ArchiveProjectCall": _archiveProjectCall,
    "ListProjectRateLimitsCall": _listProjectRateLimitsCall,
    "UpdateProjectRateLimitsCall": _updateProjectRateLimitsCall,
    "ListProjectServiceAccountsCall": _listProjectServiceAccountsCall,
    "CreateProjectServiceAccountCall": _createProjectServiceAccountCall,
    "RetrieveProjectServiceAccountCall": _retrieveProjectServiceAccountCall,
    "DeleteProjectServiceAccountCall": _deleteProjectServiceAccountCall,
    "ListProjectUsersCall": _listProjectUsersCall,
    "CreateProjectUserCall": _createProjectUserCall,
    "RetrieveProjectUserCall": _retrieveProjectUserCall,
    "ModifyProjectUserCall": _modifyProjectUserCall,
    "DeleteProjectUserCall": _deleteProjectUserCall,
    "UsageAudioSpeechesCall": _usageAudioSpeechesCall,
    "UsageAudioTranscriptionsCall": _usageAudioTranscriptionsCall,
    "UsageCodeInterpreterSessionsCall": _usageCodeInterpreterSessionsCall,
    "UsageCompletionsCall": _usageCompletionsCall,
    "UsageEmbeddingsCall": _usageEmbeddingsCall,
    "UsageImagesCall": _usageImagesCall,
    "UsageModerationsCall": _usageModerationsCall,
    "UsageVectorStoresCall": _usageVectorStoresCall,
    "ListUsersCall": _listUsersCall,
    "RetrieveUserCall": _retrieveUserCall,
    "ModifyUserCall": _modifyUserCall,
    "DeleteUserCall": _deleteUserCall,
    "CreateRealtimeSessionCall": _createRealtimeSessionCall,
    "CreateThreadCall": _createThreadCall,
    "CreateThreadAndRunCall": _createThreadAndRunCall,
    "GetThreadCall": _getThreadCall,
    "ModifyThreadCall": _modifyThreadCall,
    "DeleteThreadCall": _deleteThreadCall,
    "ListMessagesCall": _listMessagesCall,
    "CreateMessageCall": _createMessageCall,
    "GetMessageCall": _getMessageCall,
    "ModifyMessageCall": _modifyMessageCall,
    "DeleteMessageCall": _deleteMessageCall,
    "ListRunsCall": _listRunsCall,
    "CreateRunCall": _createRunCall,
    "GetRunCall": _getRunCall,
    "ModifyRunCall": _modifyRunCall,
    "CancelRunCall": _cancelRunCall,
    "ListRunStepsCall": _listRunStepsCall,
    "GetRunStepCall": _getRunStepCall,
    "SubmitToolOuputsToRunCall": _submitToolOuputsToRunCall,
    "CreateUploadCall": _createUploadCall,
    "CancelUploadCall": _cancelUploadCall,
    "CompleteUploadCall": _completeUploadCall,
    "AddUploadPartCall": _addUploadPartCall,
    "ListVectorStoresCall": _listVectorStoresCall,
    "CreateVectorStoreCall": _createVectorStoreCall,
    "GetVectorStoreCall": _getVectorStoreCall,
    "ModifyVectorStoreCall": _modifyVectorStoreCall,
    "DeleteVectorStoreCall": _deleteVectorStoreCall,
    "CreateVectorStoreFileBatchCall": _createVectorStoreFileBatchCall,
    "GetVectorStoreFileBatchCall": _getVectorStoreFileBatchCall,
    "CancelVectorStoreFileBatchCall": _cancelVectorStoreFileBatchCall,
    "ListFilesInVectorStoreBatchCall": _listFilesInVectorStoreBatchCall,
    "ListVectorStoreFilesCall": _listVectorStoreFilesCall,
    "CreateVectorStoreFileCall": _createVectorStoreFileCall,
    "GetVectorStoreFileCall": _getVectorStoreFileCall,
    "DeleteVectorStoreFileCall": _deleteVectorStoreFileCall,
    "SendFullPromptCall": _sendFullPromptCall,
    "CreateDiaryCommentCall": _createDiaryCommentCall,
  };

  if (!(callName in callMap)) {
    return {
      statusCode: 400,
      error: `API Call "${callName}" not defined as private API.`,
    };
  }

  var apiCall = callMap[callName];
  var response = await apiCall(context, variables);
  return response;
}

async function makeApiRequest({
  method,
  url,
  headers,
  params,
  body,
  returnBody,
  isStreamingApi,
}) {
  return axios
    .request({
      method: method,
      url: url,
      headers: headers,
      params: params,
      responseType: (isStreamingApi ? 'stream' : 'json'),
      ...(body && { data: body }),
    })
    .then((response) => {
      return {
        statusCode: response.status,
        headers: response.headers,
        ...(returnBody && { body: response.data }),
        isStreamingApi: isStreamingApi,
      };
    })
    .catch(function (error) {
      return {
        statusCode: error.response.status,
        headers: error.response.headers,
        ...(returnBody && { body: error.response.data }),
        error: error.message,
      };
    });
}

const _unauthenticatedResponse = {
  statusCode: 401,
  headers: {},
  error: "API call requires authentication",
};

function createBody({ headers, params, body, bodyType }) {
  switch (bodyType) {
    case "JSON":
      headers["Content-Type"] = "application/json";
      return body;
    case "TEXT":
      headers["Content-Type"] = "text/plain";
      return body;
    case "X_WWW_FORM_URL_ENCODED":
      headers["Content-Type"] = "application/x-www-form-urlencoded";
      return qs.stringify(params);
  }
}
function escapeStringForJson(val) {
  if (typeof val !== "string") {
    return val;
  }
  return val
    .replace(/[\\]/g, '\\\\')
    .replace(/["]/g, '\\"')
    .replace(/[\n]/g, '\\n')
    .replace(/[\t]/g, '\\t');
}

module.exports = { makeApiCall };
