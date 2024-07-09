import 'package:intl/intl.dart';

import 'enums.dart';

extension SortByExtensions on SortBy {
  String toStrSortBy() {
    switch (this) {
      case SortBy.popularity:
        return 'popularity';
      case SortBy.publishedAt:
        return 'publishedAt';
    }
  }
}

extension SortByStrExtensions on String {
  SortBy toSortBy() {
    switch (toLowerCase()) {
      case 'popularity':
        return SortBy.popularity;
      case 'publishedAt':
        return SortBy.publishedAt;
      default:
        return SortBy.popularity;
    }
  }
}

extension FanCompaniesExtensions on FanCompany {
  String toStrName() {
    switch (this) {
      case FanCompany.apple:
        return 'Apple';
      case FanCompany.google:
        return 'Google';
      case FanCompany.microsoft:
        return 'Microsoft';
      case FanCompany.tesla:
        return 'Tesla';
    }
  }
}

extension FanCompaniesStrExtensions on String {
  FanCompany toFanCompany() {
    switch (toLowerCase()) {
      case 'apple':
        return FanCompany.apple;
      case 'google':
        return FanCompany.google;
      case 'microsoft':
        return FanCompany.microsoft;
      case 'tesla':
        return FanCompany.tesla;
      default:
        return FanCompany.apple;
    }
  }
}

extension DateTimeExtension on DateTime {
  String get toStrDate => "$year-$month-$day";
}

extension TextStrExtension on String {
  String get clearText => Bidi.stripHtmlIfNeeded(this);
}
