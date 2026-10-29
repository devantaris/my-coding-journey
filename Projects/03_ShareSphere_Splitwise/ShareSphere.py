import os
from tabulate import tabulate

class ShareSphere:
    def __init__(self):
        self.users = {}
        self.balances = {}

    def clear_screen(self):
        os.system('cls' if os.name == 'nt' else 'clear')

    def add_user(self):
        name = input("Enter the name of the user: ").strip()
        if name in self.users:
            print(f"User '{name}' already exists.")
        else:
            self.users[name] = len(self.users) + 1
            self.balances[name] = {}
            for user in self.users:
                if user != name:
                    self.balances[user][name] = 0
                    self.balances[name][user] = 0
            print(f"User '{name}' added successfully.")

        # After adding a user, show the main menu with the current users
        self.show_main_menu()

    def remove_user(self):
        name = input("Enter the name of the user to remove: ").strip()
        if name not in self.users:
            print(f"User '{name}' does not exist.")
        else:
            # Remove the user from the users list
            del self.users[name]
            # Remove all balances related to the user
            del self.balances[name]
            
            # Also remove this user from other users' balance records
            for user in self.users:
                del self.balances[user][name]

            print(f"User '{name}' removed successfully.")

        # After removing a user, show the main menu with the updated list
        self.show_main_menu()

    def show_main_menu(self):
        self.clear_screen()
        print("=== ShareSphere Terminal Application ===")
        print("Current Users: ", ', '.join(self.users.keys()))
        print("1. Add User")
        print("2. Record Expense")
        print("3. View Balances")
        print("4. Settle Debt")
        print("5. Remove User")
        print("6. Exit")
        choice = input("Enter your choice: ").strip()

        if choice == "1":
            self.add_user()
        elif choice == "2":
            self.record_expense()
        elif choice == "3":
            self.view_balances()
        elif choice == "4":
            self.settle_debt()
        elif choice == "5":
            self.remove_user()
        elif choice == "6":
            print("Exiting the application. Goodbye!")
        else:
            print("Invalid choice. Please try again.")
            input("Press Enter to return to the menu...")
            self.show_main_menu()

    def record_expense(self):
        payer = input("Enter the name of the payer: ").strip()
        if payer not in self.users:
            print(f"User '{payer}' does not exist.")
            return

        amount = float(input("Enter the amount paid: ").strip())
        involved_users = input("Enter the names of the users involved (comma-separated): ").strip().split(',')
        involved_users = [user.strip() for user in involved_users if user.strip() in self.users]

        if not involved_users:
            print("No valid users selected.")
            return

        split_amount = round(amount / len(involved_users), 2)
        for user in involved_users:
            if user != payer:
                self.balances[payer][user] -= split_amount
                self.balances[user][payer] += split_amount

        print("Expense recorded successfully.")
        self.show_main_menu()

    def view_balances(self):
        data = []
        for user1 in self.users:
            for user2 in self.balances[user1]:
                if self.balances[user1][user2] > 0:
                    data.append([user1, user2, f"{self.balances[user1][user2]:.2f}"])
        if data:
            print(tabulate(data, headers=["Owes", "To", "Amount"], tablefmt="pretty"))
        else:
            print("No balances to show.")
        
        # Wait for user input before returning to the main menu
        input("Press Enter to return to the main menu...")
        self.show_main_menu()

    def settle_debt(self):
        debtor = input("Enter the name of the debtor: ").strip()
        creditor = input("Enter the name of the creditor: ").strip()
        if debtor not in self.users or creditor not in self.users:
            print("Invalid user names.")
            return

        amount = float(input("Enter the amount to settle: ").strip())
        if self.balances[debtor][creditor] < amount:
            print(f"The amount exceeds the current debt ({self.balances[debtor][creditor]:.2f}).")
            return

        self.balances[debtor][creditor] -= amount
        self.balances[creditor][debtor] += amount
        print("Debt settled successfully.")
        self.show_main_menu()

if __name__ == "__main__":
    abcd = ShareSphere()
    abcd.show_main_menu()