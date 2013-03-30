//
//  ObjectFactory.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import <Foundation/Foundation.h>

@class GameObject;
@class Vector2f;

@interface ObjectFactory : NSObject

-(GameObject *)CreateGameObjectOfType:(NSString *)type AtPosition:(Vector2f *)position;
-(GameObject *)AddPlatform:(int)size At:(Vector2f *)position;

@end
