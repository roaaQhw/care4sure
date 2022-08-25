import 'package:care4sure/const/const.dart';
import 'package:care4sure/dio/end_pionts.dart';
import 'package:dio/dio.dart';





class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: 'http://care4sure.herokuapp.com',
        receiveDataWhenStatusError: true,
        headers: {
          "Accept": "application/json",
          "Connection": 'keep-alive',
        }),
  );

  static Future<Response> login({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
      LOGIN,
      data: data,
    );
  }

  static Future<Response> signup({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(SIGNUP,
        data: FormData.fromMap(data),
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
        }));
  }

//
// static Future<Response> orderResponse({
//   required Map<String, dynamic> data,
//   required int orderID,
// }) async {
//   return await dio.post(
//     '$ORDERRESPONSE/${orderID.toString()}',
//     options: Options(headers: {
//       'Authorization': 'Bearer $token',
//     }),
//     data: data,
//   );
// }
//
  static Future<Response> getAllPlaces() async {
    return await dio.get(
      GETPLACES,
    );
  }

  static Future<Response> getAllMedicine() async {
    return await dio.get(
        ALL,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> getAllMaterials() async {
    return await dio.get(
        ALLM,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> userProfile() async {
    return await dio.get(
        USERPROFILE,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }


  static Future<Response> createOrder() async {
    return await dio.post(
        SIGNOUT,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> deleteMed() async {
    return await dio.post(
        DELETEMED,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> materials(data) async {
    return await dio.post(
        MATERIALS,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> add(data) async {
    return await dio.post(
        ADD,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }

  // static Future<Response> alternative( data) async {
  //   return await dio.post(
  //       ALTERNATIVE,
  //       data: data,
  // options: Options(
  //         headers: {
  //           'Authorization' : 'Bearer $token'
  //         },
  //       )
  //   );
  // }


  static Future<Response> alter({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
        ALTERNATIVE,
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        )
    );
  }


  static Future<Response> res({
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(
        RESV,
        data: data,
        options:Options(
          headers: {
            'Authorization' : 'Bearer $token'
          },
        )
    );
  }

  static Future<Response> materialsEx() async {
    return await dio.get(
      ALLE,
      options: Options(
        headers: {
          'Authorization' : 'Bearer $token'
        },
      )
    );
  }




  static Future<Response> nearestPharmacy({ required Map<String, dynamic> data,}

      ) async {
    return await dio.post(
        NEARESTPHARMACY,
        data: data,
        options: Options(
          headers: {
            'Authorization' : 'Bearer $token'
          },
        )
    );
  }

// static Future<Response> getMyReservation() async {
//   return await dio.get(
//     GETRESERVATION,
//     options: Options(headers: {
//       'Authorization': 'Bearer $token',
//     }),
//   );
// }
//
// static Future<Response> createPlace({
//   required String placeName,
//   required File placeImage,
//   required String placeLocation,
//   required String placeDetails,
// }) async {
//   return await dio.post(
//     CREATPLACE,
//     options: Options(
//       headers: {
//         'Authorization': 'Bearer $token',
//       },
//     ),
//     data: FormData.fromMap({
//       "name": placeName,
//       "image": await MultipartFile.fromFile(
//         placeImage.path,
//       ),
//       "location": placeLocation,
//       "details": placeDetails
//     }),
//   );
// }
//

//
// static Future<Response> getMyOrders() async {
//   return await dio.get(
//     GETORDERS,
//     options: Options(headers: {
//       'Authorization': 'Bearer $token',
//     }),
//   );
// }
//
// static Future<Response> getAllProviders() async {
//   return await dio.get(
//     GETPROVIDERS,
//   );
// }
}
