#!/bin/bash

DATASET="tomi"
TASK="tomi"
MODEL_TYPE="t5"
MODEL_NAME_OR_PATH="macaw-large"
TRAIN_BATCH_SIZE=4
PREDICT_BATCH_SIZE=4
N_GPU=1

# MODEL_DIR=~/../../nlpdata1/share/zechen/

echo "Downloading data..."
mkdir -p data/${DATASET}
wandb artifact get epfl_nlp_phd/data-collection/${DATASET}:latest --root data/${DATASET}

python main.py \
    --do_eval \
    --dataset ${DATASET} \
    --model_type ${MODEL_TYPE} \
    --input_format ${INPUT_FORMAT} \
    --model_name_or_path ${MODEL_NAME_OR_PATH} \
    --train_batch_size ${TRAIN_BATCH_SIZE} \
    --predict_batch_size ${PREDICT_BATCH_SIZE} \
    --learning_rate 3e-5 \
    --wandb_name ${MODEL_NAME_OR_PATH}-${DATASET}-eval \
    --n_gpu ${N_GPU} \
    --device_idx 0