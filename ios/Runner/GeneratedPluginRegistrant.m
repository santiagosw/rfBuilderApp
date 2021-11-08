//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<auto_orientation/AutoOrientationPlugin.h>)
#import <auto_orientation/AutoOrientationPlugin.h>
#else
@import auto_orientation;
#endif

#if __has_include(<flutter_barcode_scanner/SwiftFlutterBarcodeScannerPlugin.h>)
#import <flutter_barcode_scanner/SwiftFlutterBarcodeScannerPlugin.h>
#else
@import flutter_barcode_scanner;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<video_player/FLTVideoPlayerPlugin.h>)
#import <video_player/FLTVideoPlayerPlugin.h>
#else
@import video_player;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AutoOrientationPlugin registerWithRegistrar:[registry registrarForPlugin:@"AutoOrientationPlugin"]];
  [SwiftFlutterBarcodeScannerPlugin registerWithRegistrar:[registry registrarForPlugin:@"SwiftFlutterBarcodeScannerPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTVideoPlayerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTVideoPlayerPlugin"]];
}

@end
