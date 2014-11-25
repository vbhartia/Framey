//
//  UserPhotoDataStore.h
//  Framey1
//
//  Created by Varun Bhartia on 11/4/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Parse/Parse.h>


@class PhotoClass;

typedef void (^PhotosCompletionBlock)(NSArray *objects, NSError *error);

@interface PhotoClassDataStore : NSObject

+ (instancetype)sharedInstance;

@property (atomic, strong) NSMutableArray *fetchedPhotos;

@property (atomic, strong) NSMutableDictionary *fetchedPhotoStore;

- (void)fetchPhotos;
- (void)fetchPhotosWithCompletion:(PhotosCompletionBlock)completionBlock;
- (void)addPhoto:(UIImage *)imageToAdd;

@end
