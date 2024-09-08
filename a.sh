#!/bin/sh

source scripts/setup_dataset.sh
source scripts/dataset.sh

rm -rf ../detr/aerial
cp -r caleb ../darp-cheese/data

cd ../detr
source setup.sh
source train_airsim_models.sh