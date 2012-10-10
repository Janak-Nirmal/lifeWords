//
//  lifeWordsNetworkOperations.m
//  lifeWords
//
//  Created by JustaLiar on 10/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsNetworkOperations.h"

@implementation lifeWordsNetworkOperations
- (JUSSNetworkOperation *) basicAuthentication:(NSString *)userEmail andUserPassword:(NSString *)userPassword
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:userEmail forKey:@"useremail"];
    [params setObject:userPassword forKey:@"password"];
    
    JUSSNetworkOperation *op = [self operationWithPath:@"auth.php" params:params httpMethod:@"POST"];
    
    [self enqueueOperation:op];
    
    return op;
}

- (JUSSNetworkOperation *) fetchUserInfo:(NSString *)userEmail
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:userEmail forKey:@"useremail"];
    JUSSNetworkOperation *op = [self operationWithPath:@"fetchUserInfo.php" params:params httpMethod:@"POST"];
    [self enqueueOperation:op];
    return op;
}

- (JUSSNetworkOperation *) signUp: (NSString *)email andPassword: (NSString *)password andNickname: (NSString*)nickname withProfilePhoto:(NSData *) photo
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:email forKey:@"email"];
    [params setObject:password forKey:@"password"];
    [params setObject:nickname forKey:@"nickname"];
    
    JUSSNetworkOperation *op = [self operationWithPath:@"signup.php" params:params httpMethod:@"POST"];
    
    if (photo != nil) {
        [op addData:photo forKey:@"upload_file" mimeType:@"image/jpeg" fileName:@"user_profile_photo.jpg"];
    }
    
    
    
    [self enqueueOperation:op];
    
    return op;
}

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
