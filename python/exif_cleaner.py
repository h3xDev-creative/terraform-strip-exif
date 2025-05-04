import boto3
from PIL import Image
import io
import os

# Create an S3 client to interact with AWS S3
s3 = boto3.client('s3')

def lambda_handler(event, context):
    """
    This Lambda function is triggered whenever a new .jpg image is uploaded to S3 Bucket A.
    It:
    1. Downloads the image from Bucket A.
    2. Removes any EXIF metadata from the image.
    3. Uploads the cleaned image to Bucket B using the same path and filename.
    """

    # Extract the bucket and object (file) key from the incoming event
    source_bucket = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']
    
    # Destination bucket name is passed in via environment variable
    destination_bucket = os.environ['DEST_BUCKET']

    try:
        print(f"Received new image upload event: {object_key} in bucket: {source_bucket}")

        # Step 1: Download the original image from Bucket A
        print("Downloading image from source bucket...")
        response = s3.get_object(Bucket=source_bucket, Key=object_key)
        image_data = response['Body'].read()

        # Step 2: Open the image using Pillow (PIL fork)
        print("Opening image and stripping EXIF metadata...")
        image = Image.open(io.BytesIO(image_data))

        # Strip metadata by copying only the raw pixel data
        clean_image = Image.new(image.mode, image.size)
        clean_image.putdata(list(image.getdata()))

        # Step 3: Save the cleaned image to an in-memory buffer
        buffer = io.BytesIO()
        clean_image.save(buffer, format='JPEG')  # JPEG is assumed as per requirements
        buffer.seek(0)

        # Step 4: Upload the cleaned image to the destination bucket (Bucket B)
        print(f"Uploading cleaned image to destination bucket: {destination_bucket}")
        s3.put_object(
            Bucket=destination_bucket,
            Key=object_key,
            Body=buffer,
            ContentType='image/jpeg'
        )

        print(f"Successfully removed EXIF metadata and uploaded cleaned image: {object_key}")
        return {
            'statusCode': 200,
            'body': f'Successfully processed and uploaded cleaned image: {object_key}'
        }

    except Exception as e:
        print(f"Something went wrong while processing {object_key}: {str(e)}")
        return {
            'statusCode': 500,
            'body': f'Error processing image: {str(e)}'
        }
