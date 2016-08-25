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
-(void) videoRecordingComplete: (NSURL*)videoURL;
-(void) videoRecordingFailed;
-(void) snapshotTaken:(NSData*)snapshotData;
-(void) snapshotFailed;
@end
#endif /* AAPLCameraVCDelegate_h */
