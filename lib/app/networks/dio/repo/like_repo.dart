import 'package:dio/dio.dart';
import 'package:e_commerse/app/networks/dio/dio_client.dart';
import 'package:e_commerse/app/networks/dio/endpoints.dart';
import 'package:e_commerse/app/networks/models/res/add_like_res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_liked_byid_res.dart';
import 'package:e_commerse/app/networks/models/res/get_all_likes.dart';
import 'package:e_commerse/app/networks/models/res/unlike_res.dart';

class LikeRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<AddLikeRes?> like(String productId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.addLike,
        queryParameters: productId,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final addLikeResponse = AddLikeRes.fromJson(response.data);
          return addLikeResponse;
        } else if (response.statusCode == 400) {
          final addLikeResponse = AddLikeRes.fromJson(response.data);
          return addLikeResponse;
        } else {
          final addLikeResponse = AddLikeRes.fromJson(response.data);
          return addLikeResponse;
        }
      } else {
        return AddLikeRes(error: "Something went wrong!");
      }
    } catch (e) {
      return AddLikeRes(error: e.toString());
    }
  }

  Future<UnlikeRes?> unlike(String productId) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.unLike,
        queryParameters: productId,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final unlikeResponse = UnlikeRes.fromJson(response.data);
          return unlikeResponse;
        } else if (response.statusCode == 400) {
          final unlikeResponse = UnlikeRes.fromJson(response.data);
          return unlikeResponse;
        } else {
          final unlikeResponse = UnlikeRes.fromJson(response.data);
          return unlikeResponse;
        }
      } else {
        return UnlikeRes(error: "Something went wrong!");
      }
    } catch (e) {
      return UnlikeRes(error: e.toString());
    }
  }

  Future<GetAllLikesByIdRes?> getAllLikes() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getAllLiked,
      );

      if (response.data != null) {
        if (response.statusCode == 200) {
          final getAllLikesResponse =
              GetAllLikesByIdRes.fromJson(response.data);
          return getAllLikesResponse;
        } else if (response.statusCode == 400) {
          final getAllLikesResponse =
              GetAllLikesByIdRes.fromJson(response.data);
          return getAllLikesResponse;
        } else {
          final getAllLikedResponse =
              GetAllLikesByIdRes.fromJson(response.data);
          return getAllLikedResponse;
        }
      } else {
        return GetAllLikesByIdRes(error: "Something went wrong!");
      }
    } catch (e) {
      return GetAllLikesByIdRes(error: e.toString());
    }
  }

  Future<GetAllLikesRes?> getAllLikesData() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: Endpoints.getAllLikes,
      );
      if (response.data != null) {
        if (response.statusCode == 200) {
          final getAllLikesResponse = GetAllLikesRes.fromJson(response.data);
          return getAllLikesResponse;
        } else if (response.statusCode == 400) {
          final getAllLikesResponse = GetAllLikesRes.fromJson(response.data);
          return getAllLikesResponse;
        } else {
          final getAllLikesResponse = GetAllLikesRes.fromJson(response.data);
          return getAllLikesResponse;
        }
      } else {
        return GetAllLikesRes(error: "Something went wrong!");
      }
    } catch (e) {
      return GetAllLikesRes(error: e.toString());
    }
  }
}
