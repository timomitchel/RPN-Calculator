Explanation: In Reverse Polish Notation (RPN) the operators follow their operands; for instance, to add three and four one would write `3 4 +` rather then `3 + 4`.  If there are multiple orperations, the operator is given immediately after its second operand; so the expression written `3 - 4 + 5` in conventional infix notation would be written `3 4 - 5 +` in RPN: first subtract 4 from 3, then add 5 to that.

Example: The infix expression `5 + ((1 + 2) * 4) - 3` can be written down like this in RPN: 5 1 2 + 4 * + 3 -

The Calculator can handle:
- Any integer passed in.

- The four basic arithemetic operations `+, -, *, /`.

- User error - The program will let you know if you've entered an invalid character.


```
Sample:
1
2
+
= 3
2
*
= 6
4
-
= 2
q
goodbye
```

To run the program add these two lines to the end of the `rpn_calculator.rb` file:
```
calculator = RpnCalculator.new
calculator.run
```
And enter `ruby lib/rpn_calculator.rb` in your terminal.
Have fun!