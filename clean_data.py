import pandas as pd

df = pd.read_csv("Dataset/Online_Retail.csv.csv", encoding="ISO-8859-1")

df["CustomerID"] = pd.to_numeric(df["CustomerID"], errors="coerce")

df.to_csv("Dataset/Online_Retail_Clean.csv", index=False)

print("Clean CSV Created Successfully")
