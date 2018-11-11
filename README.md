# Restic

This container provides the backup utility [Restic](https://restic.net/) with some additional convinience, espcially for S3 remote locations.

## Additional command-line arguments

The container allows for AWS S3 credentials, the restic repository URL, and the restic password to be defined on the command-line. 

| Argument                  | Description                    |
| ------------------------- | ------------------------------ |
| `--AWS_ACCESS_KEY_ID`     | The AWS S3 access key          |
| `--AWS_SECRET_ACCESS_KEY` | The AWS S3 access secret       |
| `--RESTIC_REPOSITORY`     | The restic repository URL      |
| `--RESTIC_PASSWORD`       | The restic repository password |

## Usage

See the [Restic documentation](https://restic.readthedocs.io/en/stable/) for general usage. An exampe initializing a new S3 backup repository is:

```bash
docker run -t --rm kramergroup/restic \
              --AWS_ACCESS_KEY_ID='<my_id>' --AWS_SECRET_ACCESS_KEY='<my_key>' \
              --RESTIC_REPOSITORY='s3://<my_minio_host>:9000/<bucket-name>' \ 
              --RESTIC_PASSWORD='<my_password>' \
              init
```

## Mounting backup source

The default working directory is '/source-data'. To backup the current directory, use

```bash
docker run -t --rm -v $(pwd):/source-data kramergroup/restic \
              --AWS_ACCESS_KEY_ID='<my_id>' --AWS_SECRET_ACCESS_KEY='<my_key>' \
              --RESTIC_REPOSITORY='s3://<my_minio_host>:9000/<bucket-name>' \ 
              --RESTIC_PASSWORD='<my_password>' \
              backup .
```