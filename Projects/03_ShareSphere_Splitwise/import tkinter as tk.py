import tkinter as tk
from tkinter import messagebox
from tabulate import tabulate

class ShareSphere:
    def __init__(self, root):
        self.root = root
        self.root.title("Splitwise GUI App")
        self.users = {}
        self.balances = {}

        # Main Menu Buttons
        tk.Button(root, text="Add User", command=self.add_user_window, width=20).pack(pady=5)
        tk.Button(root, text="Record Expense", command=self.record_expense_window, width=20).pack(pady=5)
        tk.Button(root, text="View Balances", command=self.view_balances_window, width=20).pack(pady=5)
        tk.Button(root, text="Settle Debt", command=self.settle_debt_window, width=20).pack(pady=5)
        tk.Button(root, text="Exit", command=root.quit, width=20).pack(pady=5)

    def add_user_window(self):
        window = tk.Toplevel(self.root)
        window.title("Add User")
        tk.Label(window, text="Enter User Name:").pack(pady=5)
        user_entry = tk.Entry(window)
        user_entry.pack(pady=5)
        tk.Button(window, text="Add", command=lambda: self.add_user(user_entry.get(), window)).pack(pady=5)

    def add_user(self, name, window):
        if name in self.users:
            messagebox.showerror("Error", f"User '{name}' already exists.")
        else:
            self.users[name] = len(self.users) + 1
            self.balances[name] = {}
            for user in self.users:
                if user != name:
                    self.balances[user][name] = 0
                    self.balances[name][user] = 0
            messagebox.showinfo("Success", f"User '{name}' added successfully!")
        window.destroy()

    def record_expense_window(self):
        window = tk.Toplevel(self.root)
        window.title("Record Expense")

        tk.Label(window, text="Payer:").pack(pady=5)
        payer_entry = tk.Entry(window)
        payer_entry.pack(pady=5)

        tk.Label(window, text="Amount:").pack(pady=5)
        amount_entry = tk.Entry(window)
        amount_entry.pack(pady=5)

        tk.Label(window, text="Involved Users (comma-separated):").pack(pady=5)
        users_entry = tk.Entry(window)
        users_entry.pack(pady=5)

        tk.Button(
            window, 
            text="Record Expense", 
            command=lambda: self.record_expense(payer_entry.get(), amount_entry.get(), users_entry.get(), window)
        ).pack(pady=5)

    def record_expense(self, payer, amount, users, window):
        if payer not in self.users:
            messagebox.showerror("Error", f"User '{payer}' does not exist.")
            return

        try:
            amount = float(amount)
        except ValueError:
            messagebox.showerror("Error", "Invalid amount.")
            return

        involved_users = [user.strip() for user in users.split(",") if user.strip() in self.users]
        if not involved_users:
            messagebox.showerror("Error", "No valid users selected.")
            return

        split_amount = round(amount / len(involved_users), 2)
        for user in involved_users:
            if user != payer:
                self.balances[payer][user] -= split_amount
                self.balances[user][payer] += split_amount

        messagebox.showinfo("Success", "Expense recorded successfully!")
        window.destroy()

    def view_balances_window(self):
        data = []
        for user1 in self.users:
            for user2 in self.balances[user1]:
                if self.balances[user1][user2] > 0:
                    data.append([user1, user2, f"{self.balances[user1][user2]:.2f}"])

        if data:
            balances_str = tabulate(data, headers=["Owes", "To", "Amount"], tablefmt="pretty")
            messagebox.showinfo("Balances", balances_str)
        else:
            messagebox.showinfo("Balances", "No balances to show.")

    def settle_debt_window(self):
        window = tk.Toplevel(self.root)
        window.title("Settle Debt")

        tk.Label(window, text="Debtor:").pack(pady=5)
        debtor_entry = tk.Entry(window)
        debtor_entry.pack(pady=5)

        tk.Label(window, text="Creditor:").pack(pady=5)
        creditor_entry = tk.Entry(window)
        creditor_entry.pack(pady=5)

        tk.Label(window, text="Amount:").pack(pady=5)
        amount_entry = tk.Entry(window)
        amount_entry.pack(pady=5)

        tk.Button(
            window, 
            text="Settle Debt", 
            command=lambda: self.settle_debt(debtor_entry.get(), creditor_entry.get(), amount_entry.get(), window)
        ).pack(pady=5)

    def settle_debt(self, debtor, creditor, amount, window):
        if debtor not in self.users or creditor not in self.users:
            messagebox.showerror("Error", "Invalid user names.")
            return

        try:
            amount = float(amount)
        except ValueError:
            messagebox.showerror("Error", "Invalid amount.")
            return

        if self.balances[debtor][creditor] < amount:
            messagebox.showerror("Error", f"The amount exceeds the current debt ({self.balances[debtor][creditor]:.2f}).")
            return

        self.balances[debtor][creditor] -= amount
        self.balances[creditor][debtor] += amount
        messagebox.showinfo("Success", "Debt settled successfully!")
        window.destroy()

# Run the App
if __name__ == "__main__":
    root = tk.Tk()
    app = ShareSphere(root)
    root.mainloop()