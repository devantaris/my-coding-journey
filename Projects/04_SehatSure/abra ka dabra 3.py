# Define the diseases and their symptoms
diseases = {
    'A': ['x1', 'x2', 'x3'],
    'B': ['y1', 'y2', 'y3'],
    'C': ['z1', 'z2', 'z3'],
    'D': ['p1', 'p2', 'p3'],
    'E': ['q1', 'q2', 'q3']
}

# Define the acceptable ranges for the constituents for each symptom
constituent_ranges = {
    'x1': {'c1': (10, 20), 'c2': (5, 15), 'c3': (1, 10)},
    'x2': {'c1': (15, 25), 'c2': (10, 20), 'c3': (5, 15)},
    'x3': {'c1': (20, 30), 'c2': (15, 25), 'c3': (10, 20)},
    'y1': {'c1': (5, 15), 'c2': (3, 13), 'c3': (2, 12)},
    'y2': {'c1': (8, 18), 'c2': (6, 16), 'c3': (4, 14)},
    'y3': {'c1': (12, 22), 'c2': (9, 19), 'c3': (7, 17)},
    'z1': {'c1': (10, 20), 'c2': (5, 15), 'c3': (1, 10)},
    'z2': {'c1': (15, 25), 'c2': (10, 20), 'c3': (5, 15)},
    'z3': {'c1': (20, 30), 'c2': (15, 25), 'c3': (10, 20)},
    'p1': {'c1': (5, 15), 'c2': (3, 13), 'c3': (2, 12)},
    'p2': {'c1': (8, 18), 'c2': (6, 16), 'c3': (4, 14)},
    'p3': {'c1': (12, 22), 'c2': (9, 19), 'c3': (7, 17)},
    'q1': {'c1': (10, 20), 'c2': (5, 15), 'c3': (1, 10)},
    'q2': {'c1': (15, 25), 'c2': (10, 20), 'c3': (5, 15)},
    'q3': {'c1': (20, 30), 'c2': (15, 25), 'c3': (10, 20)}
}

# Function to check if the constituents are within the acceptable ranges
def check_constituents(symptom, constituents):
    for name, value in constituents.items():
        min_val, max_val = constituent_ranges[symptom][name]
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
result = check_constituents(selected_symptom, user_constituents)
print(result)
