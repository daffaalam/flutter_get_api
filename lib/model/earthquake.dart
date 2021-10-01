// TODO 02
// Tambahkan kelas model data untuk menampung hasil data dari JSON ke Dart
// Kamu bisa gunakan generator https://app.quicktype.io/ untuk mempermudah pembuatan model

// To parse this JSON data, do
//
//     final earthquake = earthquakeFromJson(jsonString);

import 'dart:convert';

Earthquake earthquakeFromJson(String str) {
  return Earthquake.fromJson(json.decode(str));
}

String earthquakeToJson(Earthquake data) {
  return json.encode(data.toJson());
}

class Earthquake {
  Earthquake({
    this.infogempa,
  });

  Infogempa? infogempa;

  factory Earthquake.fromJson(Map<String, dynamic> json) {
    return Earthquake(
      infogempa: Infogempa.fromJson(json["Infogempa"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Infogempa": infogempa?.toJson(),
    };
  }
}

class Infogempa {
  Infogempa({
    this.gempa,
  });

  Gempa? gempa;

  factory Infogempa.fromJson(Map<String, dynamic> json) {
    return Infogempa(
      gempa: Gempa.fromJson(json["gempa"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "gempa": gempa?.toJson(),
    };
  }
}

class Gempa {
  Gempa({
    this.tanggal,
    this.jam,
    this.dateTime,
    this.coordinates,
    this.lintang,
    this.bujur,
    this.magnitude,
    this.kedalaman,
    this.wilayah,
    this.potensi,
    this.dirasakan,
    this.shakemap,
  });

  String? tanggal;
  String? jam;
  DateTime? dateTime;
  String? coordinates;
  String? lintang;
  String? bujur;
  String? magnitude;
  String? kedalaman;
  String? wilayah;
  String? potensi;
  String? dirasakan;
  String? shakemap;

  factory Gempa.fromJson(Map<String, dynamic> json) {
    return Gempa(
      tanggal: json["Tanggal"],
      jam: json["Jam"],
      dateTime: DateTime.parse(json["DateTime"]),
      coordinates: json["Coordinates"],
      lintang: json["Lintang"],
      bujur: json["Bujur"],
      magnitude: json["Magnitude"],
      kedalaman: json["Kedalaman"],
      wilayah: json["Wilayah"],
      potensi: json["Potensi"],
      dirasakan: json["Dirasakan"],
      shakemap: json["Shakemap"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Tanggal": tanggal,
      "Jam": jam,
      "DateTime": dateTime?.toIso8601String(),
      "Coordinates": coordinates,
      "Lintang": lintang,
      "Bujur": bujur,
      "Magnitude": magnitude,
      "Kedalaman": kedalaman,
      "Wilayah": wilayah,
      "Potensi": potensi,
      "Dirasakan": dirasakan,
      "Shakemap": shakemap,
    };
  }
}
