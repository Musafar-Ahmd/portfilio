import 'package:flutter/material.dart';
import 'package:portfilio/view_model/project_view_model.dart';
import 'package:portfilio/views/main_dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final PageStorageBucket bucket = PageStorageBucket();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectsViewModel()),
      ],
      child: MaterialApp(
        title: 'My portfilio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageStorage(
          bucket: bucket,
          child: const MainDashBoard(),
        ),
      ),
    );
  }
}
