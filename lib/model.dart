// TODO 02 - Tambahkan kelas model data untuk menampung hasil data dari JSON ke Dart
// Kamu bisa gunakan generator https://app.quicktype.io/ untuk mempermudah pembuatan model

// To parse this JSON data, do
//
//     final ipApi = ipApiFromJson(jsonString);

import 'dart:convert';

IpApi ipApiFromJson(String str) => IpApi.fromJson(json.decode(str));

String ipApiToJson(IpApi data) => json.encode(data.toJson());

class IpApi {
    String ip;
    String city;
    String region;
    String regionCode;
    String country;
    String countryName;
    String continentCode;
    bool inEu;
    String postal;
    double latitude;
    double longitude;
    String timezone;
    String utcOffset;
    String countryCallingCode;
    String currency;
    String languages;
    String asn;
    String org;

    IpApi({
        this.ip,
        this.city,
        this.region,
        this.regionCode,
        this.country,
        this.countryName,
        this.continentCode,
        this.inEu,
        this.postal,
        this.latitude,
        this.longitude,
        this.timezone,
        this.utcOffset,
        this.countryCallingCode,
        this.currency,
        this.languages,
        this.asn,
        this.org,
    });

    factory IpApi.fromJson(Map<String, dynamic> json) => IpApi(
        ip: json["ip"],
        city: json["city"],
        region: json["region"],
        regionCode: json["region_code"],
        country: json["country"],
        countryName: json["country_name"],
        continentCode: json["continent_code"],
        inEu: json["in_eu"],
        postal: json["postal"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        timezone: json["timezone"],
        utcOffset: json["utc_offset"],
        countryCallingCode: json["country_calling_code"],
        currency: json["currency"],
        languages: json["languages"],
        asn: json["asn"],
        org: json["org"],
    );

    Map<String, dynamic> toJson() => {
        "ip": ip,
        "city": city,
        "region": region,
        "region_code": regionCode,
        "country": country,
        "country_name": countryName,
        "continent_code": continentCode,
        "in_eu": inEu,
        "postal": postal,
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "utc_offset": utcOffset,
        "country_calling_code": countryCallingCode,
        "currency": currency,
        "languages": languages,
        "asn": asn,
        "org": org,
    };
}

