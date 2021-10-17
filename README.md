# Calculator

The app is a calculator with "innovative" UI. It consists of two screens:
1. The input screen, that takes input from the user and allows requesting the result.
2. The result screen, that makes an API request and displays a result.

Input screen
● The user should be able to choose one of four operations (addition, subtraction, multiplication, division) through segmented control.
● The user should be able to select first input number through stepper. Starting value should be 0, no end ranges required.
● The user should be able to select second input number through a slider with a range of -100 to 100. Starting value should be 0.
● The user should be able to see an equation that will be executed.
● The user should be able to tap a button to calculate the result.
● The button should be disabled if the calculation is impossible.
● Tapping the button should present the result screen.

Result screen
● Result screen should contain label with result of the equation.
● The result screen should make a request to https://api.mathjs.org to fetch a result.
● While waiting for displaying of the result, the user should be presented with a loading indicator of your choice.
● The user should be able to go back to the input screen.
