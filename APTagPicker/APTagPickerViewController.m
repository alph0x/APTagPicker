//
//  APTagPickerViewController.m
//  APTagPicker
//
//  Created by Alfredo Perez on 11/25/15.
//  Copyright © 2015 Alfredo Perez. All rights reserved.
//

#import "APTagPickerViewController.h"
#import "KTCenterFlowLayout.h"

//hex #F5F5F5
#define _COLOR_LIGHT_GRAY             [UIColor colorWithRed:242/255.0f  green:242/255.0f    blue:242/255.0f alpha:1.0f]

//hex #BCBCBC
#define _COLOR_GRAY                   [UIColor colorWithRed:224/255.0f  green:224/255.0f    blue:224/255.0f alpha:1.0f]

//hex #F5F5F5
#define _COLOR_DARK_GRAY              [UIColor colorWithRed:65/255.0f   green:65/255.0f     blue:65/255.0f  alpha:1.0f]

//hex #FFFFFF
#define _COLOR_WHITE                  [UIColor whiteColor]

#define _FONT_MEDIUM_10      [UIFont systemFontOfSize:8.f]

@interface APTagPickerViewController ()

@end

@implementation APTagPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if DEBUG == 1
    if (!self.tags) {
        self.tags = [self mockTags];
    }
#endif
    [self prepareTags];
    [self.tagCollectionView reloadData];
}

- (void) prepareTags {
    self.tagCollectionView.dataSource = self;
    self.tagCollectionView.delegate = self;
    KTCenterFlowLayout *layout = [[KTCenterFlowLayout alloc] init];
    [self.tagCollectionView setCollectionViewLayout:layout];
    [self.tagCollectionView registerNib:[UINib nibWithNibName:@"APTagPickerCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"tagCell"];
    self.selectedTags = [NSMutableArray new];
}

-(void)APTagPickerTitleForTagSelected:(NSString *)tagTitle {
    [self.selectedTags addObject:tagTitle];
    [self.delegate APTagPickerSelectedTags:self.selectedTags];
}

-(void)APTagPickerTitleForTagDeselected:(NSString *)tagTitle {
    [self.selectedTags removeObject:tagTitle];
    [self.delegate APTagPickerSelectedTags:self.selectedTags];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    APTagPickerCollectionViewCell *cell = [self.tagCollectionView dequeueReusableCellWithReuseIdentifier:@"tagCell" forIndexPath:indexPath];
    cell.delegate = self;
    [cell.tagButton setTitle:[self.tags objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    cell.state = APTagSelected;
    [cell prepareCellWithFont:self.tagFont
                  borderColor:self.borderColor 
                    mainColor:self.mainColor 
               secondaryColor:self.secondaryColor];
    return cell;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 6;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize titleSize = [self widthOfString:[self.tags objectAtIndex:indexPath.row] withFont:self.tagFont];
    return CGSizeMake(titleSize.width + 10*1.5, titleSize.height + 10);
}

- (CGSize)widthOfString:(NSString *)string withFont:(UIFont *)font {
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    return [[[NSAttributedString alloc] initWithString:string attributes:attributes] size];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tags.count;
}

-(NSArray *) mockTags {
    return @[@"Eduard",@"Frank",@"Yanelsy",@"Alfredo",@"Glas",@"Andres Mendez",@"Amir",@"Abuelo",@"Arash",@"BlancRide",@"Nekso",@"Sapoteta",@"QA",@"Cogote",@"Lechuga",@"Nevada",@"Apple"];
}

+(instancetype) tagPickerWithTags:(NSArray *)   tags 
                             font:(UIFont *)    tagFont 
                      borderColor:(UIColor *)   borderColor
                        mainColor:(UIColor *)   mainColor
                   secondaryColor:(UIColor *)   secondaryColor {
    APTagPickerViewController *tagPicker = [[APTagPickerViewController alloc] initWithNibName:@"APTagPickerViewController" bundle:nil];
    tagPicker.tags = tags;
    
    tagPicker.borderColor = _COLOR_DARK_GRAY;
    tagPicker.mainColor = _COLOR_DARK_GRAY;
    tagPicker.secondaryColor = _COLOR_WHITE;
    tagPicker.tagFont = _FONT_MEDIUM_10;
    
    if (tagFont) {
        tagPicker.tagFont = tagFont;
    }
    
    if (borderColor) {
        tagPicker.secondaryColor = secondaryColor;
    }
    if (mainColor) {
        tagPicker.mainColor = mainColor;
    }
    if (secondaryColor) {
        tagPicker.borderColor = borderColor;
    }
    
    
    
    return tagPicker;
}

@end
