# Define the diseases and their symptoms
diseases = {
    'A': ['x1', 'x2', 'x3'],
    'B': ['y1', 'y2', 'y3'],
    'C': ['z1', 'z2', 'z3'],
    'D': ['p1', 'p2', 'p3'],
    'E': ['q1', 'q2', 'q3']
}

# Define the acceptable ranges for the constituents
constituent_ranges = {
    'c1': (10, 20),
    'c2': (5, 15),
    'c3': (1, 10)
}

# Function to check if the constituents are within the acceptable ranges
def check_constituents(constituents):
    for name, value in constituents.items():
        min_val, max_val = constituent_ranges[name]
        if not (min_val <= value <= max_val):
            return f"Rejected: {name} has wrong constituent"
    return "Accepted"

# Example user input
selected_disease = input("Select a disease (A, B, C, D, E): ")
selected_symptom = input(f"Select a symptom from {diseases[selected_disease]}: ")

# Take user input for the constituents
user_constituents = {
    'c1': float(input("Enter the value for c1: ")),
    'c2': float(input("Enter the value for c2: ")),
    'c3': float(input("Enter the value for c3: "))
}

# Check the user input
result = check_constituents(user_constituents)
print(result)
