print("Program Started")
import pandas as pd
import matplotlib.pyplot as plt

# Load Dataset
df = pd.read_csv("Dataset/Online_Retail.csv.csv", encoding="ISO-8859-1")

# First 5 Rows
print(df.head())

# Dataset Shape
print("\nShape:")
print(df.shape)

# Column Names
print("\nColumns:")
print(df.columns)

# Data Types
print("\nData Types:")
print(df.dtypes)

# Missing Values
print("\nMissing Values:")
print(df.isnull().sum())


# Remove missing values
df = df.dropna()

# Remove duplicate rows
df = df.drop_duplicates()

print("\nAfter Cleaning:")
print(df.shape)

# Create Revenue Column
df["Revenue"] = df["Quantity"] * df["UnitPrice"]

print("\nRevenue Column Created Successfully!")
print(df[["Quantity", "UnitPrice", "Revenue"]].head())

print("\nTop 10 Products by Revenue")

top_products = (
    df.groupby("Description")["Revenue"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print(top_products)

print("\nTop 10 Products by Revenue")

top_products = (
    df.groupby("Description")["Revenue"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print(top_products)

print("\nTop 10 Countries by Revenue")

country_sales = (
    df.groupby("Country")["Revenue"]
      .sum()
      .sort_values(ascending=False)
      .head(10)
)

print(country_sales)

df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

df["Month"] = df["InvoiceDate"].dt.to_period("M")

monthly_sales = df.groupby("Month")["Revenue"].sum()

print("\nMonthly Sales")
print(monthly_sales)

plt.figure(figsize=(10,5))
monthly_sales.plot(marker='o')
plt.title("Monthly Revenue")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.grid(True)
plt.show()


top_products.plot(kind='bar', figsize=(12,5))

plt.title("Top 10 Products by Revenue")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.xticks(rotation=90)
plt.tight_layout()
plt.show()

country_sales.plot(kind='bar', figsize=(10,5))

plt.title("Top 10 Countries by Revenue")
plt.xlabel("Country")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()