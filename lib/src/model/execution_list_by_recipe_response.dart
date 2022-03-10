import 'package:pylons_sdk/src/generated/pylons/execution.pb.dart';

class ExecutionListByRecipeResponse {
  final List<Execution> completedExecutions;
  final List<Execution> pendingExecutions;

  ExecutionListByRecipeResponse(
      {required this.completedExecutions, required this.pendingExecutions});

  factory ExecutionListByRecipeResponse.empty() {
    return ExecutionListByRecipeResponse(
        pendingExecutions: [], completedExecutions: []);
  }

  Map<String, dynamic> toJson() => {
        "completedExecutions": completedExecutions
            .map((execution) => execution.toProto3Json())
            .toList(),
        "pendingExecutions": pendingExecutions
            .map((execution) => execution.toProto3Json())
            .toList()
      };
}
