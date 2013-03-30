//
//  Health.h
//  RTRGame
//
//  Created by Justin Mackenzie on 13-03-19.
//
//

#import "Component.h"

@interface Health : Component
{
    BOOL _alive;
}

-(id)initWithGameObject:(GameObject *)gameObject;

-(void)Kill;
-(BOOL)Alive;

@end
