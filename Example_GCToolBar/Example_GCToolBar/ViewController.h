//
//  ViewController.h
//  Example_GCToolBar
//
//  Created by Emir Fithri on 29/10/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *contentsArray;
@property (weak, nonatomic) IBOutlet UITableView *mainTable;


@end

