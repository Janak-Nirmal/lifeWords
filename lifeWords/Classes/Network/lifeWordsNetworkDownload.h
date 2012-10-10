//
//  lifeWordsNetworkDownload.h
//  lifeWords
//
//  Created by JustaLiar on 10/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "JUSSNetworkEngine.h"

@interface lifeWordsNetworkDownload : JUSSNetworkEngine
- (JUSSNetworkOperation *) downloadFile:(NSString *)remoteURL toFile:(NSString *)filePath;
@end
