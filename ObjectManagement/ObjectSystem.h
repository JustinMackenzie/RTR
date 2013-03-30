//
//  ObjectSystem.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameObject.h"
#import "Component.h"
#import "Updatable.h"

@class ObjectManager;
@class Vector2f;
@class ComponentManager;
@class ObjectFactory;

@interface ObjectSystem : NSObject <Updatable>
{
    ObjectManager *_objectManager;
    ComponentManager *_componentManager;
    ObjectFactory *_objectFactory;
}

+(ObjectSystem *)SharedObjectSystem;
-(GameObject *)AddObjectOfType:(NSString *)type At:(Vector2f *)position;
-(NSMutableArray *)GetNewSprites;
-(NSMutableArray *)GetRemovedSprites;
-(void)RemoveObject:(GameObject *)object;
-(void)StartObjectSystem;
-(void)ClearObjectSystem;
-(GameObject *)AddPlatform:(int)size At:(Vector2f *)position;
-(GameObject *)GetTubby;
-(NSMutableArray *)GetObjects:(NSString *)type;

@end
