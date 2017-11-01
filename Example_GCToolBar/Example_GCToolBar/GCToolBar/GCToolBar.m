//
//  GCToolBar.m
//
//
//  Created by Emir Fithri on 29/04/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import "GCToolBar.h"

@implementation GCToolBar

+(NSDictionary*)btnWithImgName:(NSString*)iconName andColors:(NSArray*)colorArray {
    // colorArray: 0=btn,1=border,2=selection,3=selection2,4=highlight
    NSDictionary *btnObj = [NSDictionary dictionaryWithObjectsAndKeys:
                            iconName,@"btnIcon",
                            [colorArray objectAtIndex:0], @"btnColor",
                            [colorArray objectAtIndex:1], @"btnBorderColor",
                            [colorArray objectAtIndex:2], @"btnIndiColor1",
                            [colorArray objectAtIndex:3], @"btnIndiColor2",
                            [colorArray objectAtIndex:4], @"btnHighlightColor",
                            nil];
    return btnObj;
}

-(id)init {
    self = [super init];
    if (self) {
        // initialize
        _selectable = NO;
        _indicatorPosition = GC_INDICATOR_TOP;
        
    }
    return self;
}

-(UIColor*)colorFor:(NSDictionary*)dict forKey:(NSString*)key {
    return [dict objectForKey:key];
}

-(id)initVerticalWithFrame:(CGRect)frame andItems:(NSArray*)buttons indicatorPos:(IndicatorType)type {
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.installedButtons = [NSArray arrayWithArray:buttons];
        long totButtons = [buttons count];
        CGFloat btnHeight = frame.size.height/totButtons;
        CGFloat yOffset=0;
        _selectedIndex = -1;
        
        CGFloat borderWidth = 0.3;
        CGFloat indicatorThickness = 3.0;
        
        for (int i=0; i<totButtons; i++) {
            
            NSDictionary *btnObj = [buttons objectAtIndex:i];
            UIImage *btnIcon = [UIImage imageNamed:[btnObj objectForKey:@"btnIcon"]];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:btnIcon forState:UIControlStateNormal];
            [btn setBackgroundColor:[self colorFor:btnObj forKey:@"btnColor"]];
            [btn.layer setBorderWidth:borderWidth];
            [btn.layer setBorderColor:[self colorFor:btnObj forKey:@"btnBorderColor"].CGColor];
            btn.tag = GC_TAG_BTN+i;
            
            [btn addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];

            
            btn.frame = CGRectMake(0, yOffset, frame.size.width, btnHeight);
            
            [self addSubview:btn];
            
            // add indicator view
            CGRect rect;
            CGFloat sX,sY,eX,eY;
            switch (type) {
                case GC_INDICATOR_TOP:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                    rect = CGRectMake(2*borderWidth, yOffset+2*borderWidth, frame.size.width-4*borderWidth, indicatorThickness);
                    break;
                case GC_INDICATOR_BOTTOM:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                    rect = CGRectMake(2*borderWidth, yOffset+btnHeight-indicatorThickness, frame.size.width-4*borderWidth, indicatorThickness);
                    break;
                case GC_INDICATOR_LEFT:
                    sX =0.5; sY=0; eX=0.5; eY=1;
                    rect = CGRectMake(2*borderWidth, yOffset+2*borderWidth, indicatorThickness, btnHeight-4*borderWidth);
                    break;
                case GC_INDICATOR_RIGHT:
                    sX =0.5; sY=0; eX=0.5; eY=1;
                    rect = CGRectMake(frame.size.width-indicatorThickness-4*borderWidth, yOffset+2*borderWidth, indicatorThickness, btnHeight-4*borderWidth);
                    break;
                default:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                    rect = CGRectMake(2*borderWidth,  yOffset+btnHeight-indicatorThickness, frame.size.width-4*borderWidth, indicatorThickness);
                    break;
            }
            
            UIView *indicator = [[UIView alloc] initWithFrame:rect];
            indicator.backgroundColor = [UIColor clearColor];
            indicator.tag = GC_TAG_INDI+i;
            indicator.hidden = YES;
            [self addSubview:indicator];
            
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = indicator.bounds;
            gradient.colors = @[(id)[self colorFor:btnObj forKey:@"btnIndiColor1"].CGColor,
                                (id)[self colorFor:btnObj forKey:@"btnIndiColor2"].CGColor];
            gradient.startPoint = CGPointMake(sX, sY);
            gradient.endPoint = CGPointMake(eX, eY);
            [indicator.layer insertSublayer:gradient atIndex:0];
            
            yOffset += btnHeight;
        }
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame andItems:(NSArray*)buttons indicatorPos:(IndicatorType)type{
    self = [self init];
    if (self) {
        self.frame = frame;
        
        self.installedButtons = [NSArray arrayWithArray:buttons];
        long totButtons = [buttons count];
        CGFloat btnWidth = frame.size.width/totButtons;
        CGFloat xOffset=0;
        _selectedIndex = -1;
        
        CGFloat borderWidth = 0.3;
        CGFloat indicatorThickness = 3.0;

        for (int i=0; i<totButtons; i++) {
            
            NSDictionary *btnObj = [buttons objectAtIndex:i];
            UIImage *btnIcon = [UIImage imageNamed:[btnObj objectForKey:@"btnIcon"]];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:btnIcon forState:UIControlStateNormal];
            [btn setBackgroundColor:[self colorFor:btnObj forKey:@"btnColor"]];
            [btn.layer setBorderWidth:borderWidth];
            [btn.layer setBorderColor:[self colorFor:btnObj forKey:@"btnBorderColor"].CGColor];
            btn.tag = GC_TAG_BTN+i;
            
            [btn addTarget:self action:@selector(buttonDidClicked:) forControlEvents:UIControlEventTouchUpInside];

            
            btn.frame = CGRectMake(xOffset, 0, btnWidth, frame.size.height);
            
            [self addSubview:btn];
            
            // add indicator view
            CGRect rect;
            CGFloat sX,sY,eX,eY;
            switch (type) {
                case GC_INDICATOR_TOP:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                    rect = CGRectMake(xOffset+2*borderWidth, 2*borderWidth, btnWidth-4*borderWidth, indicatorThickness);
                    break;
                case GC_INDICATOR_BOTTOM:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                     rect = CGRectMake(xOffset+2*borderWidth, frame.size.height-indicatorThickness, btnWidth-4*borderWidth, indicatorThickness);
                    break;
                    
                default:
                    sX =0; sY=0.5; eX=1; eY=0.5;
                    rect = CGRectMake(xOffset+2*borderWidth, frame.size.height-indicatorThickness, btnWidth-4*borderWidth, indicatorThickness);
                    break;
            }
            
            UIView *indicator = [[UIView alloc] initWithFrame:rect];
            indicator.backgroundColor = [UIColor clearColor];
            indicator.tag = GC_TAG_INDI+i;
            indicator.hidden = YES;
            [self addSubview:indicator];
            
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = indicator.bounds;
            gradient.colors = @[(id)[self colorFor:btnObj forKey:@"btnIndiColor1"].CGColor,
                                (id)[self colorFor:btnObj forKey:@"btnIndiColor2"].CGColor];
            gradient.startPoint = CGPointMake(sX, sY);
            gradient.endPoint = CGPointMake(eX, eY);
            [indicator.layer insertSublayer:gradient atIndex:0];
            
            xOffset += btnWidth;
        }
        
    }
    return self;
}



