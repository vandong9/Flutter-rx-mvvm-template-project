import 'package:ProjectTemplate/core/base/base_view_model.dart';
import 'package:ProjectTemplate/routes.dart';

import 'splash_repository.dart';

class SplashViewModel extends BaseViewModel {
  final IRoute _appRouter; // = getIt<IRoute>();
  final ISplashRepository _repository;

  final SplashViewModelInput input = SplashViewModelInput();
  final SplashViewModelOutput output = SplashViewModelOutput();

  SplashViewModel(this._repository, this._appRouter);

  @override
  void transform() {
    super.transform();
    Future.delayed(const Duration(seconds: 1), () {
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class SplashViewModelInput extends BaseInput {
  @override
  void dispose() {
    super.dispose();
  }
}

class SplashViewModelOutput extends BaseOutput {
  @override
  void dispose() {
    super.dispose();
  }
}
