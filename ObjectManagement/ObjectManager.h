//
//  ObjectManager.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-21.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Updatable.h"

@class GameObject;
@class Tubby;
@class Queue;

@interface ObjectManager : NSObject <Updatable>
{
    NSMutableDictionary *_gameObjects;
    NSMutableArray *_allGameObjects;
    Queue *_addQueue;
    Queue *_removeQueue;
    Tubby *_tubby;
}

-(void)MarkObjectForAddition:(GameObject *)object;
-(void)MarkObjectForRemoval:(GameObject *)object;
-(GameObject *)GetTubby;
-(NSMutableArray *)GetObjects:(NSString *)type;

@end
