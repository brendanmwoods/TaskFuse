//
//  TaskManager.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-17.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskManager.h"
#import <CoreData/CoreData.h>
#import "UIKit/UIKit.h"

@interface TaskManager()

@end

@implementation TaskManager
#pragma mark - Properties

#pragma mark - Lifecycle

#pragma mark - Public


- (NSMutableArray *)savedTasks
{
    //return all the saved Tasks from core data
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Task"];
    _savedTasks = [[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
    return _savedTasks;
}

//get the singleton shared task manager
+ (TaskManager *)sharedTaskManager
{
    static TaskManager *sharedTaskManager = nil;
    
    if(sharedTaskManager == nil)
    {
        sharedTaskManager = [[TaskManager alloc]init];
    }
    return sharedTaskManager;
}

- (void)addTaskWithTitle:(NSString *)newTaskTitle
{
    //create a new Task, and try to save it to core data
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newTask = [NSEntityDescription insertNewObjectForEntityForName:@"Task"
                                                             inManagedObjectContext:context];
    [newTask setValue:newTaskTitle forKey:@"title"];
    NSError *error = nil;
    
    if (![context save:&error])
    {
        NSLog(@"cannot save, with error %@ , %@", error,[error localizedDescription]);
    }
    
    else
    {
        NSLog(@"should be saved correctly now");
    }
}

- (void)deleteTask
{
    NSManagedObjectContext *context = [self managedObjectContext];
    [context deleteObject:[self.savedTasks objectAtIndex:0]];
    
    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"cannot delete. error %@, %@", error, [error localizedDescription]);
    }
    
    else
    {
        NSLog(@"should have deleted a Task.");
    }
}

#pragma mark - Private

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
