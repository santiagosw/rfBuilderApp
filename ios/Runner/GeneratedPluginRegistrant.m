//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<dialogflow_grpc/DialogflowGrpcPlugin.h>)
#import <dialogflow_grpc/DialogflowGrpcPlugin.h>
#else
@import dialogflow_grpc;
#endif

#if __has_include(<flutter_barcode_scanner/SwiftFlutterBarcodeScannerPlugin.h>)
#import <flutter_barcode_scanner/SwiftFlutterBarcodeScannerPlugin.h>
#else
@import flutter_barcode_scanner;
#endif

#if __has_include(<kommunicate_flutter/KommunicateFlutterPlugin.h>)
#import <kommunicate_flutter/KommunicateFlutterPlugin.h>
#else
@import kommunicate_flutter;
#endif

#if __has_include(<path_provider_ios/FLTPathProviderPlugin.h>)
#import <path_provider_ios/FLTPathProviderPlugin.h>
#else
@import path_provider_ios;
#endif

#if __has_include(<permission_handler/PermissionHandlerPlugin.h>)
#import <permission_handler/PermissionHandlerPlugin.h>
#else
@import permission_handler;
#endif

#if __has_include(<shared_preferences_ios/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences_ios/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences_ios;
#endif

#if __has_include(<sound_stream/SoundStreamPlugin.h>)
#import <sound_stream/SoundStreamPlugin.h>
#else
@import sound_stream;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [DialogflowGrpcPlugin registerWithRegistrar:[registry registrarForPlugin:@"DialogflowGrpcPlugin"]];
  [SwiftFlutterBarcodeScannerPlugin registerWithRegistrar:[registry registrarForPlugin:@"SwiftFlutterBarcodeScannerPlugin"]];
  [KommunicateFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"KommunicateFlutterPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [PermissionHandlerPlugin registerWithRegistrar:[registry registrarForPlugin:@"PermissionHandlerPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
  [SoundStreamPlugin registerWithRegistrar:[registry registrarForPlugin:@"SoundStreamPlugin"]];
}

@end
