import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../models/network_trivia.dart';

abstract class RemoteTriviaDatasource{
  Future<NetworkTrivia> getTrivia(int number);
}

class RemoteTriviaDatasourceImpl implements RemoteTriviaDatasource{
  @override
  Future<NetworkTrivia> getTrivia(int number) async {
      try{
        final response = await Dio().get("https://opentdb.com/api.php?amount=${number}");
        return NetworkTrivia.fromJson(response.data);
      } catch(e){
        throw ServerException();
      }
  }

}