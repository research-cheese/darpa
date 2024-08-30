source scripts/setup_dataset.sh
source scripts/dataset.sh

cp -r coco/cityenviron/aerial ../detr

cd ../detr
source scripts/setup.sh
source scripts/run.sh