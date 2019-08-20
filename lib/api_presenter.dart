import 'package:flutter/cupertino.dart';

import 'apiRepository.dart';
import 'dependency_injection.dart';

abstract class ApiViewContract {
  void onApiResponseComplete(BuildContext mContext,Map<String, Object> items, int index);

  void onApiResponseError(BuildContext mContext,String error,int index);
}

class ApiPresenter {
  ApiViewContract _view;
  ApiRepository _repository;

  // ignore: sort_constructors_first
  ApiPresenter(this._view) {
    _repository = Injector().loginRepository;
  }

  void loadData(BuildContext mContext,String url, Map<String, Object> map, int index) {
    _repository
        .fetchData(mContext,url, map, index)
        .then((c) => _view.onApiResponseComplete(mContext,c, index))
        .catchError((onError) => _view.onApiResponseError(mContext,onError.toString(),index));
  }
}
