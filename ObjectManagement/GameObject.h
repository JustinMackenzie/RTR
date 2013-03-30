//
//  GameObject.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-20.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Component;
@class Vector2f;

@interface GameObject : NSObject
{
    NSMutableDictionary *_components;
    NSString *_tag;
}

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position;
-(void)AddComponent:(Component *)component;
-(void)RemoveComponent:(NSString *)name;
-(Component *)GetComponent:(NSString *)name;
-(NSArray *)GetAllComponents;

-(NSString *)Tag;

@end
