import 'package:hive/hive.dart';

part 'hlp_caching_model.g.dart';

@HiveType(typeId: 0, adapterName: 'CachingAdapter')
  class CachingModel {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String  response;
  @HiveField(2)
  final DateTime cachingDate;
  @HiveField(3)
  final DateTime expireDate;



  CachingModel(
      {required this.url,
        required this.response,
        required this.cachingDate,
        required this.expireDate,});
}