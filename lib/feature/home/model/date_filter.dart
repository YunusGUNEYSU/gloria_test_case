// ignore_for_file: public_member_api_docs, sort_constructors_first

enum DateSelect {
  empty(''),
  yesterday('Yesterday'),
  lastWeek('Last week');

  final String dateName;
  const DateSelect(this.dateName);
}
