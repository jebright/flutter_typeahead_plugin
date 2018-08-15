import 'dart:async';
import 'package:flutter_typeahead_plugin/search.dart';
import 'package:flutter_typeahead_plugin/service_result.dart';

class SampleApi<T> extends SearchApi
{

  var _names =  [
    'Frodo Baggins',
    'Bilbo Baggins',
    'Samwise Gamgee',
    'Peregrin Took',
    'Meriadoc Brandybuck',
    'Gandalf Greyham',
  ];

  @override
    Future<ServiceResult<Iterable<String>>> exec<T>(String input) async {
      await new Future.delayed(new Duration(seconds: 3)); //simulate a slow response
      var results = _names.where((x) => x.toLowerCase().contains(input.trim().toLowerCase())).toList();
      final ServiceResult<Iterable<String>> sr = new ServiceResult<Iterable<String>>();
      sr.model = results;
      sr.ok = true;
      return new Future.value(sr);
    }
}