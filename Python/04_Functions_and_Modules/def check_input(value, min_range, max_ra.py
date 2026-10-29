def check_input(value, min_range, max_range):
    if min_range <= value <= max_range:
        print("ok")
    else:
        print("rejected")

# ranges for each input
ranges = [
    (10, 20),
    (30, 40),   
    (50, 60),  
    (70, 80),  
    (90, 100)   
]

# Loop to get input and check range


for i in range(5):
    value = int(input(f"Enter an integer for range {ranges[i]}: "))
    check_input(value, ranges[i][0], ranges[i][1])
