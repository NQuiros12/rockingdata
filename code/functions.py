import boto3
import re
import botocore
# Key and secret key from RD
KEY = "AKIA2NU5TZR6RVMXSOKK"
SECRET_K = "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"
# Default link of the S3 service.
LINK = "https://desafio-rkd.s3.amazonaws.com/disney_plus_titles.csv"
# From the link we extract the bucket and file names.
findings = re.findall("://\w*-\w*\.|\/\w*\.\w*", LINK)
BUCKET_NAME = findings[0].replace("://", "").replace(".","")
FILE_NAME = findings[1].replace("/", "")



def download_csv(link: str,
                 file_name: str = FILE_NAME,
                 bucket_name: str = BUCKET_NAME) -> None:
    # Create a s3 client with the key and secret
    s3 = boto3.client("s3",
                      aws_access_key_id=KEY,
                      aws_secret_access_key=SECRET_K
                      )
    print("Connecting to s3...")
    print(f"Accessing the '{bucket_name}' bucket...")
    #Check if the bucket exists
    try:
        s3.head_bucket(Bucket=bucket_name)
        print("Bucket exists!!")
    except botocore.exceptions.ClientError:
        print("Bucket does not exist")
    #Download the file and store it in the data folder
    
    print("BUCKET_NAME: {}".format(BUCKET_NAME))
    print("FILE_NAME: {}".format(file_name))
    s3.download_file(bucket_name, file_name, "data/"+file_name)
    print(
        f"Downloading the '{bucket_name}' from the bucket and storing the csv in 'data/{file_name}' ")
    return None
download_csv(LINK)
download_csv(LINK,file_name="netflix_titles.csv")

