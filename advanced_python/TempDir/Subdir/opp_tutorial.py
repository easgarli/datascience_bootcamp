class Employee:
    
    num_of_emps = 0
    raise_amount = 1.04
    def __init__(self, first, last, pay):
        self.first = first
        self.last = last
        self.pay = pay
        self.email = f"{self.first}.{self.last}@company.com"
        
        Employee.num_of_emps +=1
    
    def fullname(self):
        return f"{self.first} {self.last}"
    
    def apply_raise(self):
        self.pay = int(self.pay * Employee.raise_amount)
    
emp_1 = Employee('Corey','Schafer',50000)
emp2 = Employee('Elnur','Asgarli',60000)    

print(Employee.num_of_emps)
