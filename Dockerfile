FROM public.ecr.aws/lambda/python:3.11

RUN yum update -y && yum install -y gcc-c++ make

ENV PYTHONUNBUFFERED=1

COPY requirements.txt ${LAMBDA_TASK_ROOT}

RUN pip install --upgrade pip setuptools

RUN pip install -r requirements.txt

COPY travelAgent.py ${LAMBDA_TASK_ROOT}

COPY .env ${LAMBDA_TASK_ROOT}

RUN chmod +x travelAgent.py

CMD ["travelAgent.lambda_handler"]