// Lists Details about one Family


//
//  FamilyDetailsViewController.m
//  Framey3
//
//  Created by Varun Bhartia on 11/23/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import "FamilyDetailsViewController.h"
#import "FamilyMembersViewController.h"
#import "PhotoClassDataStore.h"

@interface FamilyDetailsViewController () <UIImagePickerControllerDelegate>
{
    
    PhotoClassDataStore *_photoDataStore;
    
}

@end

@implementation FamilyDetailsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.title = @"Bhartia Family";
    
    
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector( editMembers ) ];
    
    super.navigationItem.rightBarButtonItem = doneButton;
    
    _photoDataStore = [PhotoClassDataStore sharedInstance];
    
    // Return the address of the new object
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)editMembers
{
    
    NSBundle *appBundle = [NSBundle mainBundle];
    
    FamilyMembersViewController *familyVC = [[FamilyMembersViewController alloc] initWithNibName:@"FamilyMembersEditScreen" bundle:appBundle];
    
    [self presentModalViewController:familyVC animated:YES];
    
}

- (IBAction)addPhoto:(id)sender
{
    
    NSLog(@"add photo");
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // If the device ahs a camera, take a picture, otherwise,
    // just pick from the photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    // Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:NULL];
    
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    // Get picked image from info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // Put that image onto the screen in our image view
    //self.imageView.image = image;
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    
    UIImage *imageToUpload = [[UIImage alloc] initWithData:imageData];
    
    
    [_photoDataStore addPhoto:imageToUpload];
    
    NSLog(@"abc");
    
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
