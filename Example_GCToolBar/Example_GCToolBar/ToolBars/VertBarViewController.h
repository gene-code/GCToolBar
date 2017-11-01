//
//  VertBarViewController.h
//  Example_GCToolBar
//
//  Created by Emir Fithri on 29/10/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCToolBar.h"

@interface VertBarViewController : UIViewController<GCToolBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *barPlaceHolder;


@end
