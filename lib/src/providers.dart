import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:switcher_comunicaciones/src/App/view_models/live_streaming_view_model.dart';
import 'package:switcher_comunicaciones/src/App/view_models/welcome_screen_view_model.dart';

List<SingleChildWidget> providers () =>[
  ChangeNotifierProvider(create: (_) => WelcomeScreenViewModel()),
  ChangeNotifierProvider(create: (_) => LiveStreamingViewModel()),
];