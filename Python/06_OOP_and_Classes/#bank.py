#bank

class account:
    def __init__(self,aa,bal):
        self.balance=bal
        self.acc=aa
    
    def debit(self,amount):
        self.balance -= amount
        print(amount, " was debited")
        print("total balance= ", self.get_balance())

    def credit(self,amount):
        self.balance += amount
        print(amount, " was credited")
        print("total balance= ", self.get_balance())
    
    def get_balance(self):
        return self.balance
    
acc1=account(12345,10000000)
print("account no.= ",acc1.acc)
acc1.debit(100000)

acc2=account(12346,20000000)
print("account no= ",acc2.acc)
acc2.credit(10000)