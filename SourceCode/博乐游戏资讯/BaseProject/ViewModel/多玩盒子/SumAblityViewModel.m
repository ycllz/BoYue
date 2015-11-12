//
//  SumAblityViewModel.m
//  BaseProject
//
//  Created by drouce on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SumAblityViewModel.h"

@implementation SumAblityViewModel


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [DuoWanNetManager getSumAbilityWithCompletionHandle:^(id model, NSError *error) {
        if (!error) {
            self.dataArr = model;
        }
        completionHandle(error);
    }];
}

-(NSInteger)rowNumber {
    return self.dataArr.count;
}

- (SumAbilityModel *)modelForRow:(NSInteger)row {
    return self.dataArr[row];
}


-(NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].name;
}

- (NSURL *)iconURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",[self modelForRow:row].ID]];
}
@end
