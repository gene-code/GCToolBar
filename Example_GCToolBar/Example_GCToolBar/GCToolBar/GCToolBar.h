//
//  GCToolBar.h
//  Flexible Toolbar with Optional Selection Indicator
//
//  Created by Emir Fithri on 29/04/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCToolBar;

// Supported positions of button indicator
typedef enum IndicatorType {
    GC_INDICATOR_NONE,
    GC_INDICATOR_TOP,
    GC_INDICATOR_BOTTOM,
    GC_INDICATOR_LEFT,
    GC_INDICATOR_RIGHT
} IndicatorType;

// Delegate for clicked event
@protocol GCToolBarDelegate <NSObject>
-(void)GCToolBarButton:(GCToolBar*)toolBar didClickedAtIndex:(NSInteger)index;
@end

// you may need to modify these values if it clash with your usage
#define GC_TAG_BTN 66666
#define GC_TAG_INDI 77777

@interface GCToolBar : UIView

@property (nonatomic, weak) id<GCToolBarDelegate> delegate;
@property (nonatomic, assign) long selectedIndex;
@property (nonatomic, assign) BOOL selectable;
@property (nonatomic, assign) IndicatorType indicatorPosition;
@property (nonatomic, strong) NSArray *installedButtons;

// Initializers
-(id)initWithFrame:(CGRect)frame andItems:(NSArray*)buttons indicatorPos:(IndicatorType)type;
-(id)initVerticalWithFrame:(CGRect)frame andItems:(NSArray*)buttons indicatorPos:(IndicatorType)type;

// Helper method
+(NSDictionary*)btnWithImgName:(NSString*)iconName  andColors:(NSArray*)colorArray;

// You may need to autoselect a certain button on creation
// you can use this method in your viewDidload/viewDidAppear of your viewcontroller.
-(void)selectButtonAtIndex:(long)index;

@end
