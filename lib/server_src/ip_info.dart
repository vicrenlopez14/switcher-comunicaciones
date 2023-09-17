import 'package:get_ip_address/get_ip_address.dart';

var ipAddress = IpAddress().getIpAddress();

Future<String?> get localIp async => await ipAddress;