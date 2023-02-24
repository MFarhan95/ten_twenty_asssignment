import 'package:provider/provider.dart';
import 'package:ten_twenty_asssignment/screens/dashboard/upcoming_provider/upcoming_provider.dart';
import 'package:ten_twenty_asssignment/screens/watch/genre_provider/genre_provider.dart';

final multiProviders = [
  ///Dashboard screens for Upcoming
  ChangeNotifierProvider<UpcomingProvider>(
    create: (_) => UpcomingProvider(),
    lazy: true,
  ),
  ///Watch screens for Upcoming
  ChangeNotifierProvider<GenreProvider>(
    create: (_) => GenreProvider(),
    lazy: true,
  ),
];