//
//  TaskExpiryTableViewCell.m
//  TaskFuse
//
//  Created by brendan woods on 2016-08-18.
//  Copyright © 2016 brendan woods. All rights reserved.
//

#import "TaskExpiryTableViewCell.h"

@interface TaskExpiryTableViewCell()

#pragma mark - Properties

@property (weak, nonatomic) IBOutlet UISegmentedControl *taskExpirySegmentedControl;


@end

@implementation TaskExpiryTableViewCell
// TODO: resign first responder for textview , and validate the data coming in.
#pragma  mark - Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self updateFrequencyLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark - IBActions

- (IBAction)frequencySliderChanged:(UISlider *)sender
{
    NSLog(@"slider changed");
    [self updateFrequencyLabel];
}

- (IBAction)expirySegmentChanged:(UISegmentedControl *)sender
{
    //TODO: CHANGE SLIDER RANGES THAT REFLECT THE EXPIRY TERM
    
}

#pragma mark - Public

- (int)segmentSelected
{
    NSLog(@"is selected");
    _segmentSelected =(int)[self.taskExpirySegmentedControl selectedSegmentIndex];
    NSLog(@"returning %d", _segmentSelected);
    
    return _segmentSelected;
}

- (void)updateFrequencyLabel
{
    int roundedValue = self.frequencySlider.value;
    [self.taskFrequencyTextField setText:[NSString stringWithFormat:@"%d",roundedValue]];
}

@end
