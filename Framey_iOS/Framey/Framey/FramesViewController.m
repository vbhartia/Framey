//
//  FramesViewController.m
//  Framey3
//
//  Created by Varun Bhartia on 11/24/14.
//  Copyright (c) 2014 Varun Bhartia. All rights reserved.
//

#import "FramesViewController.h"
#import "FrameDetailsViewController.h"

@interface FramesViewController ()

@end

@implementation FramesViewController



- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    self.title = @"Varun's Framey's";
    
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

- (IBAction)frameDetails:(id)sender
{
    
    NSBundle *appBundle = [NSBundle mainBundle];
    
    FrameDetailsViewController *framesDetailsVC = [[FrameDetailsViewController alloc] initWithNibName:@"FrameDetailsViewController" bundle:appBundle];
    

    [self.navigationController pushViewController:framesDetailsVC animated:YES];
    
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
