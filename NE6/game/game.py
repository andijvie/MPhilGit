import numpy as np
import matplotlib.pyplot as plt

#electricityPrice = [70, 168, 250]
#electricityPrice = [5, 60, 250]
electricityPrice = [15, 15, 250]
hours = np.array([5000, 3600, 160] ) * 0.95 


class Plant:
    def __init__(self, name, availability, capacity, om, eff, fuelPerUnit=.0, costPerUnit=.0, loan = .0, loanTime = 0, constPermTime = 0, down =.0):
        self.name = name
        self.availability = availability
        self.capacity = capacity
        self.om = om
        self.eff = eff 
        self.fuelPerUnit = fuelPerUnit
        self.costPerUnit = costPerUnit
        self.loan = loan
        self.loanTime = loanTime
        self.consPermTime = constPermTime
        self.bank = -down * self.capacity
        self.bankHist = np.array([self.bank])
    
    def getOM(self):
        return self.capacity * self.om
    def getLoan(self):
        if self.loanTime == 0:
            return .0
        self.loanTime -= 1
        return self.capacity * self.loan
    def getMargin(self, hrs):
        if self.eff < 0:
            return .0
        revPH = 3600 * self.costPerUnit * ((self.capacity/self.eff)/self.fuelPerUnit)
        return revPH * hrs/1e6
    def getProfitLoan(self):
        out = - self.getLoan() - self.getOM()
        for i in range(len(hours)):
            hrs = hours[i]
            price = electricityPrice[i]
            out += max(0, self.getRevenue(hrs, price) - self.getMargin(hrs))
        return out
    def getProfit(self):
        out = - self.getOM()
        for i in range(len(hours)):
            hrs = hours[i]
            price = electricityPrice[i]
            out += max(0, self.getRevenue(hrs, price) - self.getMargin(hrs))
        return out
    def getBank(self):
        if self.consPermTime > 0:
            self.consPermTime -= 1
            self.bank -= self.getLoan()
            self.bankHist = np.append(self.bankHist, self.bank)
            return self.bank
        self.bank += self.getProfitLoan()
        self.bankHist = np.append(self.bankHist, self.bank)
        return self.bank
    def getRevenue(self, hrs, price):
        rev = self.availability * (price * hrs * self.capacity)/1e6
        return rev
        
biomass= Plant(
    name="Biomass", 
    availability=1, 
    capacity=500,
    om=0.127,
    eff=0.433,
    fuelPerUnit=15500.0,
    costPerUnit=40.75,
    loan = 0.086,
    loanTime=20,
    constPermTime=5,
    down=0.269)

gasCCGT= Plant(
    name="gasCCGT", 
    availability=1, 
    capacity=500,
    om=0.062,
    eff=.585,
    fuelPerUnit=35.069,
    costPerUnit=0.16,
    loan = 0.058,
    loanTime=15,
    constPermTime=4,
    down=0.150)

gasCCGT1= Plant(
    name="c6gasCCGT", 
    availability=1, 
    capacity=350 * (92/95),
    om=23.6/350,
    eff=.5229,
    fuelPerUnit=35.069,
    costPerUnit=0.17,
    loan = 23.4/350,
    loanTime=1,
    constPermTime=0,
    down=.0)

gasOCGT1= Plant(
    name="c7gasOCGT", 
    availability=1, 
    capacity=50 * (92/95),
    om=1.3/50,
    eff=.3630,
    fuelPerUnit=35.069,
    costPerUnit=0.17,
    loan = 23.4/350,
    loanTime=0,
    constPermTime=0,
    down=.0)

nuclear= Plant(
    name="Nuclear", 
    availability=1, 
    capacity=500,
    om=0.110,
    eff=.342,
    fuelPerUnit=3888000.0,
    costPerUnit=1364.49,
    loan = 0.385,
    loanTime=20,
    constPermTime=7,
    down=1.200)
solar= Plant(
    name="Solar", 
    availability=.15, 
    capacity=500,
    om=0.019,
    eff=-1,
    loan = 0.035,
    loanTime=15,
    constPermTime=2,
    down=0.091)
gasOCGT= Plant(
    name="gasOCGT", 
    availability=1, 
    capacity=500,
    om=0.025,
    eff = .392,
    fuelPerUnit=35.069,
    costPerUnit=0.16,
    loan = 0.059,
    loanTime=10,
    constPermTime=2,
    down=0.115)
coal= Plant(
    name="Coal", 
    availability=1, 
    capacity=500,
    om=0.121,
    eff=.412,
    fuelPerUnit=25000.0,
    costPerUnit=38.44,
    loan = 0.089,
    loanTime=20,
    constPermTime=5,
    down=0.277)

coal1= Plant(
    name="Coal1", 
    availability=1, 
    capacity=600,
    om=82/600,
    eff=.3711,
    fuelPerUnit=25000.0,
    costPerUnit=75.09,
    loan = 999.1,
    loanTime=0,
    constPermTime=0,
    down=999999.1)
wind= Plant(
    name="Wind", 
    availability=.45, 
    capacity=900,
    om=0.045,
    eff = -1,
    loan = 0.067,
    loanTime=15,
    constPermTime=2,
    down=0.173	)


all = [biomass, gasCCGT, nuclear, solar, gasOCGT, coal, wind, gasCCGT1, gasOCGT1, coal1]

ren = [wind, solar]


for i in all:

    print(str(i.name) + " Profit = " + str(i.getProfit()))


years = range(50)

plt.figure()
for i in ren:
    for y in years:
        i.getBank()
    plt.plot(np.append(years, len(years)), i.bankHist)    
plt.show()
    