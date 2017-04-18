//
//  MLDataManager.h
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/17.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Notes+CoreDataClass.h"
#import "Notes+CoreDataProperties.h"

@interface MLDataManager : NSObject

@property (nonatomic, strong, readonly) NSManagedObjectContext *context;
@property (nonatomic, strong, readonly) NSManagedObjectModel *managedObjModle;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


///得到单例
+ (id)shareDataManager;
///得到数据库文件目录
- (NSURL *)applicationDocumentsDirectory;
///保存句柄
- (void)saveContext;

@end
