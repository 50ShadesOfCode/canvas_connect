import 'package:auto_route/auto_route.dart';
import 'package:chat/chat.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: ChatScreen,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
