import os


print "AWS_ACCESS_KEY_ID is {}".format(
    os.environ.get('AWS_ACCESS_KEY_ID') or "not set"
)
print "AWS_SECRET_ACCESS_KEY is {}".format(
    os.environ.get('AWS_SECRET_ACCESS_KEY') or "not set"
)
