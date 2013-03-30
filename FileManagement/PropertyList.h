//
//  PropertyList.h
//  Game
//
//  Created by Justin Mackenzie on 13-01-15.
//  Copyright (c) 2013 Team AirHammer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PropertyList : NSObject
{
    NSString *_name;
    NSDictionary *_contents;
}

-(id)initWithName:(NSString *)name AndContents:(NSDictionary *)contents;

/* Returns the contents of this property list. */
-(NSDictionary *)getContents;

/* Returns the row of the property list with the given key. */
-(id)getRowWithKey:(id)key;

@end
