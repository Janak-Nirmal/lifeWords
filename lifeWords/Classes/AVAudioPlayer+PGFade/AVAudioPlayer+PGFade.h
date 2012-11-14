//
//  AVAudioPlayer+PGFade.h
//
//  Created by JustaLiar on 14/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

typedef void (^AVAudioPlayerFadeCompleteBlock)();


@interface AVAudioPlayer (PGFade)

@property (nonatomic,readonly) BOOL  fading;
@property (nonatomic,readonly) float fadeTargetVolume;

- (void) fadeToVolume:(float)volume duration:(NSTimeInterval)duration;
- (void) fadeToVolume:(float)volume duration:(NSTimeInterval)duration completion:(AVAudioPlayerFadeCompleteBlock)completion;

- (void) stopWithFadeDuration:(NSTimeInterval)duration;
- (void) playWithFadeDuration:(NSTimeInterval)duration;
- (void) playWithFadeDuration:(NSTimeInterval)duration atTime:(NSTimeInterval)time;
- (void) playWithFadeDurationWithDelay:(NSTimeInterval)duration delay:(NSTimeInterval)time;
@end
