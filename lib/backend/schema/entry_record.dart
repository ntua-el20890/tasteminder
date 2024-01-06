import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EntryRecord extends FirestoreRecord {
  EntryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CreationName" field.
  String? _creationName;
  String get creationName => _creationName ?? '';
  bool hasCreationName() => _creationName != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Image" field.
  List<String>? _image;
  List<String> get image => _image ?? const [];
  bool hasImage() => _image != null;

  // "Video" field.
  List<String>? _video;
  List<String> get video => _video ?? const [];
  bool hasVideo() => _video != null;

  // "DateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "userid" field.
  int? _userid;
  int get userid => _userid ?? 0;
  bool hasUserid() => _userid != null;

  // "Recipe" field.
  String? _recipe;
  String get recipe => _recipe ?? '';
  bool hasRecipe() => _recipe != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "ingredients" field.
  String? _ingredients;
  String get ingredients => _ingredients ?? '';
  bool hasIngredients() => _ingredients != null;

  // "SatisfactionLvl" field.
  double? _satisfactionLvl;
  double get satisfactionLvl => _satisfactionLvl ?? 0.0;
  bool hasSatisfactionLvl() => _satisfactionLvl != null;

  // "HungerLvl" field.
  double? _hungerLvl;
  double get hungerLvl => _hungerLvl ?? 0.0;
  bool hasHungerLvl() => _hungerLvl != null;

  // "ComfortLvl" field.
  double? _comfortLvl;
  double get comfortLvl => _comfortLvl ?? 0.0;
  bool hasComfortLvl() => _comfortLvl != null;

  // "ConveniencLvl" field.
  double? _conveniencLvl;
  double get conveniencLvl => _conveniencLvl ?? 0.0;
  bool hasConveniencLvl() => _conveniencLvl != null;

  // "OverallLvl" field.
  double? _overallLvl;
  double get overallLvl => _overallLvl ?? 0.0;
  bool hasOverallLvl() => _overallLvl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _creationName = snapshotData['CreationName'] as String?;
    _description = snapshotData['Description'] as String?;
    _image = getDataList(snapshotData['Image']);
    _video = getDataList(snapshotData['Video']);
    _dateCreated = snapshotData['DateCreated'] as DateTime?;
    _userid = castToType<int>(snapshotData['userid']);
    _recipe = snapshotData['Recipe'] as String?;
    _audio = snapshotData['audio'] as String?;
    _tags = snapshotData['tags'] as String?;
    _ingredients = snapshotData['ingredients'] as String?;
    _satisfactionLvl = castToType<double>(snapshotData['SatisfactionLvl']);
    _hungerLvl = castToType<double>(snapshotData['HungerLvl']);
    _comfortLvl = castToType<double>(snapshotData['ComfortLvl']);
    _conveniencLvl = castToType<double>(snapshotData['ConveniencLvl']);
    _overallLvl = castToType<double>(snapshotData['OverallLvl']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('entry')
          : FirebaseFirestore.instance.collectionGroup('entry');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('entry').doc();

  static Stream<EntryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EntryRecord.fromSnapshot(s));

  static Future<EntryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EntryRecord.fromSnapshot(s));

  static EntryRecord fromSnapshot(DocumentSnapshot snapshot) => EntryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EntryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EntryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EntryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EntryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEntryRecordData({
  String? creationName,
  String? description,
  DateTime? dateCreated,
  int? userid,
  String? recipe,
  String? audio,
  String? tags,
  String? ingredients,
  double? satisfactionLvl,
  double? hungerLvl,
  double? comfortLvl,
  double? conveniencLvl,
  double? overallLvl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CreationName': creationName,
      'Description': description,
      'DateCreated': dateCreated,
      'userid': userid,
      'Recipe': recipe,
      'audio': audio,
      'tags': tags,
      'ingredients': ingredients,
      'SatisfactionLvl': satisfactionLvl,
      'HungerLvl': hungerLvl,
      'ComfortLvl': comfortLvl,
      'ConveniencLvl': conveniencLvl,
      'OverallLvl': overallLvl,
    }.withoutNulls,
  );

  return firestoreData;
}

class EntryRecordDocumentEquality implements Equality<EntryRecord> {
  const EntryRecordDocumentEquality();

  @override
  bool equals(EntryRecord? e1, EntryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.creationName == e2?.creationName &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.image, e2?.image) &&
        listEquality.equals(e1?.video, e2?.video) &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.userid == e2?.userid &&
        e1?.recipe == e2?.recipe &&
        e1?.audio == e2?.audio &&
        e1?.tags == e2?.tags &&
        e1?.ingredients == e2?.ingredients &&
        e1?.satisfactionLvl == e2?.satisfactionLvl &&
        e1?.hungerLvl == e2?.hungerLvl &&
        e1?.comfortLvl == e2?.comfortLvl &&
        e1?.conveniencLvl == e2?.conveniencLvl &&
        e1?.overallLvl == e2?.overallLvl;
  }

  @override
  int hash(EntryRecord? e) => const ListEquality().hash([
        e?.creationName,
        e?.description,
        e?.image,
        e?.video,
        e?.dateCreated,
        e?.userid,
        e?.recipe,
        e?.audio,
        e?.tags,
        e?.ingredients,
        e?.satisfactionLvl,
        e?.hungerLvl,
        e?.comfortLvl,
        e?.conveniencLvl,
        e?.overallLvl
      ]);

  @override
  bool isValidKey(Object? o) => o is EntryRecord;
}
