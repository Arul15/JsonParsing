//
//  JsonViewController.h
//  JsonParsing
//
//  Created by NTL BUSINESS APP on 7/29/14.
//  Copyright (c) 2014 YourCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSON.h"

@interface JsonViewController : UIViewController {
    NSMutableData *responseData;
    NSMutableArray *pArrStationame,*pArrStationameTable;
    IBOutlet UITableView *pTblCities;

}

@end
