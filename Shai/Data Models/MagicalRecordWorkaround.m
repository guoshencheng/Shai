//
//  MagicalRecordWorkaround.m
//  ArchitectureProject
//
//  Created by guoshencheng on 6/11/15.
//  Copyright (c) 2015 guoshencheng. All rights reserved.
//

#import "MagicalRecordWorkaround.h"
#import "MagicalRecord+Setup.h"
#import "NSManagedObject+MagicalRecord.h"
#import "NSManagedObjectContext+MagicalRecord.h"
#import "CoreData+MagicalRecord.h"

@implementation NSPersistentStoreCoordinator (MagicalRecordWorkaround)

- (NSPersistentStore *) MRWR_addAutoMigratingSqliteStoreNamed:(NSString *) storeFileName {
    NSMutableDictionary *sqliteOptions = [NSMutableDictionary dictionary];
    [sqliteOptions setObject:@"DELETE" forKey:@"journal_mode"];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                             sqliteOptions, NSSQLitePragmasOption,
                             nil];
    
    return [self MR_addSqliteStoreNamed:storeFileName withOptions:options];
}

@end

@implementation MagicalRecordWorkaround

+ (void)setupCoreDataStackWithAutoMigratingSqliteStoreNamed:(NSString *)storeName {
    if ([NSPersistentStoreCoordinator MR_defaultStoreCoordinator] != nil) return;
    
    NSManagedObjectModel *model = [NSManagedObjectModel MR_defaultManagedObjectModel];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    [coordinator MRWR_addAutoMigratingSqliteStoreNamed:storeName];
    
    //HACK: lame solution to fix automigration error "Migration failed after first pass"
    if ([[coordinator persistentStores] count] == 0)
    {
        [coordinator performSelector:@selector(MRWR_addAutoMigratingSqliteStoreNamed:) withObject:storeName afterDelay:0.5];
    }
    
    
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:coordinator];
    
    [NSManagedObjectContext MR_initializeDefaultContextWithCoordinator:coordinator];
}

@end