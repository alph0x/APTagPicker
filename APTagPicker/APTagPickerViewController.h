//
//  APTagPickerViewController.h
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APTagPickerCollectionViewCell.h"

@protocol APTagPickerViewControllerDelegate <NSObject>

-(void) APTagPickerSelectedTags:(NSArray *) selectedTags;

@end

@interface APTagPickerViewController : UIViewController <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate, APTagPickerCollectionViewCellDelegate>
@property (weak, nonatomic) id<APTagPickerViewControllerDelegate>delegate;
@property (strong, nonatomic) NSArray *tags;
@property (strong, nonatomic) NSMutableArray *selectedTags;
@property (strong, nonatomic) UICollectionViewCell *tagCell;
@property (strong, nonatomic) IBOutlet UICollectionView *tagCollectionView;

@property (strong, nonatomic) UIFont *tagFont;
@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *mainColor;
@property (strong, nonatomic) UIColor *secondaryColor;


+(instancetype) tagPickerWithTags:(NSArray *)   tags 
                             font:(UIFont *)    tagFont 
                      borderColor:(UIColor *)   borderColor
                        mainColor:(UIColor *)   mainColor
                   secondaryColor:(UIColor *)   secondaryColor;
 
@end
