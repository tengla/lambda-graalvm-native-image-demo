## Try Micronaut, Graalvm + native-image on AWS Lambda

This is a baseline app with a docker deploy script.

To build this locally, run: `sh deploy.sh`.
The artifact `build/function.zip` can now be uploaded to your
AWS Lambda function.

## Micronaut 2.3.1 Documentation

- [User Guide](https://docs.micronaut.io/2.3.1/guide/index.html)
- [API Reference](https://docs.micronaut.io/2.3.1/api/index.html)
- [Configuration Reference](https://docs.micronaut.io/2.3.1/guide/configurationreference.html)
- [Micronaut Guides](https://guides.micronaut.io/index.html)
---

## Handler

[AWS Lambda Handler](https://docs.aws.amazon.com/lambda/latest/dg/java-handler.html)

Handler: io.micronaut.function.aws.proxy.MicronautLambdaHandler

## Feature aws-lambda documentation

- [Micronaut AWS Lambda Function documentation](https://micronaut-projects.github.io/micronaut-aws/latest/guide/index.html#lambda)
