import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? progressToNextLvl(
  double? currentXP,
  int? previousLvlXP,
  int? nextLvlXP,
) {
  // give me xp progress for the user until the next level
  if (currentXP == null || previousLvlXP == null || nextLvlXP == null) {
    return null;
  }
  if (currentXP >= nextLvlXP) {
    return 1.0;
  }
  if (currentXP <= previousLvlXP) {
    return 0.0;
  }
  return (currentXP - previousLvlXP) / (nextLvlXP - previousLvlXP);
}
