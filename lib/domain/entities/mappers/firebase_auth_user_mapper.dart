import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:teams/domain/entities/user.dart' as app;

class FirebaseAuthUserMapper {
  static app.User map(firebase.User user) {
    return app.User(
      id: user.uid,
      email: user.email,
      phone: user.phoneNumber,
    );
  }
}
