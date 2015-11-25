//
//  APTagPickerCollectionViewCell.m
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import "APTagPickerCollectionViewCell.h"

@implementation APTagPickerCollectionViewCell

- (void)awakeFromNib {
    self.tagButton.layer.borderColor = self.borderColor.CGColor;
    self.tagButton.titleLabel.font = self.tagFont;
    [self tagButtonTapped:nil];
}

- (IBAction)tagButtonTapped:(id)sender {
    switch (self.state) {
        case APTagSelected:
        {
            self.tagButton.backgroundColor = self.secondaryColor;
            [self.tagButton setTitleColor:self.mainColor forState:UIControlStateNormal];
            [self.delegate APTagPickerTitleForTagDeselected:[sender currentTitle]];
            self.state = APTagNonSelected;
        }
            break;
            
        default:
        {
            self.tagButton.backgroundColor = self.mainColor;
            [self.tagButton setTitleColor:self.secondaryColor forState:UIControlStateNormal];
            [self.delegate APTagPickerTitleForTagSelected:[sender currentTitle]];
            self.state = APTagSelected;
        }
            break;
    }
}

-(void) prepareCellWithFont:(UIFont *) tagFont
                borderColor:(UIColor *)   borderColor
                  mainColor:(UIColor *)   mainColor
             secondaryColor:(UIColor *)   secondaryColor {
    self.tagFont = tagFont;
    self.borderColor = borderColor;
    self.mainColor = mainColor;
    self.secondaryColor = secondaryColor;
    [self awakeFromNib];
}

@end
