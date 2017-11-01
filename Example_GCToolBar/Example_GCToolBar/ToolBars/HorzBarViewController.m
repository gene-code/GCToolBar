//
//  HorzBarViewController.m
//  Example_GCToolBar
//
//  Created by Emir Fithri on 29/10/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import "HorzBarViewController.h"

@interface HorzBarViewController ()

@end

@implementation HorzBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationItem.title = @"Horz.Tab Bar";
    
    // create the toolbar here and initialize everything.
    NSArray *colors = @[[UIColor grayColor],//GC_BUTTON_COLOR,
                        [UIColor lightGrayColor],//GC_BUTTON_BORDER_COLOR,
                        [UIColor cyanColor],//GC_BUTTON_INDICATOR,
                        [UIColor cyanColor],//GC_BUTTON_INDICATOR2,
                        [UIColor darkGrayColor],//GC_BUTTON_COLOR_HIGHLIGHT
                        ];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             [GCToolBar btnWithImgName:@"btn1" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn2" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn3" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn4" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn5" andColors:colors],
                             nil];
    
    GCToolBar *normalBar = [[GCToolBar alloc] initWithFrame:_barPlaceHolder.frame andItems:toolbarItems indicatorPos:GC_INDICATOR_BOTTOM];
    normalBar.delegate = self;
    normalBar.selectable = YES;
    [self.view addSubview:normalBar];
    [normalBar selectButtonAtIndex:2]; // initial selection
}

-(void)GCToolBarButton:(GCToolBar *)toolBar didClickedAtIndex:(NSInteger)index {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
