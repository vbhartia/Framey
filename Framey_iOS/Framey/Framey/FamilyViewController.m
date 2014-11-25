// Lists the full list of families I am a part of.



//
//  FamilyViewController.m
//  Framey3
//
//  Created by Varun Bhartia on 11/23/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import "FamilyViewController.h"
#import "FamilyDetailsViewController.h"

@interface FamilyViewController ()

@end


@implementation FamilyViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.title = @"Varun's Families";
    
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


- (IBAction)familyClick:(id)sender
{

    NSBundle *appBundle = [NSBundle mainBundle];
    
    FamilyDetailsViewController *familyDetailsVC = [[FamilyDetailsViewController alloc] initWithNibName:@"FamilyAlbums" bundle:appBundle];
    
    [self.navigationController pushViewController:familyDetailsVC animated:YES];
    
    NSLog(@"Hit");

}


@end
