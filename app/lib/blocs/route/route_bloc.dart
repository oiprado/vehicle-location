import 'package:bloc/bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'route_event.dart';
part 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  RouteBloc() : super(RouteInitial()) {
    on<RouteEvent>((event, emit) {});
  }

  Future<List<LatLng>> getPolylines() async {
    var url =
        Uri.https('5221-181-51-228-152.ngrok-free.app', '/route/user/RouteA');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return List<LatLng>.empty();
  }
}
