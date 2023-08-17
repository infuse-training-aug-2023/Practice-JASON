class Calculator:
    def add(self, num1, num2):
        return num1 + num2

    def subtract(self, num1, num2):
        return num1 - num2


calculator = Calculator()

result = calculator.add(2, 3)
print(result)

result = calculator.subtract(5, 2)
print(result)
