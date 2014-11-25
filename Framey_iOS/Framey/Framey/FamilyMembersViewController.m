//
//  FamilyMembersViewController.m
//  Framey3
//
//  Created by Varun Bhartia on 11/23/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import "FamilyMembersViewController.h"

@interface FamilyMembersViewController ()

@end

@implementation FamilyMembersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dismissClick:(id)sender
{
    
    NSLog(@"dismiss");
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
