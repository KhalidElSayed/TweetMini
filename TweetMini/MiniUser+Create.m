//
//  MiniUser+Create.m
//  TweetMini
//
//  Created by Ayush on 09/10/12.
//  Copyright (c) 2012 Ayush. All rights reserved.
//

#import "MiniUser+Create.h"

@implementation MiniUser (Create)

+ (MiniUser *)createUserWithInfo:(id)info inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MiniUser"];
    request.predicate = [NSPredicate predicateWithFormat:@"userID = %@", [info objectForKey:@"id"]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"userID" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    MiniUser *miniUser = nil;
    
    if (!matches || ([matches count] > 1)) {
        NSLog(@"More than one matches when inserting MiniUser!");
        miniUser = [matches lastObject];
    } else if ([matches count] == 1) {
        miniUser = [matches lastObject];
    } else {
        miniUser = [NSEntityDescription insertNewObjectForEntityForName:@"MiniUser" inManagedObjectContext:context];
        miniUser.userID = [info valueForKey:@"id_str"];
        miniUser.name = [info valueForKey:@"name"];
        miniUser.screenName = [info valueForKey:@"screen_name"];
        miniUser.profileImageURL = [info valueForKey:@"profile_image_url"];
    }
    return miniUser;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"ID: %i Name: %@ Handle: %@ ImageURL: %@", self.userID, self.name, self.screenName, self.profileImageURL];
}

@end