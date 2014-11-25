


#import "PhotoClassDataStore.h"
#import <Parse/Parse.h>
#import "PhotoClass.h"


@interface PhotoClassDataStore ()
@end

@implementation PhotoClassDataStore


- (instancetype)init
{
    
    self.fetchedPhotoStore = [NSMutableDictionary dictionary];
    
    self = [super init];
    if (self){
        
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static PhotoClassDataStore *dataStore = nil;
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataStore = [[PhotoClassDataStore alloc] init];
    });
    return dataStore;
}


- (void)fetchPhotosWithCompletion:(PhotosCompletionBlock)completionBlock
{
    
    PFQuery *query = [PhotoClass query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
        
        self.fetchedPhotos = objects;
        completionBlock(objects,error);
    
    }];

}

- (void)fetchPhotos
{
    
    PFQuery *query = [PhotoClass query];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error)
    {
         self.fetchedPhotos = objects;
         
         //NSLog(@"Getting Photos %@", objects);
         /*
         for(UserPhoto *object in objects)
         {
         
              addObject:object];
         }
          */
         NSLog(@"Fetch Photos %@", ((PhotoClass *)self.fetchedPhotos[0]).imageFile.url);
         
             [self updatePhotoStore];
         
     }];
}

- (void)updatePhotoStore
{
    
    for (PhotoClass *object in self.fetchedPhotos)
    {
        NSString *photoKey = object.Thumbnail.url;
        
        NSLog(@"Selector %@", [self.fetchedPhotoStore objectForKey:photoKey]);
        
//        if (![self.fetchedPhotoStore objectForKey:photoKey])

        if (true)
        {
            PFFile *imageFile = object.Thumbnail;
            
            NSLog(@"Photo Image file %@", imageFile);
            
            [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
            {
               
                [self.fetchedPhotoStore setObject:data forKey:photoKey];
                
                //NSLog(@"Photo Image data %@", data);
            
                //self.fetchedPhotoStore[@"abc"] = data;
                
                //NSLog(@"Photo Image Object %@", [self.fetchedPhotoStore objectForKey:photoKey]);
            } progressBlock:^(int percentDone) {
                NSLog(@"%d", percentDone);
                
            }];
        }
        
    }
    
}


- (void)addPhoto:(UIImage *)imageToAdd
{
    
    NSLog(@"PHOTO DATA STORE!%@", imageToAdd);
    
    NSData *imageData = UIImageJPEGRepresentation(imageToAdd, 0.5);
    PFFile *imageFile = [PFFile fileWithName:@"image.jpeg" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserPhoto"];
    userPhoto[@"imageName"] = @"My trip to Hawaii!";
    userPhoto[@"imageFile"] = imageFile;
    
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        NSLog(@"%@", imageFile.url);
        
        NSLog(@"Thumbnails %@", userPhoto[@"Thumbnail"]);
        

        self.fetchedPhotoStore[imageFile.url] = imageData;

        self.fetchedPhotoStore[((PFFile *)userPhoto[@"Thumbnail"]).url] = userPhoto[@"Thumbnail"];
        
    }];
    
}




@end
