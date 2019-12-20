# RenomIMG 
FROM python:3.6
# install renom
RUN pip install https://renom.jp/docs/downloads/wheels/renom_dl/ubuntu1604/python3.6/cuda10.0/cudnn7.6.2.24/ReNom2.7.3/renom-2.7.3-cp36-cp36m-linux_x86_64.whl \
    && pip install pandas==0.21.1
# install renom_img
RUN pip install https://grid-devs.gitlab.io/ReNomIMG/bin/renom_img-2.3.2-cp36-cp36m-linux_x86_64.whl
# do renom_img
CMD renom_img