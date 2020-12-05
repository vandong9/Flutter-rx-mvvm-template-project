import 'package:ProjectTemplate/core/base/base_view_model.dart';
import 'package:ProjectTemplate/routes.dart';
import 'package:rxdart/subjects.dart';

import 'repository.dart';

class TemplateViewModel extends BaseViewModel {
  final IRoute _appRouter; // = getIt<IRoute>();
  final ITemplateRepository _repository;

  final TemplateViewModelInput input = TemplateViewModelInput();
  final TemplateViewModelOutput output = TemplateViewModelOutput();

  TemplateViewModel(this._repository, this._appRouter);

  @override
  void transform() {
    super.transform();

    input.popBackTrigger.listen((value) {
      _appRouter.pop();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class TemplateViewModelInput extends BaseInput {
  final popBackTrigger = PublishSubject();

  @override
  void dispose() {
    super.dispose();
    popBackTrigger.close();
  }
}

class TemplateViewModelOutput extends BaseOutput {
  @override
  void dispose() {
    super.dispose();
  }
}
