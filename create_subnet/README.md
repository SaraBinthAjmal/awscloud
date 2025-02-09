# Subnet creation through github actions

## The below steps helps you to create Subnet through Github actions

Step 1: Create a directory under the root folder with the name '.github/workflows' , name it "create_subnet"

step 2: Create a yaml file inside with the name  "github-actions-demo.yml" with the below content
```
name: GitHub Actions Demo
run-name: ${{ github.actor }} is testing out GitHub Actions 🚀
on: [push]
jobs:
  Explore-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v4
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - run: echo "🍏 This job's status is ${{ job.status }}."
      - uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
          aws ec2 create-subnet \
                --vpc-id vpc-0424bd07b2433d81c \
                --cidr-block 10.5.0.0/24 \
                --tag-specifications ResourceType=subnet,Tags=[{Key=Name,Value=my-ipv4-ipv6-subnet}]
