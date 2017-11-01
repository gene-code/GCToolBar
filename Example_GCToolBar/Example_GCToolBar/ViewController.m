//
//  ViewController.m
//  Example_GCToolBar
//
//  Created by Emir Fithri on 29/10/2017.
//  Copyright © 2017 geneCode. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.contentsArray = [[NSMutableArray alloc] init];
    
    NSDictionary *item1 = @{@"title":@"Normal Toolbar", @"subtitle":@"Bottom toolbar setup"};
    NSDictionary *item2 = @{@"title":@"Horizonal TabBar", @"subtitle":@"Horizontal Bar with Selection & Highlight"};
    NSDictionary *item3 = @{@"title":@"Vertical TabBar", @"subtitle":@"Vertical Bar with Selection & Gradient Highlight"};
    
    [self.contentsArray addObject:item1];[self.contentsArray addObject:item2];[self.contentsArray addObject:item3];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.contentsArray count];
    
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
 
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myCell"];
    }
    
    NSDictionary *item = [self.contentsArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [item objectForKey:@"title"];
    cell.detailTextLabel.text = [item objectForKey:@"subtitle"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [self performSegueWithIdentifier:@"segueToolbars" sender:nil];
            break;
        case 1:
            [self performSegueWithIdentifier:@"segueHorizontal" sender:nil];
            break;
        case 2:
            [self performSegueWithIdentifier:@"segueVertical" sender:nil];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
