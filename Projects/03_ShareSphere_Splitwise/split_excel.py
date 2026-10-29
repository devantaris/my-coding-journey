import pandas as pd
import os

def main():
    # Get user input
    input_file = input("Enter the path to your Excel file: ").strip()
    chunk_size = int(input("Enter the number of rows per file: "))
    
    # Check if the file exists
    if not os.path.exists(input_file):
        print("Error: The specified file does not exist.")
        return
    
    # Load the Excel file
    try:
        df = pd.read_excel(input_file)
    except Exception as e:
        print(f"Error: Failed to read the file. {e}")
        return
    
    # Split into chunks
    num_rows = len(df)
    num_files = (num_rows + chunk_size - 1) // chunk_size
    
    for i in range(num_files):
        start_index = i * chunk_size
        end_index = min((i + 1) * chunk_size, num_rows)
        chunk = df[start_index:end_index]
        
        # Save chunk to a new Excel file
        output_file = f"output_{i+1}.xlsx"
        chunk.to_excel(output_file, index=False)
        print(f"Created {output_file} with {len(chunk)} rows")
    
    print("Splitting complete.")

if __name__ == "__main__":
    main()