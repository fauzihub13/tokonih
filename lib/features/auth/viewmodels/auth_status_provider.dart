import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tokonih/core/helper/auth_local_helper.dart';

final authStatusProvider = FutureProvider<bool>((ref) async {
  return await AuthLocalHelper().isAuthDataExist();
});
