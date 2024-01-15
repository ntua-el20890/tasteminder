import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "cover_photo_url" field.
  String? _coverPhotoUrl;
  String get coverPhotoUrl => _coverPhotoUrl ?? '';
  bool hasCoverPhotoUrl() => _coverPhotoUrl != null;

  // "level" field.
  int? _level;
  int get level => _level ?? 0;
  bool hasLevel() => _level != null;

  // "credit" field.
  int? _credit;
  int get credit => _credit ?? 0;
  bool hasCredit() => _credit != null;

  // "totalexp" field.
  double? _totalexp;
  double get totalexp => _totalexp ?? 0.0;
  bool hasTotalexp() => _totalexp != null;

  // "totalimages" field.
  int? _totalimages;
  int get totalimages => _totalimages ?? 0;
  bool hasTotalimages() => _totalimages != null;

  // "totalvideos" field.
  int? _totalvideos;
  int get totalvideos => _totalvideos ?? 0;
  bool hasTotalvideos() => _totalvideos != null;

  // "totalaudio" field.
  int? _totalaudio;
  int get totalaudio => _totalaudio ?? 0;
  bool hasTotalaudio() => _totalaudio != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _coverPhotoUrl = snapshotData['cover_photo_url'] as String?;
    _level = castToType<int>(snapshotData['level']);
    _credit = castToType<int>(snapshotData['credit']);
    _totalexp = castToType<double>(snapshotData['totalexp']);
    _totalimages = castToType<int>(snapshotData['totalimages']);
    _totalvideos = castToType<int>(snapshotData['totalvideos']);
    _totalaudio = castToType<int>(snapshotData['totalaudio']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  DateTime? editedTime,
  String? bio,
  String? phoneNumber,
  String? coverPhotoUrl,
  int? level,
  int? credit,
  double? totalexp,
  int? totalimages,
  int? totalvideos,
  int? totalaudio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'edited_time': editedTime,
      'bio': bio,
      'phone_number': phoneNumber,
      'cover_photo_url': coverPhotoUrl,
      'level': level,
      'credit': credit,
      'totalexp': totalexp,
      'totalimages': totalimages,
      'totalvideos': totalvideos,
      'totalaudio': totalaudio,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.coverPhotoUrl == e2?.coverPhotoUrl &&
        e1?.level == e2?.level &&
        e1?.credit == e2?.credit &&
        e1?.totalexp == e2?.totalexp &&
        e1?.totalimages == e2?.totalimages &&
        e1?.totalvideos == e2?.totalvideos &&
        e1?.totalaudio == e2?.totalaudio;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.editedTime,
        e?.bio,
        e?.phoneNumber,
        e?.coverPhotoUrl,
        e?.level,
        e?.credit,
        e?.totalexp,
        e?.totalimages,
        e?.totalvideos,
        e?.totalaudio
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
