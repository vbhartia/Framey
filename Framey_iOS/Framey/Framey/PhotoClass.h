//
//  UserPhoto.h
//  Framey1
//
//  Created by Varun Bhartia on 11/4/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import <Parse/Parse.h>

@class PhotoClass;

@interface PhotoClass : PFObject<PFSubclassing>

@property (nonatomic, strong) PFFile *imageFile;
@property (nonatomic, strong) PFFile *Thumbnail;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString *userId;

@end
