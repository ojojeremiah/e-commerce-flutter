import 'package:cartify/repository/user_repository.dart';
import 'package:cartify/services/app_service_locator.dart';
import 'package:get/get.dart';

class UserContoller extends GetxController {
  var userRepository = getIt.get<UserRepository>();

  var isLoading = true.obs;
  var isPosting = false.obs;
  var isLoggedIn = false.obs;
  var response = ''.obs;
  void oninit() {
    super.onInit();
  }

  // Future createNewAccount(
  //     {required String email,
  //     required String password,
  //     required String passwordConfirmaton,
  //       required String accountType,
  //       required bool accountActive,
  //       required String imageUrl,
  //     required String username,
  //     required String phoneNumber,
  //     required String firstName,
  //     required String lastName,
  //     required bool tosAccepted,
  //     required bool policyAccepted}) async {
  //   try {
  //     isPosting(true);
  //     var result = await userRepository.createAccount(
  //       accountActive: true,
  //       accountType: 'Sender',
  //       imageUrl:
  //           'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=826&t=st=1679906108~exp=1679906708~hmac=59848b1ebd30cfbc20018d5723beeb247556f9d2556966c17e30d7f1236144c8',
  //       email: email,
  //       password: password,
  //       policyAccepted: policyAccepted,
  //       tosAccepted: tosAccepted,
  //       passwordConfirmation: passwordConfirmaton,
  //       username: username,
  //       phoneNumber: phoneNumber,
  //       firstName: firstName,
  //       lastName: lastName,
  //     );
  //       if (result.email!.isNotEmpty) {
  //         userData.value = result;

  //         return true;
  //       } else {
  //         return false;
  //       }
  //   } finally {
  //     isPosting(false);
  //   }
  // }

  Future<String> authenticate(
      {required String username, required String password}) async {
    isPosting(true);
    final result =
        await userRepository.signIn(password: password, username: username);
    isPosting(false);
    return result!;
  }

  // Future<void> requestPhoneOtp({required String phoneNumber}) async {
  //   try {
  //     isPosting(true);
  //     await userRepository.requestPhoneOtp(phoneNumber: phoneNumber);
  //   } finally {
  //     isPosting(false);
  //   }
  // }

  // Future<bool> validatePhoneOtp({
  //   required String phoneNumber,
  //   required int otp,
  // }) async {
  //   try {
  //     isPosting(true);
  //     var result = await userRepository.validatePhoneOtp(
  //         phoneNumber: phoneNumber, otp: otp);
  //     return result;
  //   } finally {
  //     isPosting(false);
  //   }
  // }

  // Future<bool> updateProfile({
  //   required String fiirstName,
  //   required String lastName,
  // }) async {
  //   try {
  //     isPosting(true);
  //     var result = await userRepository.updateProfile(
  //         firstName: fiirstName, lastname: lastName);
  //     return result;
  //   } finally {
  //     isPosting(false);
  //   }
  // }
}
