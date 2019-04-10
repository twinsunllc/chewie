#import "ChewiePlugin.h"

@implementation ChewiePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"chewie"
            binaryMessenger:[registrar messenger]];
  ChewiePlugin* instance = [[ChewiePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"setIOSLandscapeOrienation" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
        result(@"Successfully Set Landscape Orientation");
    } else if ([@"setIOSPortraitOrienation" isEqualToString:call.method]) {
        [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
        result(@"Successfully Portrait Orientation");
    } else {
        result(FlutterMethodNotImplemented);
    }
}

@end
