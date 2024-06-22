import 'package:equatable/equatable.dart';

import '../../../Util/Constant/enums.dart';

class HomeState extends Equatable {
  final List<ProgressStatus> status;

  const HomeState({
    this.status = const [],
  });

  @override
  List<Object> get props => [status];
}
