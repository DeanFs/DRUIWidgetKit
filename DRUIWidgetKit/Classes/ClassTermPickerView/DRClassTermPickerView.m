//
//  DRClassTermPickerView.m
//  BlocksKit
//
//  Created by 冯生伟 on 2019/10/11.
//

#import "DRClassTermPickerView.h"
#import <Masonry/Masonry.h>
#import <DRMacroDefines/DRMacroDefines.h>
#import <DRCategories/UIFont+DRExtension.h>
#import <DRCategories/NSDate+DRExtension.h>
#import <DRCategories/NSAttributedString+DRExtension.h>
#import "DRNormalDataPickerView.h"

@interface DRClassTermPickerView ()

@property (weak, nonatomic) DRNormalDataPickerView *pickerView;
@property (nonatomic, assign) BOOL didDrawRect;

@end

@implementation DRClassTermPickerView

- (void)setupPickerView {
    NSArray *levels = @[@"大一", @"大二", @"大三", @"大四", @"大五",
                        @"研一", @"研二", @"研三"];
    NSInteger startLevelIndex = (self.education - 1) * 5;
    NSMutableArray *years = [NSMutableArray array];
    NSInteger maxYear = [NSDate date].year;
    for (NSInteger i=self.enterYear; i<=maxYear; i++) {
        NSInteger levelIndex = startLevelIndex + years.count;
        if (levelIndex >= levels.count) {
            break;
        }
        NSString *yearString = [NSString stringWithFormat:@"%ld-%ld (%@)", i, i+1, levels[levelIndex]];
        [years addObject:yearString];
    }

    NSMutableArray *terms = [NSMutableArray array];
    for (NSInteger i=0; i<self.termCount; i++) {
        [terms addObject:[NSString stringWithFormat:@"第%ld学期", i+1]];
    }

    NSString *currentYear = years[self.currentYear-self.enterYear];
    NSString *currentTerm = [NSString stringWithFormat:@"第%ld学期", self.currentTerm];

    self.pickerView.dataSource = @[years, terms];
    self.pickerView.currentSelectedStrings = @[currentYear, currentTerm];
}

#pragma mark - setup xib
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    if (!self.pickerView) {
        DRNormalDataPickerView *picker = [[DRNormalDataPickerView alloc] init];
        picker.getFontForSectionWithBlock = ^UIFont *(NSInteger section) {
            if (section == 0) {
                return [UIFont dr_PingFangSC_RegularWithSize:22];
            }
            return [UIFont dr_PingFangSC_MediumWithSize:17];
        };
        picker.getWidthForSectionWithBlock = ^CGFloat(NSInteger section) {
            CGFloat wholeWidth = kDRScreenWidth - 48;
            if (section == 0) {
                return wholeWidth * 0.6;
            }
            if (section == 1) {
                return wholeWidth * 0.3;
            }
            return 0;
        };
        picker.getCustonCellViewBlock = ^UIView *(NSInteger section, NSInteger row, NSString *text, UIColor *textColor) {
            if (section == 0) {
                CGFloat wholeWidth = kDRScreenWidth - 48;
                NSArray *textArr = [text componentsSeparatedByString:@" "];
                UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, wholeWidth * 0.6, 34)];
                UIView *containerView = [[UIView alloc] init];
                [customView addSubview:containerView];
                [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.center.mas_offset(0);
                }];

                UILabel *yearLabel = [[UILabel alloc] init];
                yearLabel.textColor = textColor;
                yearLabel.font = [UIFont dr_PingFangSC_RegularWithSize:22];
                yearLabel.text = textArr.firstObject;
                yearLabel.textAlignment = NSTextAlignmentRight;
                [containerView addSubview:yearLabel];
                [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.bottom.mas_offset(0);
                }];

                UILabel *termLabel = [[UILabel alloc] init];
                termLabel.textColor = textColor;
                termLabel.font = [UIFont dr_PingFangSC_MediumWithSize:17];
                termLabel.text = textArr.lastObject;
                [containerView addSubview:termLabel];
                [termLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.bottom.right.mas_offset(0);
                    make.left.mas_equalTo(yearLabel.mas_right).mas_offset(8);
                }];
                [yearLabel sizeToFit];
                [termLabel sizeToFit];
                return customView;
            }
            return nil;
        };
        kDRWeakSelf
        picker.onSelectedChangeBlock = ^(NSInteger section, NSInteger index, NSString *selectedString) {
            if (section == 0) {
                weakSelf.currentYear = weakSelf.enterYear + index;
            } else if (section == 1) {
                weakSelf.currentTerm = index + 1;
            }
        };
        [self addSubview:picker];
        [picker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_offset(0);
        }];
        self.pickerView = picker;
        self.termCount = 3;
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];

    if (CGRectEqualToRect(rect, CGRectZero)) {
        return;
    }
    if (!self.didDrawRect) {
        self.didDrawRect = YES;

        dispatch_async(dispatch_get_main_queue(), ^{
            [self setupPickerView];
        });
    }
}

@end
