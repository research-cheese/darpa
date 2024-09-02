source scripts/setup_dataset.sh
source scripts/dataset.sh

rm -rf ../detr/aerial
cp -r coco/cityenviron/aerial ../detr/aerial

cd ../detr
source scripts/setup.sh
source scripts/run.sh