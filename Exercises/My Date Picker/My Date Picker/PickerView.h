//
//  PickerViewDelegate.h
//  My Date Picker
//
//  Created by Juda Cossa on 06/05/2017.
//  Copyright © 2017 Juda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calendar.h"

@interface PickerView : NSObject<UIPickerViewDelegate, UIPickerViewDataSource>

@property Calendar * calendar;

@end
