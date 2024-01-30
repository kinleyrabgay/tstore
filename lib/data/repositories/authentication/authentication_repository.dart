import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tstore/data/repositories/authentication/user/user_repository.dart';
import 'package:tstore/features/authentication/screens/login/login.dart';
import 'package:tstore/features/authentication/screens/onboarding/onboarding.dart';
import 'package:tstore/features/authentication/screens/signup/verify_email.dart';
import 'package:tstore/navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  // Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Function to show relevant screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      if (kDebugMode) {
        print("============ GET STOREAGE ===============");
        print(deviceStorage.read('isFirstTime'));
      }

      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
    // Local Storage
  }

  /// ----------------------------------------- Email & Password Sign-in --------------------------------
  // [EmailAuthentication] -Sign-in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // [EmailAuthentication] -Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // [EmailAuthentication] -Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // [ReAuthenticate] -ReAuthenticate User
  Future<void> reAuthenticateEmailAndPasswordUser(
      String email, String password) async {
    try {
      // Create a credentials
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      // ReAuth
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // [MailVerification] -Verification User
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // [GoogleAuthentication] -Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the auth flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;
      // Create a new credentials
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredentials
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      // throw 'Something went wrong, Please try again';
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
  // [FacebookAuthentication] -Facebook

  /// --------------------------------------- ./end federated indentity & social sign-in -----------------
  // [LogoutUser] - Logout
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Delete User -Remove user auth & firebase account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecords(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw 'Error $e.code';
    } on FirebaseException catch (e) {
      // throw TFirebaseException(e.code).message;
      throw 'Error $e';
    } on FormatException catch (_) {
      // throw const TFormatException();
      throw 'Error!';
    } on PlatformException catch (e) {
      // throw TargetPlatformException(e.code).message;
      throw 'Error $e';
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // uploadUserProfilePicture() 
  uploadUserProfilePicture() async {
    
  }
}
