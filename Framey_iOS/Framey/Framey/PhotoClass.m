//
//  UserPhoto.m
//  Framey1
//
//  Created by Varun Bhartia on 11/4/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//


#import "PhotoClass.h"
#import <Parse/Parse.h>

@implementation PhotoClass

@dynamic imageFile;
@dynamic Thumbnail;
@dynamic title;
@dynamic userId;

+ (NSString *)parseClassName
{
    return @"PhotoClass";
}

+ (void)load {
    [self registerSubclass];
}


@end
