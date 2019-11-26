// Stack Calculator
// A stack machine processes instructions by pushing and popping values to an
// internal stack. A simple example of this is a calculator.
//
//  The argument passed to stackCalc(instructions) will always be a string containing a series of instructions.
//  The instruction set of the calculator will be this:
//
//  +: Pop the last 2 values from the stack, add them, and push the result onto the stack.
//  -: Pop the last 2 values from the stack, subtract the lower one from the
//     topmost one, and push the result.
//  *: Pop the last 2 values, multiply, and push the result.
//  /: Pop the last 2 values, divide the topmost one by the lower one, and push the result.
//  DUP: Duplicate (not double) the top value on the stack.
//  POP: Pop the last value from the stack and discard it.
//  PSH: Performed whenever a number appears as an instruction. Push the number to the stack.
//  Any other instruction (for example, a letter) should result in the value
//  "Invalid instruction: [instruction]"

/// Examples
//  stackCalc("") ➞ 0
//  stackCalc("5 6 +") ➞ 11
//  stackCalc("3 DUP +") ➞ 6
//  stackCalc("6 5 5 7 * - /") ➞ 5
//  stackCalc("x y +") ➞ Invalid instruction: x
int stackCalc(String argument) {
  List<String> walkthrough = argument.split(' ').toList();
  List<int> stack = [];

  for (int i = 0; i < walkthrough.length; i++) {
    if (walkthrough[i] == '+') {
      if (stack.length >= 2) {
        stack.add(stack.last + stack[stack.length - 2]);
        stack.removeAt(stack.length - 2);
        stack.removeAt(stack.length - 2);
      }
    } else if (walkthrough[i] == 'DUP') {
      if (stack.isNotEmpty) {
        stack.add(stack.last);
      }
    } else if (walkthrough[i] == 'POP') {
      if (stack.isNotEmpty) {
        stack.removeLast();
      }
    } else if (walkthrough[i] == '-') {
      if (stack.length >= 2) {
        stack.add(stack.last - stack[stack.length - 2]);
        stack.removeAt(stack.length - 2);
        stack.removeAt(stack.length - 2);
      }
    } else if (walkthrough[i] == '*') {
      if (stack.length >= 2) {
        stack.add(stack.last * stack[stack.length - 2]);
        stack.removeAt(stack.length - 2);
        stack.removeAt(stack.length - 2);
      }
    } else if (walkthrough[i] == '/') {
      if (stack.length >= 2) {
        stack.add(stack.last ~/ stack[stack.length - 2]);
        stack.removeAt(stack.length - 2);
        stack.removeAt(stack.length - 2);
      }
    } else {
      (stack.add(int.parse(walkthrough[i])));
    }
  }


  return stack.last;
}

main() {
  print(stackCalc("3 *"));
}