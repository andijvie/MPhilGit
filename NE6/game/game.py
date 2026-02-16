import numpy as np
import matplotlib.pyplot as plt

#electricityPrice = [100, 250, 500]
#electricityPrice = [5, 60, 250]
#electricityPrice = [15, 15, 250]
#electricityPrice = [10, 30, 150]
electricityPrice = [30, 50, 100]
hours = np.array([5000, 3600, 160] ) * 0.95 


class Plant:
    def __init__(self, name, availability, capacity, om, eff, mjPerUnit=.0, costPerUnit=.0, loan = .0, loanTime = 0, constPermTime = 0, down =.0):
        self.name = name
        self.availability = availability
        self.capacity = capacity
        self.om = om
        self.eff = eff 
        self.mjPerUnit = mjPerUnit
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
        revPH = 3600 * self.costPerUnit * ((self.capacity/self.eff)/self.mjPerUnit)
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
    om=0.120,
    eff=0.498,
    mjPerUnit=15500.0,
    costPerUnit=15.68,
    loan = 0.065,
    loanTime=20,
    constPermTime=5,
    down=0.203)

gasCCGT= Plant(
    name="CCGT", 
    availability=1, 
    capacity=500,
    om=0.058,
    eff=.791,
    mjPerUnit=35.069,
    costPerUnit=0.29,
    loan = 0.040,
    loanTime=15,
    constPermTime=4,
    down=0.103)


nuclear= Plant(
    name="Nuclear", 
    availability=1, 
    capacity=500,
    om=0.103,
    eff=.354,
    mjPerUnit=3888000.0,
    costPerUnit=1459.55,
    loan = 0.385,
    loanTime=20,
    constPermTime=7,
    down=1.200)

solar= Plant(
    name="Solar", 
    availability=.15, 
    capacity=500,
    om=0.018,
    eff=-1,
    loan = 0.023,
    loanTime=15,
    constPermTime=2,
    down=0.061)

gasOCGT= Plant(
    name="OCGT", 
    availability=1, 
    capacity=500,
    om=0.023,
    eff = .492,
    mjPerUnit=35.069,
    costPerUnit=0.29,
    loan = 0.041,
    loanTime=10,
    constPermTime=2,
    down=0.078)

coal= Plant(
    name="Coal", 
    availability=1, 
    capacity=500,
    om=0.112,
    eff=.498,
    mjPerUnit=25000.0,
    costPerUnit=57.73,
    loan = 0.061,
    loanTime=20,
    constPermTime=5,
    down=0.189)

wind= Plant(
    name="Wind", 
    availability=.45, 
    capacity=500,
    om=0.043,
    eff = -1,
    loan = 0.055,
    loanTime=15,
    constPermTime=2,
    down=0.142)


all = [biomass, gasCCGT, nuclear, solar, gasOCGT, coal, wind]

ren = [biomass, gasCCGT, nuclear, solar, gasOCGT, coal, wind]


for i in all:

    print(str(i.name) + " Profit = " + str(i.getProfit()))


years = range(50)

plt.figure(figsize=(10,7))
for i in ren:
    for y in years:
        i.getBank()
    plt.plot(np.append(years, len(years)), i.bankHist)    
    plt.text(
        50 + 0.5,
        i.bankHist[-1],
        i.name,
        va='center'
    )

plt.text(
    0.1, 0.9,
    r"$\mathbf{Prices:}$" + "\nOffpeak = 30 €/MWh\nShoulder = 50 €/MWh\nPeak=100 €/MWh",
    transform=plt.gca().transAxes,
    fontsize=15,
    ha='left',                         
    va='top'
)

plt.xlim(0, 54)
plt.ylabel("Cumilative Profit [M€/500 MW]")
plt.xlabel("Time after purchase [Round]")
plt.tight_layout()
plt.show()
    