//
//  Component.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameObject;

@interface Component : NSObject
{
    GameObject *_gameObject;
    NSString *_name;
}

-(id)initWithGameObject:(GameObject *)gameObject Name:(NSString *)name;
-(GameObject *)GameObject;
-(NSString *)Name;

@end