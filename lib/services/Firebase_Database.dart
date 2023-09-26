import 'package:firebase_database/firebase_database.dart';
import 'package:jobfortech/app/modules/Auth/user_model.dart';

class UserRepository {
  final DatabaseReference _userRef = FirebaseDatabase.instance.ref();
  final DatabaseReference _jobroles =
      FirebaseDatabase.instance.ref().child('jobRoles');

  Future<void> addUser(UserModel user, String uid) async {
    Map<String, dynamic> userData = user.toJson();
    _userRef.child('user/${uid}').set(userData);
  }

  Future<void> updateUser(UserModel user, String uid) async {
    Map<String, dynamic> userData = user.toJson();
    _userRef.child('user/${uid}').update(userData);
  }

  Future<void> deleteUser(UserModel user) async {
    _userRef.remove();
  }

  Future<void> getUser(UserModel user) async {
    _userRef.get();
  }
}

class JobRolesRepository {
  final DatabaseReference _jobroles =
      FirebaseDatabase.instance.ref().child('jobRoles');

  Future<DataSnapshot?> getJobRoles() async {
    final snapshot = await _jobroles.get();
    if (snapshot.exists) {
      return snapshot;
    } else {
      return null;
    }
  }
}
