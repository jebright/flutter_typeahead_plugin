import 'package:flutter/material.dart';

import 'search.dart';
import 'service_state.dart';

class TypeAhead<T> extends StatelessWidget {
  final Search<T> search;
  final SearchApi<T> api;

  TypeAhead(this.api) : search = new Search(api);

  Widget buildState(ServiceState serviceState) {
    if (serviceState.isProcessing) {
      return new Center(
          child: new Container(
              margin: const EdgeInsets.all(10.0),
              child: new CircularProgressIndicator()));
    } else if (serviceState.result?.model != null &&
        serviceState.result.model.length > 0) {
      ListView lb = new ListView.builder(
          shrinkWrap: true,
          itemCount: serviceState.result?.model?.length ?? 0,
          itemBuilder: (c, i) {
            String item = serviceState.result.model[i];
            return new Container(
              child: new Text(
                item,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          });
      return lb;
    } else {
      return new Text("no results");
    }
  }

  @override
  build(BuildContext context) {
    return new StreamBuilder<ServiceState>(
        stream: search.state,
        initialData: new ServiceState.initial(),
        builder: (BuildContext context, AsyncSnapshot<ServiceState> snapshot) {
          final serviceState = snapshot.data;

          return new Column(children: [
            new TextField(onChanged: (String s) => search.onTextChanged.add(s)),
            new Row(
              children: <Widget>[new Expanded(child: buildState(serviceState))],
            )
          ]);
        });
  }
}
