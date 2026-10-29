#multilevel inheritance and super()

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

class model(toyotatcar):
    def __init__(self, type, name):
        super().__init__(name)
        self.type=type

car1=model("deisel","foruner")
print(car1.name)
print(car1.type)
print(car1.start())