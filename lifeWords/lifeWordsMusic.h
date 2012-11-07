//
//  lifeWordsMusic.h
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lifeWordsMusic : NSObject {
    
}

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *name;

+ (id)musicOfCategory:(NSString*)category name:(NSString*)name;

@end
