//
//  lifeWordsMusic.m
//  lifeWords
//
//  Created by JustaLiar on 7/11/12.
//  Copyright (c) 2012 simpleDudes. All rights reserved.
//

#import "lifeWordsMusic.h"

@implementation lifeWordsMusic

+(id)musicOfCategory:(NSString *)category name:(NSString *)name
{
    lifeWordsMusic *newMusic = [[self alloc] init];
    [newMusic setCategory:category];
    [newMusic setName:name];
    return newMusic;
}

@end
