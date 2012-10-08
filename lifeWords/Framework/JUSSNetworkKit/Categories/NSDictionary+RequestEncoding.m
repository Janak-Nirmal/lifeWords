//
//  NSDictionary+RequestEncoding.m
//  JUSSNetworkKitDemo
//
//  Created by JustaLiar on 08/10/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "JUSSNetworkKit.h"

@implementation NSDictionary (RequestEncoding)

-(NSString*) urlEncodedKeyValueString {
  
  NSMutableString *string = [NSMutableString string];
  for (NSString *key in self) {
    
    NSObject *value = [self valueForKey:key];
    if([value isKindOfClass:[NSString class]])
      [string appendFormat:@"%@=%@&", [key urlEncodedString], [((NSString*)value) urlEncodedString]];
    else
      [string appendFormat:@"%@=%@&", [key urlEncodedString], value];
  }
  
  if([string length] > 0)
    [string deleteCharactersInRange:NSMakeRange([string length] - 1, 1)];
  
  return string;    
}


-(NSString*) jsonEncodedKeyValueString {
  
  if(NSClassFromString(@"NSJSONSerialization")) {
    NSError *error = nil;
    NSData *data = [NSClassFromString(@"NSJSONSerialization") dataWithJSONObject:self
                                                                         options:0 // non-pretty printing
                                                                           error:&error];
    if(error)
      DLog(@"JSON Parsing Error: %@", error);
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  } else {
    DLog(@"JSON encoder missing, falling back to URL encoding");
    return [self urlEncodedKeyValueString];
  }
}


-(NSString*) plistEncodedKeyValueString {
  
  NSError *error = nil;    
  NSData *data = [NSPropertyListSerialization dataWithPropertyList:self 
                                                            format:NSPropertyListXMLFormat_v1_0 
                                                           options:0 error:&error];
  if(error)
    DLog(@"JSON Parsing Error: %@", error);
  
  return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];    
}

@end
