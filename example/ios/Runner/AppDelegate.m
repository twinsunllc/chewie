#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  
  FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* criticChannel = [FlutterMethodChannel
                                           methodChannelWithName:@"chewie"
                                           binaryMessenger:controller];
    
    __weak typeof(self) weakSelf = self;
    [criticChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"setIOSLandscapeOrienation" isEqualToString:call.method]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationLandscapeRight) forKey:@"orientation"];
            result(@"Successfully Set Landscape Orientation");
        } else if ([@"setIOSPortraitOrienation" isEqualToString:call.method]) {
            [[UIDevice currentDevice] setValue:@(UIInterfaceOrientationPortrait) forKey:@"orientation"];
            result(@"Successfully Portrait Orientation");
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
