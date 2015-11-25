//
//  ViewController.h
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APTagPickerViewController.h"

@interface ViewController : UIViewController <APTagPickerViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *tagPickerContainer;
@property (strong, nonatomic) APTagPickerViewController *tagPicker;
@end

