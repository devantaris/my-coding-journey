import csv
import smtplib
import ssl
from getpass import getpass

# ----------------------
# USER INPUT COLLECTION
# ----------------------
csv_path = input("Enter CSV file path (e.g., sponsors.csv): ").strip()
email_subject = "For Sponsorship"  # Fixed subject line

print("\nUsing default email body. Type 'END' to finish or press Enter to use default:")
email_body_lines = [
    "Dear {full_name},",
    "",
    "We are IEEE at Bennett University, organizing **Triverse**, our flagship event celebrating technology and innovation.",
    "",
    "We would love to have {company} as a sponsor for Triverse. Your support will help us create an unforgettable experience for students and industry leaders alike.",
    "",
    "Let us know if you're interested, and we can discuss the details further.",
    "",
    "Looking forward to your response!",
    "",
    "Best regards,",
    "[Your Name]",
    "IEEE Bennett University"
]
print("\n".join(email_body_lines))
custom_body = input("\nPress Enter to use default or type your custom body (type 'END' to finish):\n")
if custom_body.strip().lower() != '':
    email_body_lines = []
    while True:
        line = input()
        if line.strip().lower() == 'end':
            break
        email_body_lines.append(line)
email_body = '\n'.join(email_body_lines)

smtp_server = "smtp.gmail.com"
smtp_port = 465
sender_email = "itsdevanshkumar@gmail.com"
sender_password = input("Enter your app password: ")  # Securely input app password

preview_email = input("Preview first email before sending all? (Y/N): ").strip().lower()


context = ssl.create_default_context()   #yahan bana hai secure ssl path 

try:
    with smtplib.SMTP_SSL(smtp_server, smtp_port, context=context) as server:
        server.login(sender_email, sender_password)
        
        with open(csv_path, 'r') as csvfile:
            reader = csv.DictReader(csvfile)   # read data as dictionary (column names become keys)
            for i, row in enumerate(reader):
                # Extract data from CSV columns
                full_name = f"{row['first_name']} {row['last_name']}"  # Combine first and last name
                company = row['orginzation_name']  # Note: Exact column name from your CSV
                email = row['email']
                industry = row['industry'] or "your industry"  # Handle empty values
                city = row['city'] or "your city"
                country = row['country'] or "your country"
                phone = row['primary_phone'] or "[PHONE NUMBER]"

                # Personalize email
                personalized_body = email_body.format(
                    full_name=full_name,
                    company=company,
                    industry=industry,
                    city=city,
                    country=country,
                    phone=phone
                )

                # Build message
                message = f"Subject: {email_subject}\nTo: {email}\n\n{personalized_body}"

                # Preview first email
                if i == 0 and preview_email == 'y':
                    print("\nFirst Email Preview:")
                    print("-"*30)
                    print(message)
                    if input("Proceed? (Y/N): ").lower() != 'y':
                        print("Cancelled")
                        break

                # Send email
                server.sendmail(sender_email, email, message)
                print(f"Sent to {email}")

except Exception as e:
    print(f"Error: {e}")
    print("Common fixes: Check column names in CSV match exactly")
    print("Verify app password is correct")