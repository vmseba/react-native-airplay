//
//  AirPlayButtonBridge.m
//  hybridlockerapp
//
//  Created by Guillermo Anaya on 6/14/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>


@interface RCT_EXTERN_MODULE(AirPlayButton, RCTViewManager)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end