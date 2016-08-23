//
//  AAPLCameraVCDelegate.h
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/22/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//
#include <UIKit/UIKit.h>
#ifndef AAPLCameraVCDelegate_h
#define AAPLCameraVCDelegate_h
@protocol AAPLCameraVCDelegate <NSObject>
-(void) shouldEnableRecordUI:(BOOL)enable;
-(void) shouldEnableCameraUI:(BOOL)enable;
-(void) canStartRecording;
-(void) recordingHasStarted;
@end
#endif /* AAPLCameraVCDelegate_h */
