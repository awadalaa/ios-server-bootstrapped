//
//  DetailViewController.h
//  login
//
//  Created by Alaa Awad on 21/08/2014.
//  Copyright (c) 2014 Alaa Awad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
