//
//  Platform.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-14.
//
//

#import "GameObject.h"
#import "b2World.h"

@interface Platform : GameObject

-(id)initWithTag:(NSString *)tag Position:(Vector2f *)position Speed:(float)speed World:(b2World *)world Size:(int)size;

@end
