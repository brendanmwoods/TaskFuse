//
//  DetailTaskViewController.h
//  TaskFuse
//
//  Created by brendan woods on 2016-08-25.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Task.h"

@interface DetailTaskViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSManagedObject *task;


@end
