plt.figure(figsize=(10,7))
for i in ren:
    for y in years:
        i.getBank()
    plt.plot(np.append(years, len(years)), i.bankHist)    

plt.ylabel("Cumilative Profit [M€/500 MW]")
plt.xlabel("Time after purchase [Round]")
plt.tight_layout()
plt.show()