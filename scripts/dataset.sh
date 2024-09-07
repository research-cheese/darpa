python3 "packages/1. dataset/src/process_dataset.py" "base" &
python3 "packages/1. dataset/src/process_dataset.py" "test" &
python3 "packages/1. dataset/src/process_dataset.py" "val" &
python3 "packages/1. dataset/src/process_dataset.py" "dust-10" &
python3 "packages/1. dataset/src/process_dataset.py" "dust-100" &
python3 "packages/1. dataset/src/process_dataset.py" "dust-1000" &
python3 "packages/1. dataset/src/process_dataset.py" "fog-10" &
python3 "packages/1. dataset/src/process_dataset.py" "fog-100" &
python3 "packages/1. dataset/src/process_dataset.py" "fog-1000" &
python3 "packages/1. dataset/src/process_dataset.py" "maple_leaf-10" &
python3 "packages/1. dataset/src/process_dataset.py" "maple_leaf-100" &
python3 "packages/1. dataset/src/process_dataset.py" "maple_leaf-1000" &
python3 "packages/1. dataset/src/process_dataset.py" "rain-10" &
python3 "packages/1. dataset/src/process_dataset.py" "rain-100" &
python3 "packages/1. dataset/src/process_dataset.py" "rain-1000" &
python3 "packages/1. dataset/src/process_dataset.py" "snow-10" &
python3 "packages/1. dataset/src/process_dataset.py" "snow-100" &
python3 "packages/1. dataset/src/process_dataset.py" "snow-1000" &


python3 "packages/1. dataset/src/convert_to_cat.py"
python3 "packages/1. dataset/src/calebify.py"