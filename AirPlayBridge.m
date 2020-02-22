//
//  AirPlayBridge.m
//  hybridlockerapp
//
//  Created by Guillermo Anaya on 6/14/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTViewManager.h>



@interface RCT_EXTERN_MODULE(AirPlay, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}
RCT_EXTERN_METHOD(startScan)
RCT_EXTERN_METHOD(isAlredyConnected:(RCTResponseSenderBlock)callback)

@end