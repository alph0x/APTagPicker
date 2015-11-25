//
//  APTagPickerCollectionViewCell.h
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    APTagSelected = 0,
    APTagNonSelected = 1
}APTag;

@protocol APTagPickerCollectionViewCellDelegate <NSObject>

-(void) APTagPickerTitleForTagSelected:(NSString *) tagTitle;
-(void) APTagPickerTitleForTagDeselected:(NSString *) tagTitle;

@end

@interface APTagPickerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<APTagPickerCollectionViewCellDelegate>delegate;

@property (strong, nonatomic) IBOutlet UIButton *tagButton;
@property (assign, nonatomic) APTag state;

@property (strong, nonatomic) UIFont *tagFont;

//COLORS
@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *mainColor;
@property (strong, nonatomic) UIColor *secondaryColor;

-(void) prepareCellWithFont:(UIFont *) tagFont
                borderColor:(UIColor *)   borderColor
                  mainColor:(UIColor *)   mainColor
             secondaryColor:(UIColor *)   secondaryColor;

@end
