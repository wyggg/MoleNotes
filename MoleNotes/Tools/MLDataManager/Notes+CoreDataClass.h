//
//  Notes+CoreDataClass.h
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/18.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notes : NSManagedObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSNumber *updateTime;

@property (nonatomic, copy) NSString *contentText;


@end

NS_ASSUME_NONNULL_END

#import "Notes+CoreDataProperties.h"
