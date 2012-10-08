//
//  NSDictionary+RequestEncoding.h
//  JUSSNetworkKitDemo
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

@interface NSDictionary (RequestEncoding)

-(NSString*) urlEncodedKeyValueString;
-(NSString*) jsonEncodedKeyValueString;
-(NSString*) plistEncodedKeyValueString;
@end
