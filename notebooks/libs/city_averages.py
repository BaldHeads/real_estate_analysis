import numpy as np
import pandas as pd
import os
from pathlib import Path
import json
import matplotlib.pyplot as plt
import warnings
warnings.filterwarnings('ignore')

def init():

    salary_df = pd.read_csv("../data/clean_data/cnc_sal_data.csv")

    zip_metro_df = pd.read_csv("../data/clean_data/zipcode_metro.csv")
    zip_metro_df = zip_metro_df.rename(columns={"ZIPCODE" : "ZIP CODE", "ZONE":"region"})

    salary_metro_df = pd.merge(zip_metro_df, salary_df, on=['ZIP CODE']).dropna()

    salary_metro_df = salary_metro_df.groupby(["region","YEAR"]).sum()
    salary_metro_df["Avg_AGI"] = salary_metro_df["AGI"] / salary_metro_df["NO. OF RETURNS"] * 1000
    salary_metro_df = salary_metro_df.reset_index()

    return salary_metro_df

def get_zall_plot():
    salary_metro_df = init()
    zillow_path = Path("../data/clean_data/zall_metro.csv")
    zillow_df = pd.read_csv(zillow_path, infer_datetime_format=True, parse_dates=True)
    zillow_df["date"] = pd.to_datetime(zillow_df["date"])
    zillow_df["region"] = zillow_df["region"].str.replace(", TX", "", regex=False)
    zillow_year_df = zillow_df.groupby(["region",zillow_df["date"].dt.year]).mean()
    zillow_year_df = zillow_year_df.reset_index()
    zillow_year_df = zillow_year_df.rename(columns={"date":"YEAR"})

    zall_combined_df = pd.merge(salary_metro_df, zillow_year_df, on=['region','YEAR'])
    zall_combined_df["OP_RATIO"] = zall_combined_df['Avg_AGI'] / zall_combined_df["avg_value"]
    zall_combined_df = zall_combined_df.drop(columns=["AGI","NO. OF RETURNS","Avg_AGI","avg_value","ZIP CODE"])

    ax = zall_combined_df[zall_combined_df["region"]=="Houston"].plot(x="YEAR",y="OP_RATIO", title="Opportunity Ratio by City Over Time for ZALL")
    zall_combined_df[zall_combined_df["region"]=="San Antonio"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zall_combined_df[zall_combined_df["region"]=="Austin"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zall_combined_df[zall_combined_df["region"]=="Dallas-Fort Worth"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    ax.legend(["Houston", "San Antonio", "Austin", "Dallas-Fort Worth"])

    return ax

def get_zcon_plot():
    salary_metro_df = init()
    zcon_path = Path("../data/clean_data/zcon_metro.csv")
    zcon_df = pd.read_csv(zcon_path, infer_datetime_format=True, parse_dates=True)
    zcon_df["date"] = pd.to_datetime(zcon_df["date"])
    zcon_df["region"] = zcon_df["region"].str.replace(", TX", "", regex=False)
    zcon_year_df = zcon_df.groupby(["region",zcon_df["date"].dt.year]).mean()
    zcon_year_df = zcon_year_df.reset_index()
    zcon_year_df = zcon_year_df.rename(columns={"date":"YEAR"})

    zcon_combined_df = pd.merge(salary_metro_df, zcon_year_df, on=['region','YEAR'])
    zcon_combined_df["OP_RATIO"] = zcon_combined_df['Avg_AGI'] / zcon_combined_df["avg_value"]
    zcon_combined_df = zcon_combined_df.drop(columns=["AGI","NO. OF RETURNS","Avg_AGI","avg_value","ZIP CODE"])

    ax = zcon_combined_df[zcon_combined_df["region"]=="Houston"].plot(x="YEAR",y="OP_RATIO", title="Opportunity Ratio by City Over Time for ZCON")
    zcon_combined_df[zcon_combined_df["region"]=="San Antonio"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zcon_combined_df[zcon_combined_df["region"]=="Austin"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zcon_combined_df[zcon_combined_df["region"]=="Dallas-Fort Worth"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    ax.legend(["Houston", "San Antonio", "Austin", "Dallas-Fort Worth"])

    return ax

def get_zrent_plot():
    salary_metro_df = init()

    zrent_path = Path("../data/clean_data/rsna_metro.csv")
    zrent_df = pd.read_csv(zrent_path, infer_datetime_format=True, parse_dates=True)
    zrent_df["date"] = pd.to_datetime(zrent_df["date"])
    zrent_df["region"] = zrent_df["region"].str.replace(", TX", "", regex=False)
    zrent_year_df = zrent_df.groupby(["region",zrent_df["date"].dt.year]).mean()
    zrent_year_df = zrent_year_df.reset_index()
    zrent_year_df = zrent_year_df.rename(columns={"date":"YEAR"})

    zrent_combined_df = pd.merge(salary_metro_df, zrent_year_df, on=['region','YEAR'])
    zrent_combined_df["OP_RATIO"] = zrent_combined_df['Avg_AGI'] / zrent_combined_df["avg_value"]
    zrent_combined_df = zrent_combined_df.drop(columns=["AGI","NO. OF RETURNS","Avg_AGI","avg_value","ZIP CODE"])


    ax = zrent_combined_df[zrent_combined_df["region"]=="Houston"].plot(x="YEAR",y="OP_RATIO", title="Opportunity Ratio by City Over Time for ZRENT")
    zrent_combined_df[zrent_combined_df["region"]=="San Antonio"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zrent_combined_df[zrent_combined_df["region"]=="Austin"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    zrent_combined_df[zrent_combined_df["region"]=="Dallas-Fort Worth"].plot(x="YEAR",y="OP_RATIO", ax=ax)
    ax.legend(["Houston", "San Antonio", "Austin", "Dallas-Fort Worth"])

    return ax