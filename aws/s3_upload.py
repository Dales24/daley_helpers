"""Upload a local file to S3 with boto3. Mock helper — set your bucket/creds."""
import sys
from pathlib import Path

import boto3
from botocore.exceptions import BotoCoreError, ClientError


def upload(local_path: str, bucket: str, key: str | None = None) -> str:
    """Upload `local_path` to s3://bucket/key. Returns the s3:// URI."""
    key = key or Path(local_path).name
    s3 = boto3.client("s3")
    try:
        s3.upload_file(local_path, bucket, key)
    except (BotoCoreError, ClientError) as exc:
        raise RuntimeError(f"upload failed: {exc}") from exc
    return f"s3://{bucket}/{key}"


if __name__ == "__main__":
    if len(sys.argv) < 3:
        sys.exit("usage: s3_upload.py <local_path> <bucket> [key]")
    print(upload(*sys.argv[1:]))
