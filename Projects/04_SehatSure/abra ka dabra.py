# Predefined ranges for chemical constituents for each medicine
medicine_ranges = {
    "a": {"chemical1": (10, 20), "chemical2": (5, 15), "chemical3": (2, 8)},
    "b": {"chemical1": (12, 22), "chemical2": (6, 16), "chemical3": (3, 9)},
    "c": {"chemical1": (14, 24), "chemical2": (7, 17), "chemical3": (4, 10)},
    "d": {"chemical1": (16, 26), "chemical2": (8, 18), "chemical3": (5, 11)},
    "e": {"chemical1": (18, 28), "chemical2": (9, 19), "chemical3": (6, 12)},
    "f": {"chemical1": (20, 30), "chemical2": (10, 20), "chemical3": (7, 13)},
    "g": {"chemical1": (22, 32), "chemical2": (11, 21), "chemical3": (8, 14)},
    "i": {"chemical1": (24, 34), "chemical2": (12, 22), "chemical3": (9, 15)},
    "j": {"chemical1": (26, 36), "chemical2": (13, 23), "chemical3": (10, 16)}
}

# Mapping of diseases to symptoms and medicines
disease_symptom_medicine = {
    "A": {"x1": "a", "y1": "b", "z1": "c"},
    "B": {"x2": "d", "y2": "e", "z2": "f"},
    "C": {"x3": "g", "y3": "i", "z3": "j"}
}

def check_medicine(disease, symptom, chemicals):
    medicine = disease_symptom_medicine[disease][symptom]
    ranges = medicine_ranges[medicine]

    for chemical, percentage in chemicals.items():
        min_val, max_val = ranges.get(chemical, (None, None))
        if min_val is None or max_val is None:
            return {"status": "reject", "reason": f"Unknown chemical: {chemical}"}
        if not (min_val <= percentage <= max_val):
            return {"status": "reject", "reason": f"{chemical} percentage out of range"}
    return {"status": "accepted"}

def abrakadabra():
    disease = input("Enter the disease (A, B, C): ")
    symptom = input(f"Enter the symptom for disease {disease} (x1, y1, z1, x2, y2, z2, x3, y3, z3): ")
    medicine = disease_symptom_medicine[disease][symptom]
    print(f"Medicine for {disease} with symptom {symptom} is {medicine}")

    chemicals = {}
    for chemical in ["chemical1", "chemical2", "chemical3"]:
        percentage = float(input(f"Enter the percentage of {chemical} in medicine {medicine}: "))
        chemicals[chemical] = percentage

    result = check_medicine(disease, symptom, chemicals)
    print(result)

if __name__ == "__main__":
    abrakadabra()
