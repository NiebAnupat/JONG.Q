import 'package:gsheets/gsheets.dart';

class GoogleSheet {
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "jongq-399201",
  "private_key_id": "c801d088e4db13072cb4b2e7ea24f7a8364e14ae",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDvcT9k0KK7eL9c\nUlnfICq2tTsvFLSyiaa/R6cQ7FEidGTuE1CNDBx6gFZCEL0h9OR5eD2Pb69yEZON\nOqJDQCGZY72jK9QR5XxT7ckflTw9tVX/x7YBSVLpXUul8VzSr5Cde3SqWP+ICUrw\nmJNQDNOQZWfGgV/0zndoFylijLDJoz3SQ6XMqS1OyVn/3U7+D1ec5UcqIF88ZG+6\nTs4HGkOIDMeeDWplYfbq5Cbxu4Y8BJc1xLWusos6IUCvntptICygfJFB6DXJhwGR\nPvaORRBAaH01RxaJBsUf0wSjncTRj1++jT9aWVzIpzi2jWood27TSpCPJUHexUn3\nUxgG3g77AgMBAAECggEAReVeJxTMXEN8QPv9Jigir+EpnK3DrdaG6ZGGEGebq54k\nlGbo/bOKYKw0AecW/uGZDGhwN/3XTkoZM4HpOg5vgHJgOlCiAHNoHqvsKR8MTcsw\nhpEK7Uc1P9AvNArIGOyNH5uZS9zdAx4LVT6EyjpkS+N+LrE3jKP0sVsJhq4hMUq4\nQwglMwDba57p+bFRbOv8qgQwr6m9xRTETEIi3op8nlGZZC7wibhnkUGPX2Rhfgbg\nk2BqxashcA2uTitwq7h/lnusubBV6khJXDNGFWr8xdlMAyFTac+/49OStT+v/Syi\nwLvSyJ3jZi8JSqLWes8YaW05xIrVL6iUvopHRZxi+QKBgQD63+C/UDwcI12TgkZY\nBHVCOt4pgCp6jyY/wRvHn7BVQZYMreWIAiXX6ozeD2K6E/mSaYLYfPI/k+mpRH4s\nwow5s2GJHE0Z+eQEF4lryMH5qLBtCqHcAyu7Nqk5pJkdEWZT6Qx38UeDfSFSL/Wf\n/2PKuA7vPqcuULdymyW4LZF3XQKBgQD0VZPObJvDN2gB16tlh3Ps3Spkrlt3Qlu6\nf2Hl/5v9EHeCnl02iNnNzrG1O/PBg0Jen7zFOiEU+Gd9/updhdf52DogoUohKzP7\njiybLmh4VS+FXmZ2Y7eph7M9YgkRZhhSByrL37oo/mnYv006EvMUwfGMSCyxt3xu\n7gjRoe5yNwKBgQDBMM4+BWeEs6dIBLZu6V/zFKoog04y+zGVPvxJiaucu9j1AqUT\nS7Qgxbqc9nQsn109Zosgc3eJhjoV42zWwyqA9KZTk7u8GTeB/y4QFpVp0IGsNtfW\nOYrfrIQ8o4hVXiTS0VCMvP05QI78X3pjL6SFY5/8lN7hR789PkSZxF2U8QKBgQDd\neg0nGo/+3uRqdyKoP6Y3WSsqZFoIuqAHZ5xILfEp7ZlHT2HTIy27PtcbHyMPkHnC\n6Czm4pBGP/0f2sh6ye5CTVwzY8CcXFscdX29lM2h9iXDURSz0CQViipRQ+JQYSk+\ngbyrXTuUGTm8/Xt1XuP1NvBLZskMtvQWYbKgw5Yu9QKBgQCehMSqAM6l0/+ULOEB\nms+sIAAruIr24Cx/EviwcyXiBq8vD1cDD1PxVZTk8qynDKyNxilD67y6+fHsrqR1\nzo/6BEhPqLUWSOuLjVmbLac3WyGISprnU0XJHl8ZoMlX4OM5fdYB9DN/1hL0IxBa\noS/+4n8SU/ZdfZC+bPxBa6KRrg==\n-----END PRIVATE KEY-----\n",
  "client_email": "jongq-flutter@jongq-399201.iam.gserviceaccount.com",
  "client_id": "110633513988705297747",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/jongq-flutter%40jongq-399201.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
''';

  static const _spreadsheetId = "1bb2ffDXjfSMNQDFBm-G8dSrE6MpzTz3jDyIo7M21MuM";
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _adminSheet;
  static Worksheet? _userSheet;
  static Worksheet? _studentSheet;
  static Worksheet? _queueSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _adminSheet = spreadsheet.worksheetByTitle('admin');
    _userSheet = spreadsheet.worksheetByTitle('user');
    _studentSheet = spreadsheet.worksheetByTitle('student');
    _queueSheet = spreadsheet.worksheetByTitle('queue');
  }

  static Future<Worksheet> get adminSheet async {
    if (_adminSheet == null) {
      await init();
    }
    return _adminSheet!;
  }

  static Future<Worksheet> get userSheet async {
    if (_userSheet == null) {
      await init();
    }
    return _userSheet!;
  }

  static Future<Worksheet> get studentSheet async {
    if (_studentSheet == null) {
      await init();
    }
    return _studentSheet!;
  }

  static Future<Worksheet> get queueSheet async {
    if (_queueSheet == null) {
      await init();
    }
    return _queueSheet!;
  }
}
