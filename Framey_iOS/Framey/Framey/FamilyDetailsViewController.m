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

@interface FamilyDetailsViewController ()

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
