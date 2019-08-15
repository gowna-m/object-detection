import requests
import argparse
def parsing():
    parser = argparse.ArgumentParser(description='Script to post a request to flask api')
    parser.add_argument("--img_url", help="url link of the image")
    args = parser.parse_args()
#     print(args.path)
    return(args.img_url)

def main():
    url_link=parsing()
    payload={"image_url":url_link}
    print(requests.post(url = 'http://0.0.0.0:5000/predict',json=payload))

main()
