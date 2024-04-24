import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/req/register_req.dart';
import 'package:e_commerse/app/networks/models/req/register_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/register_verify_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_resend_req.dart';
import 'package:e_commerse/app/networks/models/req/signin_verify_req.dart';
import 'package:e_commerse/app/networks/models/res/get_user_data_res.dart';
import 'package:e_commerse/app/networks/models/res/register_res.dart';
import 'package:e_commerse/app/networks/models/res/register_resend_res.dart';
import 'package:e_commerse/app/networks/models/res/register_verify_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_resend_res.dart';
import 'package:e_commerse/app/networks/models/res/signin_verify_res.dart';

class AuthRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<RegisterRes?> register(RegisterReq registerReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.register,
        data: registerReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerResponse = RegisterRes.fromJson(response.data);
        if (registerResponse.email != null) {
          return registerResponse;
        } else {
          final registerResponse = RegisterRes(error: ("Something went wrong"));
          return registerResponse;
        }
      } else {
        final registerResponse = RegisterRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerResponse;
        } else {
          return registerResponse;
        }
      }
    } catch (e) {
      return RegisterRes(error: e.toString());
    }
  }

  Future<RegisterVerifyRes?> registerVerify(
      RegisterVerifyReq registerVerifyReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.registerVerify,
        data: registerVerifyReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerVerifyResponse =
            RegisterVerifyRes.fromJson(response.data);
        if (registerVerifyResponse.token != null) {
          return registerVerifyResponse;
        } else {
          final registerVerifyResponse =
              RegisterVerifyRes(error: ("Something went wrong"));
          return registerVerifyResponse;
        }
      } else {
        final registerVerifyResponse =
            RegisterVerifyRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerVerifyResponse;
        } else {
          return registerVerifyResponse;
        }
      }
    } catch (e) {
      return RegisterVerifyRes(error: e.toString());
    }
  }

  Future<RegisterResendRes?> registerResend(
      RegisterResendReq registerResendReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.RegisterResend,
        data: registerResendReq.toJson(),
      );
      if (response.statusCode == 200) {
        final registerResendResponse =
            RegisterResendRes.fromJson(response.data);
        if (registerResendResponse.user != null) {
          return registerResendResponse;
        } else {
          final registerResendResponse =
              RegisterResendRes(error: ("Something went wrong"));
          return registerResendResponse;
        }
      } else {
        final registerResendResponse =
            RegisterResendRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return registerResendResponse;
        } else {
          return registerResendResponse;
        }
      }
    } catch (e) {
      return RegisterResendRes(error: e.toString());
    }
  }

  Future<SigninRes?> signin(SigninReq signinReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signIn,
        data: signinReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinResponse = SigninRes.fromJson(response.data);
        if (signinResponse.user != null) {
          return signinResponse;
        } else {
          final signinResponse = SigninRes(error: ("Something went wrong"));
          return signinResponse;
        }
      } else {
        final signinResponse = SigninRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinResponse;
        } else {
          return signinResponse;
        }
      }
    } catch (e) {
      return SigninRes(error: e.toString());
    }
  }

  Future<SigninVerifyRes?> signinVerify(SigninVerifyReq signinVerifyReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signInVerify,
        data: signinVerifyReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinVerifyResponse = SigninVerifyRes.fromJson(response.data);
        if (signinVerifyResponse.token != null) {
          return signinVerifyResponse;
        } else {
          final signinVerifyResponse =
              SigninVerifyRes(error: ("Something went wrong"));
          return signinVerifyResponse;
        }
      } else {
        final signinVerifyResponse = SigninVerifyRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinVerifyResponse;
        } else {
          return signinVerifyResponse;
        }
      }
    } catch (e) {
      return SigninVerifyRes(error: e.toString());
    }
  }

  Future<SigninResendRes?> signinResend(SigninResendReq signinResendReq) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.signInResend,
        data: signinResendReq.toJson(),
      );

      if (response.statusCode == 200) {
        final signinResendResponse = SigninResendRes.fromJson(response.data);
        if (signinResendResponse.message != null) {
          return signinResendResponse;
        } else {
          final signinResendResponse =
              SigninResendRes(error: ("Something went wrong"));
          return signinResendResponse;
        }
      } else {
        final signinResendResponse = SigninResendRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return signinResendResponse;
        } else {
          return signinResendResponse;
        }
      }
    } catch (e) {
      return SigninResendRes(error: e.toString());
    }
  }

  Future<GetUserDataRes?> getUserData() async {
    try {
      final getUserDataResponse = await dioClient.mainReqRes(
        endPoints: Endpoints.getUserData,
      );
      if (getUserDataResponse != null) {
        if (getUserDataResponse.statusCode == 200) {
          final getUserData = GetUserDataRes.fromJson(getUserDataResponse.data);
          return getUserData;
        } else if (getUserDataResponse.statusCode == 400) {
          final getUserDataError =
              GetUserDataRes.fromJson(getUserDataResponse.data);
          return getUserDataError;
        } else if (getUserDataResponse.statusCode == 401) {
          final getUserDataError =
              GetUserDataRes.fromJson(getUserDataResponse.data);
          return GetUserDataRes(error: getUserDataError.error);
        } else {
          final getUserDataError =
              GetUserDataRes.fromJson(getUserDataResponse.data);
          return GetUserDataRes(error: getUserDataError.toString());
        }
      } else {
        // Handle null response
        return GetUserDataRes(error: "Null response received");
      }
    } catch (e) {
      return GetUserDataRes(error: e.toString());
    }
  }
}
