import pandas as pd
from tkinter import filedialog

file = filedialog.askopenfilename(
    filetypes=[("CSV files", "*.csv")]
)

df = pd.read_csv(file)

print(df.head())

print(df.shape)

print(df.columns)

print(df.columns.tolist())

print(df.isnull().sum())

print("Duplicate rows:",df.duplicated().sum())

df.isnull().sum()

df.info()

df.describe()

print(df.describe())

print(df.columns.tolist())

print(df.columns)

print(df['total_amount'].sum())

print(df['total_amount'].mean())

print(df.head())

print(df['sale_date'].dtype)

df['sale_date']=pd.to_datetime(df['sale_date'])

print(df['sale_date'].dtype)

print((df['quantity'] < 0).sum())
print((df['unit_price'] < 0).sum())
print((df['total_amount'] < 0).sum())

print((df['quantity'] == 0).sum())
print((df['unit_price'] == 0).sum())
print((df['total_amount'] == 0).sum())

print(df['product_name'].unique())

print(df['category'].unique())

print(df['product_name'].str.strip().equals(df['product_name']))
print(df['category'].str.strip().equals(df['category']))

print(df.shape)

print(df.groupby('product_name')['total_amount'].sum().sort_values(ascending=False))

print(df.groupby('category')['total_amount'].sum().sort_values(ascending=False))

print(df['total_amount'].sum())

print(df.groupby('category')['total_amount'].sum())
print(df.groupby('category')['total_amount'].sum().sum())

print(df.groupby('category')['total_amount'].sum().to_string())

print(df.groupby('product_name')['quantity'].sum().sort_values(ascending=False).to_string())

print(df.groupby('product_name')['total_amount'].sum().sort_values(ascending=False).to_string())

print(df['sale_date'].dt.to_period('M').value_counts().sort_index())

print(df.groupby(df['sale_date'].dt.to_period('M'))['total_amount'].sum().to_string())

print(df.groupby('region')['total_amount'].sum().sort_values(ascending=False).to_string())

region_revenue = df.groupby('region')['total_amount'].sum()
print((region_revenue / df['total_amount'].sum() * 100).round(2).to_string())

import matplotlib.pyplot as plt

df.groupby('product_name')['total_amount'].sum().plot(kind='bar', title='Revenue by Product')

plt.xlabel('Product')
plt.ylabel('Revenue (GHS)')
plt.tight_layout()
plt.show()

df.groupby('region')['total_amount'].sum().plot(kind='bar', title='Revenue by Region')

plt.xlabel('Region')
plt.ylabel('Revenue (GHS)')
plt.tight_layout()
plt.show()

df.groupby('region')['total_amount'].sum().plot(kind='bar', title='Revenue by Region')

plt.xlabel('Region')
plt.ylabel('Revenue (GHS)')
plt.tight_layout()
plt.savefig('revenue_by_region.png')
plt.show()
print(df.columns.tolist())


plt.figure(figsize=(8,5))

region_sales = df.groupby('region')['total_amount'].sum()

region_sales.plot(kind='bar', color='green')

plt.title('Revenue by Region')
plt.xlabel('Region')
plt.ylabel('Revenue (GHS)')
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig('revenue_by_region.png')
plt.show()

print("TOTAL REVENUE: GHS", df['total_amount'].sum())
print("TOTAL TRANSACTIONS:", len(df))
print("TOP PRODUCT:", df.groupby('product_name')['total_amount'].sum().idxmax())
print("TOP REGION:", df.groupby('region')['total_amount'].sum().idxmax())
print("BEST SELLING PRODUCT:", df.groupby('product_name')['quantity'].sum().idxmax())

print("TOTAL REVENUE: GHS", df['total_amount'].sum())
print("TOTAL TRANSACTIONS:", len(df))
print("TOP REGION:", df.groupby('region')['total_amount'].sum().idxmax())
