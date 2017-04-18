//
//  Notes+CoreDataProperties.h
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/18.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "Notes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Notes (CoreDataProperties)

+ (NSFetchRequest<Notes *> *)fetchRequest;

@end

NS_ASSUME_NONNULL_END
