python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "base" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "test" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "val" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "dust-10" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "dust-100" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "dust-1000" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "fog-10" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "fog-100" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "fog-1000" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "maple_leaf-10" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "maple_leaf-100" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "maple_leaf-1000" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "rain-10" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "rain-100" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "rain-1000" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "snow-10" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "snow-100" &
python3 "packages/1. dataset/src/process_dataset.py" --dataset_name "snow-1000" &


python3 "packages/1. dataset/src/convert_to_cat.py"
python3 "packages/1. dataset/src/calebify.py"