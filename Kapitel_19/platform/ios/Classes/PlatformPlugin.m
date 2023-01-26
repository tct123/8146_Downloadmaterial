#import "PlatformPlugin.h"
#if __has_include(<platform/platform-Swift.h>)
#import <platform/platform-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "platform-Swift.h"
#endif

@implementation PlatformPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPlatformPlugin registerWithRegistrar:registrar];
}
@end
