//
//  Coin.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "GameObject.h"
#import "b2World.h"

@interface Coin : GameObject

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position World:(b2World *)world Value:(int)value Velocity:(Vector2f *)velocity;

@end
