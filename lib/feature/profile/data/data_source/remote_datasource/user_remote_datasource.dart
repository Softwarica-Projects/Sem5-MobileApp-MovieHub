import 'package:dio/dio.dart';
import 'package:moviehub/core/constant/api_url.dart';
import 'package:moviehub/core/utility/extension.dart';
import 'package:moviehub/feature/profile/data/data_source/user_data_source.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/services/core/http_service.dart';

class UserRemoteDataSource implements IUserDataSource {
  final HttpService _httpService;

  UserRemoteDataSource(this._httpService);

  @override
  Future<UserEntity> getUserInformation() async {
    var response = await _httpService.getData(
      ApiUrl.getUser,
    );
    return UserEntity.fromMap(response);
  }

  @override
  Future<String> updateUser(UserEntity data) async {
    var formData = data.toMap();
    if (data.imageUrl != null && !data.imageUrl!.isNetworkFile) {
      var file = await MultipartFile.fromFile(
        data.imageUrl!,
        filename: data.imageUrl!.split('/').last,
      );
      formData['image'] = file;
    }
    var response = await _httpService.putDataFormData(ApiUrl.updateUser, data: formData);
    return response['message'].toString();
  }
}
