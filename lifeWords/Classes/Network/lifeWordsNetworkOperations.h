//
//  lifeWordsNetworkOperations.h
//  lifeWords
//
//  Created by JustaLiar on 10/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "JUSSNetworkEngine.h"

@interface lifeWordsNetworkOperations : JUSSNetworkEngine
- (JUSSNetworkOperation *) basicAuthentication: (NSString *)userEmail andUserPassword: (NSString *)userPassword;
- (JUSSNetworkOperation *) fetchUserInfo: (NSString *)userEmail;
- (JUSSNetworkOperation *) signUp: (NSString *)email andPassword: (NSString *)password andNickname: (NSString*)nickname withProfilePhoto:(NSData *) photo;
- (JUSSNetworkOperation *) downloadFile:(NSString *)remoteURL toFile:(NSString *)filePath;
@end
