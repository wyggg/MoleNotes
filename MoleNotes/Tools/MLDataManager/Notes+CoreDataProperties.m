//
//  Notes+CoreDataProperties.m
//  MoleNotes
//
//  Created by iOS wugang on 2017/4/18.
//  Copyright © 2017年 wugang. All rights reserved.
//

#import "Notes+CoreDataProperties.h"

@implementation Notes (CoreDataProperties)

+ (NSFetchRequest<Notes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Notes"];
}


@end