-(void)selectButtonAtIndex:(long)index {
    
    _selectedIndex = index;
    
    [self unselectAllButton];
    UIView *indi = [self viewWithTag:index+GC_TAG_INDI];
    indi.hidden = NO;
    
    NSDictionary *btnObj = [_installedButtons objectAtIndex:index];
    UIButton *btn = [self viewWithTag:index+GC_TAG_BTN];
    btn.backgroundColor = [self colorFor:btnObj forKey:@"btnHighlightColor"];
}

-(void)unselectAllButton {
    long tot = [_installedButtons count];
    
    
    
    for (int i=0; i<tot; i++) {
        UIView *indi = [self viewWithTag:i+GC_TAG_INDI];
        indi.hidden = YES;
        
        NSDictionary *btnObj = [_installedButtons objectAtIndex:i];
        UIButton *btn = [self viewWithTag:i+GC_TAG_BTN];
        btn.backgroundColor = [self colorFor:btnObj forKey:@"btnColor"];
    }
}

-(void)buttonDidClicked:(UIButton*)btn {
    
    
    if (_selectable) {
        [self selectButtonAtIndex:btn.tag-GC_TAG_BTN];
    } else {
        [self unselectAllButton];
    }
    
    if (_delegate) {
        [self.delegate GCToolBarButton:self didClickedAtIndex:btn.tag-GC_TAG_BTN];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
