FROM conda/miniconda3

RUN apt update
RUN apt install --yes dumb-init

###################### python packages ######################
RUN python3 -m pip --no-cache-dir install awscli==1.16.01 \
&& python3 -m pip --no-cache-dir install boto3==1.9.86 \
&& python3 -m pip --no-cache-dir install tqdm==4.23.1

###################### user ########################
RUN adduser --disabled-login myuser
USER myuser

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
