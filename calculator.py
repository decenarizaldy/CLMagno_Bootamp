def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a / b

def get_number(message):
    while True:
        try:
            return float(input(message))
        except ValueError:
            print("Invalid input. Please enter a number.")

def main():
    while True:
        print("\n--- CLI Calculator ---")
        print("1. Add | 2. Subtract | 3. Multiply | 4. Divide | 5. Exit")

        choice = input("Select operation (1-5): ")

        if choice == "5":
            print("Exiting...")
            break

        if choice not in ["1", "2", "3", "4"]:
            print("Invalid choice. Please select 1-5.")
            continue

        first_number = get_number("Enter first number: ")
        second_number = get_number("Enter second number: ")

        if choice == "1":
            result = add(first_number, second_number)
        elif choice == "2":
            result = subtract(first_number, second_number)
        elif choice == "3":
            result = multiply(first_number, second_number)
        elif choice == "4":
            result = divide(first_number, second_number)

        print("Result:", result)


if __name__ == "__main__":
    main()