#single inheritance

class car:
    
    @staticmethod
    def start():
        print("car started...")
    
    @staticmethod
    def stop():
        print("car stopped")
    

class toyotatcar(car):
    def __init__(self,name):
        self.name=name


car1=toyotatcar("fortuner")
print(car1.name)
print(car1.start())