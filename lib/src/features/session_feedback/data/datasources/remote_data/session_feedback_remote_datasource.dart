import '../../../../../../base/gateway/api_gateway.base.dart';
import '../../../../../../config/app_config.dart';
import 'model/session_feedback_content_model.dart';
import 'resources/session_feedback_resource.dart';

class SessionFeedbackRemoteDatasource {
  SessionFeedbackRemoteDatasource();

  final ApiGateway apiGateway = ApiGateway(
    AppConfig.value.baseUrl,
    apiType: ApiType.user,
  );

  Future<SessionFeedbackContentModel> getSessionFeedbackContent() async {
    final response = await apiGateway.execute(
      resource: const SessionFeedbackContentResource(),
      method: HTTPMethod.get,
    );
    return SessionFeedbackContentBaseModel.fromJson(response.data).data;
  }
}
