//
//  ViewController.m
//  Multiply
//
//  Created by Mary Jenel Myers on 1/5/15.
//  Copyright (c) 2015 Mary Jenel Myers. All rights reserved.
//multi

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UITextField *multiplierTextField;
@property (weak, nonatomic) IBOutlet UILabel *finalAnswerLabel;

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property NSInteger finalResult;  //declares the finalResult
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.numberTextField.placeholder = @" ";
    self.multiplierTextField.placeholder = @" "; // removes the text and replaces it into a space




}

- (IBAction)onCalculateButtonPressed:(id)sender
{

    NSString *numberText = self.numberTextField.text;
    NSInteger intNumberValue = numberText.intValue;  // changes the string to an integer
   NSInteger intMultiplierValue = self.slider.value; //making slidervalue into an integer

    if (self.operatorSegmentControl.selectedSegmentIndex == 0) //must add the selectedsegment index to decide which to use.
    {
    //    finalResult2 = intMultiplierValue * intNumberValue;
    self.finalResult = intMultiplierValue * intNumberValue; //actual equation for result.
    }
    else
    {
   //     finalResult2 = intMultiplierValue / intNumberValue;
     self.finalResult = intMultiplierValue / intNumberValue;
    } // divides



    NSString *finalResultText = [NSString stringWithFormat:@"%lu", self.finalResult]; // converts int into a string

    if (self.finalResult > 20)
    {
        self.view.backgroundColor = [UIColor greenColor]; //when clicked changes background color to green
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor]; //changes background color to white when not using if statement
    }
    if (self.finalResult % 3 == 0) {
        self.finalAnswerLabel.text = @"fizz"; //If the calculated result is a multiple of 3, make answerLabel's text: fizz
    }
    else if (self.finalResult % 5 == 0) {
        self.finalAnswerLabel.text = @"buzz"; //if the calculate result is a multiple of 5, make answerLabel's text: buzz
    }
    else if (self.finalResult % 3 == 0 && self.finalResult % 5 == 0) {
        self.finalAnswerLabel.text = @"fizzbuzz"; //If the calculated result is a multiple of 3 and 5, make answerLabel's text: fizzbuzz
    }
    else {
        self.finalAnswerLabel.text = finalResultText; // all else show number result.
    }

    [self.numberTextField resignFirstResponder];

}

- (IBAction)sliderValueSlid:(id)sender
{
    self.slider.minimumValue = 0.0; // set min of slider
    self.slider.maximumValue = 10.0; // set max of slider


    NSInteger sliderValue = self.slider.value; // set the slider value as an integer variable; 'value' grabs the property (sliderValue)
    NSString *draggedSliderValue = [NSString stringWithFormat:@"%lu", sliderValue]; // converted sliderValue integer into a string
    self.multiplierTextField.text = draggedSliderValue; //set multiplierTextField equal to dragged slider value.

}



@end
