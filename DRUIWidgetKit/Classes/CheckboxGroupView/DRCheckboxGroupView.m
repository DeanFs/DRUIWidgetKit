//
//  DRCheckboxGroupView.m
//  BlocksKit
//
//  Created by 冯生伟 on 2019/10/11.
//

#import "DRCheckboxGroupView.h"
#import <Masonry/Masonry.h>
#import <DRMacroDefines/DRMacroDefines.h>
#import <DRCategories/UIFont+DRExtension.h>
#import "DRUIWidgetUtil.h"

@interface DRCheckboxGroupView ()

@property (weak, nonatomic) UIStackView *stackView;
@property (nonatomic, assign) BOOL didDrawRect;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSString *> *selectMap;
@property (nonatomic, strong) NSMutableArray<UIButton *> *checkButtons;
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *selectedImage;

@end

@implementation DRCheckboxGroupView

- (void)setupPickerView {
    if (self.optionTitles.count == 0) {
        return;
    }

    for (NSInteger i=0; i<self.optionTitles.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:self.optionTitles[i] forState:UIControlStateNormal];
        [button setTitleColor:[DRUIWidgetUtil normalColor] forState:UIControlStateNormal];
        [button setTitleColor:[DRUIWidgetUtil highlightColor] forState:UIControlStateSelected];
        [button setImage:self.normalImage forState:UIControlStateNormal];
        [button setImage:self.selectedImage forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont dr_PingFangSC_RegularWithSize:13];
        button.tintColor = [DRUIWidgetUtil highlightColor];
        [self.stackView addArrangedSubview:button];
    }
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
    if (!self.stackView) {
        UIStackView *stackView = [[UIStackView alloc] init];
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.distribution = UIStackViewDistributionFillEqually;
        stackView.spacing = 0;
        self.stackView = stackView;

        self.normalImage = [DRUIWidgetUtil pngImageWithName:@"class_icon_ring_30px_def"
                                                   inBundle:KDR_CURRENT_BUNDLE];
        self.selectedImage = [DRUIWidgetUtil pngImageWithName:@"class_icon_ring_30px_sel"
                                                     inBundle:KDR_CURRENT_BUNDLE];
        self.selectedImage = [self.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

        [self addSubview:self.stackView];
        [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_offset(0);
        }];
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

- (void)setOptionTitles:(NSArray<NSString *> *)optionTitles {
    _optionTitles = optionTitles;

    if (self.didDrawRect && self.checkButtons.count > 0) {
        for (UIButton *button in self.checkButtons) {
            [self.stackView removeArrangedSubview:button];
        }
        [self.checkButtons removeAllObjects];
        [self.selectMap removeAllObjects];
        self.selectedIndexs = @[];
        self.selectedOptions = @[];
        [self setupPickerView];
    }
}

- (void)setSelectedOptions:(NSArray<NSString *> *)selectedOptions {
    _selectedOptions = selectedOptions;
    NSMutableArray *indexs = [NSMutableArray array];
    for (NSString *option in selectedOptions) {
        for (NSInteger i=0; i<self.optionTitles.count; i++) {
            if ([option isEqualToString:self.optionTitles[i]]) {
                if (!self.selectMap[@(i)]) {
                    self.selectMap[@(i)] = option;
                    [indexs addObject:@(i)];
                    break;
                }
            }
        }
    }
    _selectedIndexs = indexs;
    [self setupPickerView];
}

- (void)setSelectedIndexs:(NSArray<NSNumber *> *)selectedIndexs {
    _selectedIndexs = selectedIndexs;
    NSMutableArray *options = [NSMutableArray array];
    for (NSNumber *number in selectedIndexs) {
        NSString *option = self.optionTitles[number.integerValue];
        if (option.length > 0) {
            [options addObject:option];
        }
        self.selectMap[number] = option;
    }
    _selectedOptions = options;
    [self setupPickerView];
}

- (NSMutableDictionary<NSNumber *, NSString *> *)selectMap {
    if (!_selectMap) {
        _selectMap = [NSMutableDictionary dictionary];
    }
    return _selectMap;
}

- (NSMutableArray<UIButton *> *)checkButtons {
    if (!_checkButtons) {
        _checkButtons = [NSMutableArray array];
    }
    return _checkButtons;
}

@end
