import pandas as pd
import pyodbc
import os
import json
import re

def remove_tags(string):
    result = re.sub('<.*?>','',string)
    return result

#Json files directory

directory_in_str="D:\Legislation"

directory = os.fsencode(directory_in_str)

for file in os.listdir(directory):

    filename = os.fsdecode(file)
  
    df=pd.read_json(os.path.join(directory_in_str, filename))
    
    df = df.fillna(0)
    
    # remove html tags
    
    df['Content']=df['Content'].apply(lambda cw : remove_tags(cw))
    
    conn = pyodbc.connect('Driver={SQL Server};Server=RAJESH-HONOR\SQLEXPRESS;Database=master;Trusted_Connection=yes;')
    conn.timeout=60
    conn.autocommit=True

    cursor=conn.cursor()
    
    for index, row in df.iterrows():
        
        cursor.commit()
        cursor.execute("""INSERT INTO Legislation(LegislationVersionId,LegislationSourceId,LegislationVersionOrdinal,Title,NativeTitle,JurisdictionSourceId,JurisdictionName
        ,IssuingBodySourceId,IssuingBodyName ,PartVersionId ,PartSourceId ,PartVersionOrdinal ,OrderNum ,Content ,NativeContent,ParentPartVersionId  ,ParentPartSourceId,ParentPartVersionOrdinal) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)""",  
      row.LegislationVersionId,row.LegislationSourceId,row.LegislationVersionOrdinal,row.Title,row.NativeTitle,row.JurisdictionSourceId,row.JurisdictionName,row.IssuingBodySourceId,row.IssuingBodyName  ,row.PartVersionId ,row.PartSourceId ,row.PartVersionOrdinal ,row.OrderNum ,row.Content ,row.NativeContent,row.ParentPartVersionId ,row.ParentPartSourceId,row.ParentPartVersionOrdinal)
        cursor.commit()     
        
    cursor.close()