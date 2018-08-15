# Flutter TypeAhead plugin

A plugin built for Flutter that provides a TypeAhead Widget.

## Getting Started
Simply import the Widget, give it an API of your own you want to call, and Go!  
The source code repository is located here: (coming soon...)

## Example
You can find this working example under the example/lib folder:

### Step 1 - define your API
This component expects you to supply it an API to call.  You can create your own or wrap an existing one.  The onlye requirement is that it adheres to the following interface:

~~~~
//A simple class that provides a success/fail indicator as well as a model (result) of the specified type.
class ServiceResult<T> {
  bool ok;
  T model;
}

//A simple interface to abstract how we can search
abstract class SearchApi<T> {
  Future<ServiceResult> exec<T>(String input);
}
~~~~

Here is the full source of the example provided with this Typeahead:
~~~~
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
~~~~

In my example, I return local data, but there is nothing preventing you from calling a restful service or any API for that matter - as long as you map it into the expected format for all responses (ServiceResult<T>).

### Step 2 - create the Typeahead component
You can use any layout you want, but here is the approach taken in the example (see /example/lib/main.dart in the source code):

~~~~
body: new Column(
    children: <Widget>[
          new TypeAhead(api),
    ],
),
~~~~
The only requirement of the TypeAhead is that you pass it the api you want to call.

## Questions, Bugs, or Feature Requests?
Visit the github repository and let me know!

## Final Notes
I also discuss this component on my blog here - https://codingwithjoe.com/a-flutter-typeahead-component
