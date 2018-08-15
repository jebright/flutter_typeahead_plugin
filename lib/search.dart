import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'service_result.dart';
import 'service_state.dart';

//A simple interface to abstract how we can search
abstract class SearchApi<T> {
  Future<ServiceResult> exec<T>(String input);
}

class Search<T> {
  StreamController<String> onTextChanged;
  Stream<ServiceState> state;
  SearchApi<T> _api;

  Search(SearchApi api) {
    _api = api;

    onTextChanged = new StreamController<String>();
    state = new Observable<String>(onTextChanged.stream)
        .distinct() //only care if T has changed
        // Wait for the user to stop typing for 350ms before running a search
        .debounce(const Duration(
            milliseconds: 350))
        .switchMap(_searchMap())
        // The initial state to deliver to the screen.
        .startWith(new ServiceState.initial());        
  }

  void close() {
    onTextChanged.close();
  }

  Stream<ServiceState> Function(String) _searchMap() {
    return (String input) {
      return new Observable<ServiceResult>.fromFuture((_api.exec(input)))
          .map<ServiceState>((ServiceResult result) {
            ServiceState ss = new ServiceState(result: result);
            return ss;
          })
          .doOnError((e,s) => 
            print(s.toString())
          )
          .onErrorReturn( 
              new ServiceState.error()
          )
          .startWith(new ServiceState.processing());
    };
  }
  
}
