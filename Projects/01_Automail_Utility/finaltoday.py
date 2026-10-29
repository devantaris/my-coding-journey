import csv
import smtplib
import ssl
import time
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
from threading import Thread

# ----------------------
# CONFIGURATION
# ----------------------
MAX_RETRIES = 1  # Number of send attempts per email
BATCH_SIZE = 5    # Emails per batch
DELAY_BETWEEN_BATCHES = 10  # Seconds between batches

# ----------------------
# USER INPUT COLLECTION
# ----------------------
csv_path = input("Enter CSV file path (e.g., sponsors.csv): ").strip()
email_subject = "Sponsorship Invitation for Triverse 2.0 at Bennett University"
pdf_path = "Triverse.pdf"

# ----------------------
# EMAIL CONTENT
# ----------------------
def get_email_body(full_name):
    return [
        f"Dear {full_name},",
        "",
        "I hope this message finds you well. My name is Vrinda Gupta, and I am the Vice Chairperson of the IEEE Club at Bennett University (Times of India Group). We are thrilled to announce our upcoming flagship event, Triverse 2.0, a four-day extravaganza that combines fun, innovation, and technology.",
        "",
        "Event Details:",
        "",
        "Event Name: Triverse 2.0",
        "Duration: 4 Days",
        "Event Dates: 27 March to 30 March",
        "Venue: Bennett University, Times of India Group",
        "",
        "Triverse will offer a unique blend of engaging tech-based activities and exciting fun events, creating an ideal platform for students to showcase their talents while fostering a spirit of learning and collaboration. With a vibrant footfall of students from diverse backgrounds, Triverse promises high visibility and engagement opportunities for brands looking to connect with the youth.",
        "",
        "We believe your organization would be a perfect partner for this event. Sponsoring Triverse will provide you with:",
        "- Brand Visibility: Reach a dynamic audience of college students and tech enthusiasts.",
        "- Networking Opportunities: Engage with bright minds and potential future leaders in the tech and innovation space. We have event collaboration with Qshala under Zerodha.",
        "- Social Media Promotion: Amplify your brand’s presence through our extensive promotional campaigns on various platforms.",
        "",
        "We would love to discuss how we can tailor the sponsorship to best suit your organization’s goals.",
        "",
        "We have attached a detailed sponsorship prospectus outlining the various sponsorship levels and associated benefits for your consideration.",
        "",
        "Here’s a rough marketing plan for the event:",
        "- 12,000+ Bennett students",
        "- Digital Press",
        "- Official mail to all the students (Each and every student checks the official mail!)",
        "- 100+ reposts generating more than 100K impressions",
        "- Ad will be shown to all the audience (if any)",
        "- Promotion on Stalls",
        "- Standees",
        "",
        "Additionally, we can also allow you to set up your stall at the university throughout the event so that the students can purchase and experience your products!",
        "",
        "Looking forward to the possibility of partnering with you to make Triverse 2.0 a grand success.",
        "",
        "Thank you for your time and consideration.",
        "",
        "Best regards,",
        "Vrinda Gupta",
        "Vice Chairperson, IEEE Club",
        "Bennett University",
        "+91 8287589908",
        "",
        "--------------------------------",
        "This email was sent to ieee@bennett.edu.in. Reply UNSUBSCRIBE to opt-out.",
        "IEEE Club, Bennett University, Tech Zone II, Greater Noida"
    ]

# Gmail SMTP settings
smtp_server = "smtp.gmail.com"
smtp_port = 465
sender_email = "triverse2.0@gmail.com"
# Prompt securely for sender app password or fetch from environment
import os
sender_password = os.getenv("GMAIL_APP_PASSWORD") or input("Enter your app password: ")

preview_email = input("Preview first email before sending all? (Y/N): ").strip().lower()

# Pre-process the PDF attachment
with open(pdf_path, 'rb') as attachment:
    pdf_part = MIMEBase('application', 'octet-stream')
    pdf_part.set_payload(attachment.read())
    encoders.encode_base64(pdf_part)
    pdf_part.add_header('Content-Disposition', f'attachment; filename={pdf_path}')

# ----------------------
# EMAIL SENDING FUNCTION
# ----------------------
def send_email(email, full_name):
    for attempt in range(MAX_RETRIES):
        try:
            msg = MIMEMultipart()
            msg['From'] = sender_email
            msg['To'] = email
            msg['Cc'] = "ieee@bennett.edu.in"
            msg['Subject'] = email_subject

            email_body = "\n".join(get_email_body(full_name))
            msg.attach(MIMEText(email_body, 'plain'))
            msg.attach(pdf_part)

            with smtplib.SMTP_SSL(smtp_server, smtp_port, context=ssl.create_default_context()) as server:
                server.login(sender_email, sender_password)
                server.sendmail(sender_email, [email, "ieee@bennett.edu.in"], msg.as_string())
                print(f"✅ Successfully sent to {email}")
                return True
                
        except smtplib.SMTPServerDisconnected as e:
            print(f"⚠️ Connection lost for {email} (attempt {attempt+1}). Retrying...")
            time.sleep(5)
        except smtplib.SMTPException as e:
            print(f"⚠️ Error sending to {email}: {str(e)}")
            return False
        except Exception as e:
            print(f"⚠️ Unexpected error with {email}: {str(e)}")
            return False

    print(f"❌ Failed to send to {email} after {MAX_RETRIES} attempts")
    return False

# ----------------------
# MAIN PROCESSING
# ----------------------
try:
    with open(csv_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        threads = []
        batch_count = 0

        for i, row in enumerate(reader):
            full_name = f"{row['first_name']} {row['last_name']}"
            email = row['email']

            # Preview first email
            if i == 0 and preview_email == 'y':
                print("\n📧 First Email Preview:")
                print("-" * 40)
                print("\n".join(get_email_body(full_name)))
                if input("\nProceed with sending? (Y/N): ").lower() != 'y':
                    print("🚫 Operation cancelled")
                    exit()

            # Start thread for current email
            thread = Thread(target=send_email, args=(email, full_name))
            thread.start()
            threads.append(thread)
            batch_count += 1

            # Manage batches with delays
            if batch_count >= BATCH_SIZE:
                print(f"\n⏳ Completed batch of {BATCH_SIZE} emails. Waiting {DELAY_BETWEEN_BATCHES}s...")
                for t in threads:
                    t.join()
                threads = []
                batch_count = 0
                time.sleep(DELAY_BETWEEN_BATCHES)

        # Clean up remaining threads
        if threads:
            print("\n🔁 Processing final batch...")
            for t in threads:
                t.join()

        print("\n🎉 All emails processed!")

except Exception as e:
    print(f"\n❌ Critical error: {str(e)}")
    print("Possible solutions:")
    print("1. Verify CSV file format and column names")
    print("2. Check internet connection")
    print("3. Confirm Gmail credentials and app password")
    print("4. Ensure 'Less Secure Apps' is enabled in Gmail settings")