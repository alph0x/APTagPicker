//
//  ViewController.m
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tagPicker = [APTagPickerViewController tagPickerWithTags:nil 
                                                             font:nil 
                                                      borderColor:nil 
                                                        mainColor:nil 
                                                   secondaryColor:nil];
    self.tagPicker.delegate = self;
    [self.tagPickerContainer addSubview:self.tagPicker.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)APTagPickerSelectedTags:(NSArray *)selectedTags {
    NSLog(@"%@", [selectedTags description]);
}

@end
