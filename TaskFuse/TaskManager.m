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

static NSString * const TASK_ENTITY_NAME = @"Task";

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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:TASK_ENTITY_NAME];
    _savedTasks = [[context executeFetchRequest:fetchRequest error:nil]mutableCopy];
    
    //TODO: these should be turned in to Task objects before being returned.
    return _savedTasks;
}

- (void)updateSavedTask:(NSManagedObject *)object withNewTaskData:(Task *)task
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    [object setValue:task.taskTitle forKey:@"title"];
    [object setValue:task.startDate forKey:@"startDate"];
    [object setValue:task.frequency forKey:@"frequency"];
    
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

+ (TaskManager *)sharedTaskManager //singleton task manager
{
    static TaskManager *sharedTaskManager = nil;
    
    if(sharedTaskManager == nil)
    {
        sharedTaskManager = [[TaskManager alloc]init];
    }
    return sharedTaskManager;
}

- (void)addTask:(Task *)task
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSManagedObject *newTask = [NSEntityDescription insertNewObjectForEntityForName:TASK_ENTITY_NAME
                                                             inManagedObjectContext:context];
    
    [newTask setValue:task.taskTitle forKey:@"title"];
    [newTask setValue:task.startDate forKey:@"startDate"];
    [newTask setValue:task.expiryDate forKey:@"expiryDate"];
    [newTask setValue:task.frequency forKey:@"frequency"];
    
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

- (void)deleteTask:(NSManagedObject *)task
{
    NSManagedObjectContext *context = [self managedObjectContext];
    [context deleteObject:task];
    
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

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
