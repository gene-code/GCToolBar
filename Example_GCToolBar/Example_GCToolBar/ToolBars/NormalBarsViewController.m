//
//  NormalBarsViewController.m
//  Example_GCToolBar
//
//  Created by Emir Fithri on 29/10/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import "NormalBarsViewController.h"

@interface NormalBarsViewController ()

@end

@implementation NormalBarsViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
     [self.navigationController setTitle:@"Normal Toolbar"];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    // create the toolbar here and initialize everything.
    NSArray *colors = @[[UIColor grayColor],//GC_BUTTON_COLOR,
                        [UIColor lightGrayColor],//GC_BUTTON_BORDER_COLOR,
                        [UIColor clearColor],//GC_BUTTON_INDICATOR,
                        [UIColor clearColor],//GC_BUTTON_INDICATOR2,
                        [UIColor cyanColor],//GC_BUTTON_COLOR_HIGHLIGHT
                        ];
    
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             [GCToolBar btnWithImgName:@"btn1" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn2" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn3" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn4" andColors:colors],
                             [GCToolBar btnWithImgName:@"btn5" andColors:colors],
                             nil];
    
    GCToolBar *normalBar = [[GCToolBar alloc] initWithFrame:_barPlaceHolder.frame andItems:toolbarItems indicatorPos:GC_INDICATOR_NONE];
    normalBar.delegate = self;
    normalBar.selectable = NO;
    [self.view addSubview:normalBar];
}


-(void)GCToolBarButton:(GCToolBar *)toolBar didClickedAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            _myLabel.text = @"First Button";
            break;
        case 1:
            _myLabel.text = @"Second Button";
            break;
        case 2:
            _myLabel.text = @"Third Button";
            break;
        case 3:
            _myLabel.text = @"Forth Button";
            break;
        case 4:
            _myLabel.text = @"Fifth Button";
            break;
            
        default:
            break;
    }
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
