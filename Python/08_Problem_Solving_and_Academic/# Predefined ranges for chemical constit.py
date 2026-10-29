# Predefined ranges for chemical constituents (example ranges)
chemical_ranges = {
    "chemical1": (10, 20),
    "chemical2": (5, 15),
    "chemical3": (2, 8)
}

def check_medicine(disease, symptom, chemicals):
    for chemical, percentage in chemicals.items():
        min_val, max_val = chemical_ranges.get(chemical, (None, None))
        if min_val is None or max_val is None:
            return {"status": "reject", "reason": f"Unknown chemical: {chemical}"}
        if not (min_val <= percentage <= max_val):
            return {"status": "reject", "reason": f"{chemical} percentage out of range"}
    return {"status": "accepted"}

# Example input
disease = "DiseaseName"
symptom = "SymptomName"
chemicals = {
    "chemical1": 15,
    "chemical2": 10,
    "chemical3": 5
}

# Check the medicine
result = check_medicine(disease, symptom, chemicals)
print(result)
