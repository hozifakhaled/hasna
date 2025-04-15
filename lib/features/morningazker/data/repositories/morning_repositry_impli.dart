import 'package:dartz/dartz.dart';
import 'package:hasna/core/connections/network_info.dart';
import 'package:hasna/core/errors/expentions.dart';
import 'package:hasna/core/errors/failure.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_local.dart';
import 'package:hasna/features/morningazker/data/datasources/morningazker_datasource_remote.dart';
import 'package:hasna/features/morningazker/data/models/morning_model.dart';
import 'package:hasna/features/morningazker/domain/repositories/morning_repositry.dart';

class MorningRepositryImpli implements MorningRepositry {
  final NetworkInfo networkInfo;
  final MorningazkerDatasourceRemote remote;
  final MorningazkerDatasourceLocal local;

  MorningRepositryImpli(this.remote, this.local, {required this.networkInfo});
  
  @override
  Future<Either<MorningModel, Failure>> getMorningAzker({required int page}) async {
    // التحقق من الاتصال بالإنترنت
    if (await networkInfo.isConnected) {
      try {
        // جلب البيانات من الـ API البعيد
        final remoteMorning = await remote.getMorningAzker(page: page);

        // تخزين البيانات في الذاكرة المحلية
        local.cacheMorningzaker(remoteMorning, page.toString());
        
        // إرجاع البيانات في حال نجاح الاتصال
        return left(remoteMorning);
      } on ServerException catch (e) {
        // في حال حدوث خطأ في السيرفر
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        // في حال عدم وجود اتصال بالإنترنت، حاول جلب البيانات من الذاكرة المحلية
        final localMorning = await local.getLastMorningingZaker(page.toString());

        // إذا كانت البيانات المحلية موجودة
        if (localMorning != null) {
          return left(localMorning);
        } else {
          return right(Failure(errMessage: "لا توجد بيانات محلية"));
        }
      } on ServerException catch (e) {
        // في حال فشل في استرجاع البيانات المحلية أيضًا
        return right(Failure(errMessage: e.errorModel.errorMessage));
      }
    }
  }
}
