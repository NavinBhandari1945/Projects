import pandas as pd;
df1=pd.DataFrame(
    {
        "a":[1,2,3],
        "b":[4,5,6]
    }
);
print(df1.loc[0,'b']);