//
//  DetailTaskTableViewController.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface DetailTaskTableViewController : UITableViewController

@property (nonatomic,strong) NSManagedObject *task;

@end
