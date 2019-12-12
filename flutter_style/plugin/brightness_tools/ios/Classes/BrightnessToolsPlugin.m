#import "BrightnessToolsPlugin.h"
#import <brightness_tools/brightness_tools-Swift.h>

@implementation BrightnessToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBrightnessToolsPlugin registerWithRegistrar:registrar];
}
@end
