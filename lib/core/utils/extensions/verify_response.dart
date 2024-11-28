
import '../../../app/data/models/app_error.dart';

verifyResponse(_) {
  if (_.runtimeType != AppError) {
    return true;
  } else {
    return false;
  }
}
