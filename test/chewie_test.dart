import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chewie/chewie.dart';

void main() {
  const MethodChannel channel = MethodChannel('chewie');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Chewie.platformVersion, '42');
  });
}
