//
//  ComponentManager.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>
#import "Updatable.h"

@class Component;
@class Queue;

@interface ComponentManager : NSObject <Updatable>
{
    NSMutableDictionary *_components;
    NSMutableArray *_updatables;
    Queue *_newSpriteQueue;
    Queue *_addQueue;
    Queue *_removeQueue;
    Queue *_removeSpriteQueue;
}

-(void)MarkComponentForAddition:(Component *)component;
-(void)MarkComponentForRemoval:(Component *)component;
-(NSArray *)GetComponentsOfType:(NSString *)type;
-(NSMutableArray *)GetNewSprites;
-(NSMutableArray *)GetRemovedSprites;

@end
