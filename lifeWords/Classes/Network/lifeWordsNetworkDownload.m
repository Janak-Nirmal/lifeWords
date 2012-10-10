//
//  lifeWordsNetworkDownload.m
//  lifeWords
//
//  Created by JustaLiar on 10/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsNetworkDownload.h"

@implementation lifeWordsNetworkDownload
- (JUSSNetworkOperation *) downloadFile:(NSString *)remoteURL toFile:(NSString *)filePath
{
    JUSSNetworkOperation *op = [self operationWithURLString:remoteURL
                                                   params:nil
                                               httpMethod:@"GET"];
    
    [op addDownloadStream:[NSOutputStream outputStreamToFileAtPath:filePath append:YES]];
    [self enqueueOperation:op];
    return op;
}
@end
