//
//  WaveformImageVew.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface WaveformImageView : UIImageView{
    
}
-(id)initWithUrl:(NSURL*)url;
- (NSData *) renderPNGAudioPictogramLogForAssett:(AVURLAsset *)songAsset;

@end