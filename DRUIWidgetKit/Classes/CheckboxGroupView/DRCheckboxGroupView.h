//
//  DRCheckboxGroupView.h
//  BlocksKit
//
//  Created by 冯生伟 on 2019/10/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DRCheckboxGroupView : UIView

@property (nonatomic, strong) NSArray<NSString *> *optionTitles;
@property (nonatomic, strong) NSArray<NSNumber *> *selectedIndexs;
@property (nonatomic, strong) NSArray<NSString *> *selectedOptions;
@property (nonatomic, assign) BOOL allowMultipleCheck; // default NO
@property (nonatomic, copy) void (^onSelectedChangeBlock)(NSArray<NSNumber *> *selectedIndexs, NSArray<NSString *> *selectedOptions);

@end

NS_ASSUME_NONNULL_END
