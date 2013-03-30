//
//  BrussellSprout.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "GameObject.h"
#import "b2World.h"

@interface BrussellSprout : GameObject

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world Velocity:(Vector2f *)velocity;

@end
