import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntriesRecord extends FirestoreRecord {
  EntriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  bool hasPhoto() => _photo != null;

  // "video" field.
  List<String>? _video;
  List<String> get video => _video ?? const [];
  bool hasVideo() => _video != null;

  // "audio" field.
  List<String>? _audio;
  List<String> get audio => _audio ?? const [];
  bool hasAudio() => _audio != null;

  // "satisfaction" field.
  int? _satisfaction;
  int get satisfaction => _satisfaction ?? 0;
  bool hasSatisfaction() => _satisfaction != null;

  // "hunger" field.
  int? _hunger;
  int get hunger => _hunger ?? 0;
  bool hasHunger() => _hunger != null;

  // "comfort" field.
  int? _comfort;
  int get comfort => _comfort ?? 0;
  bool hasComfort() => _comfort != null;

  // "convenience" field.
  int? _convenience;
  int get convenience => _convenience ?? 0;
  bool hasConvenience() => _convenience != null;

  // "overall" field.
  int? _overall;
  int get overall => _overall ?? 0;
  bool hasOverall() => _overall != null;

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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _photo = getDataList(snapshotData['photo']);
    _video = getDataList(snapshotData['video']);
    _audio = getDataList(snapshotData['audio']);
    _satisfaction = castToType<int>(snapshotData['satisfaction']);
    _hunger = castToType<int>(snapshotData['hunger']);
    _comfort = castToType<int>(snapshotData['comfort']);
    _convenience = castToType<int>(snapshotData['convenience']);
    _overall = castToType<int>(snapshotData['overall']);
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('entries');

  static Stream<EntriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntriesRecord.fromSnapshot(s));

  static Future<EntriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntriesRecord.fromSnapshot(s));

  static EntriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EntriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntriesRecordData({
  String? name,
  String? description,
  DateTime? createdAt,
  int? satisfaction,
  int? hunger,
  int? comfort,
  int? convenience,
  int? overall,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'created_at': createdAt,
      'satisfaction': satisfaction,
      'hunger': hunger,
      'comfort': comfort,
      'convenience': convenience,
      'overall': overall,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntriesRecordDocumentEquality implements Equality<EntriesRecord> {
  const EntriesRecordDocumentEquality();

  @override
  bool equals(EntriesRecord? e1, EntriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        listEquality.equals(e1?.photo, e2?.photo) &&
        listEquality.equals(e1?.video, e2?.video) &&
        listEquality.equals(e1?.audio, e2?.audio) &&
        e1?.satisfaction == e2?.satisfaction &&
        e1?.hunger == e2?.hunger &&
        e1?.comfort == e2?.comfort &&
        e1?.convenience == e2?.convenience &&
        e1?.overall == e2?.overall &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(EntriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.createdAt,
        e?.tags,
        e?.photo,
        e?.video,
        e?.audio,
        e?.satisfaction,
        e?.hunger,
        e?.comfort,
        e?.convenience,
        e?.overall,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is EntriesRecord;
}
