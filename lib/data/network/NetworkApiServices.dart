import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:oficepreactice/data/app_exception.dart';
import 'package:oficepreactice/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiServices{
  Future getGetApiResponse(String url) async{
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }


  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body:data
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No INternet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return http.Response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException('Error accoured while communicating with server'+'with status code'+response.statusCode.toString());
    }
  }
}