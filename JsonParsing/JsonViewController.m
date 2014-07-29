//
//  JsonViewController.m
//  JsonParsing
//
//  Created by NTL BUSINESS APP on 7/29/14.
//  Copyright (c) 2014 YourCompany. All rights reserved.
//

#import "JsonViewController.h"

@interface JsonViewController ()

@end

@implementation JsonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    pArrStationameTable = [[NSMutableArray alloc]init];
    
    
    responseData = [NSMutableData data];
    
    NSString *urlRequest = [NSString stringWithFormat:@"full url"];
    
    NSString *pStrLegalURLString =[urlRequest stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];  //Or your String Encoding;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:pStrLegalURLString]];
    // [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    @try {
        [responseData setLength:0];
    }
    @catch (NSException *exception) {
        NSLog(@"Execption Erro : %@",exception);
    }
    @finally {
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [responseData appendData:data];
}

//some sort of error, you can print the error or put in some other handling here, possibly even try again but you will risk an infinite loop then unless you impose some sort of limit
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Clear the activeDownload property to allow later attempts
    responseData = nil;
    
    /*  UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error"
     message:error.description
     delegate:nil
     cancelButtonTitle:@"Close"
     otherButtonTitles:nil];
     [alert show];*/
    
}

//connection has finished, thse requestData object should contain the entirety of the response at this point
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    @try {
        
        //        [connection release];
        
        NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        //        NSMutableDictionary *pDictValue = [responseString JSONValue];
        
        
        pArrStationame = [[NSMutableArray alloc]init];
        NSMutableDictionary *pDictValue;// = [responseString JSONValue];
        
        
        pArrStationame = [responseString JSONValue];
        
        NSLog(@"pArrStationame %lu",(unsigned long)[pArrStationame count]);
        
        for (int i = 0; i < [pArrStationame count]; i++) {
            
            pDictValue = [pArrStationame objectAtIndex:i];
            
            NSString *pstrname = [pDictValue objectForKey:@"stationName"];
            [pArrStationameTable addObject:pstrname];
            
        }
        
        [pTblCities reloadData];
        
        //        NSArray *pArrMessage;
        //        NSString *pOutPut;
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception Error %@",exception);
    }
    @finally {
        
    }
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [pArrStationame count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    //    cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"gradient.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        
    }
    cell.textLabel.text = [pArrStationameTable objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /* pTblCities.hidden = YES;
     
     
     
     if (iTag == 1) {
     if(isFiltered) {
     
     pTxtOrgin.text = [pArrFilteredTableData objectAtIndex:indexPath.row];
     
     for(i=0; i<[pArrCities count]; i++) {
     
     if ([pTxtOrgin.text isEqualToString:[pArrCities objectAtIndex:i]]){
     pStrFrmStationId = [pArrStationId objectAtIndex:i];
     NSLog(@"filtered data id %@",pStrFrmStationId);
     }
     
     }
     
     
     } else {
     pTxtOrgin.text = [pArrCities objectAtIndex:indexPath.row];
     pStrFrmStationId = [pArrStationId objectAtIndex:indexPath.row];
     
     }
     
     
     } else {
     if(isFiltered) {
     
     pTxtDestination.text = [pArrFilteredTableData objectAtIndex:indexPath.row];
     
     for(i=0; i<[pArrCities count]; i++) {
     
     if ([pTxtDestination.text isEqualToString:[pArrCities objectAtIndex:i]]){
     pStrToStationId = [pArrStationId objectAtIndex:i];
     NSLog(@"filtered data id %@",pStrToStationId);
     
     }
     
     }
     
     
     
     
     } else {
     pTxtDestination.text = [pArrCities objectAtIndex:indexPath.row];
     pStrToStationId = [pArrStationId objectAtIndex:indexPath.row];
     
     }
     
     }
     isFiltered = FALSE;
     
     [pTblCities reloadData];
     pSearchBar.text = nil;
     
     [pSearchBar resignFirstResponder];*/
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end