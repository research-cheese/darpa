python3 "packages/1. dataset/src/dumb_thread.py" "base" 0 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 1000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 2000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 3000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 4000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 5000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 6000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 7000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 8000 &
python3 "packages/1. dataset/src/dumb_thread.py" "base" 9000


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
python3 "packages/1. dataset/src/process_dataset.py" "snow-1000" 


python3 "packages/1. dataset/src/convert_to_cat.py"
python3 "packages/1. dataset/src/calebify.py"