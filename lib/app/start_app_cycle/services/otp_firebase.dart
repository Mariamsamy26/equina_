import 'package:firebase_auth/firebase_auth.dart';

class firebase {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber({
    required Function(String) onCodeSent,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(String) onCodeAutoRetrievalTimeout,
    required String smsCode,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+20 12 74060087',
      codeSent: (String verificationId, int? resendToken) async {
        onCodeSent(verificationId);
        final credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        await _auth.signInWithCredential(credential);
      },

      verificationCompleted: onVerificationCompleted,
      verificationFailed: onVerificationFailed,
      codeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }
}
