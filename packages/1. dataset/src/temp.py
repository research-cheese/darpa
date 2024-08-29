import os
import shutil

def remove_ground_truth(path):
    for sample in os.listdir(path):
        if os.path.exists(f"{path}/{sample}/ground_truth"):
            shutil.rmtree(f"{path}/{sample}/ground_truth")
        
        if os.path.exists(f"{path}/{sample}/bounding_box.jsonl"):
            os.remove(f"{path}/{sample}/bounding_box.jsonl")

remove_ground_truth("data/cityenviron/aerial/dust-0.5/train/images")
remove_ground_truth("data/cityenviron/aerial/fog-0.5/train/images")
remove_ground_truth("data/cityenviron/aerial/maple_leaf-0.5/train/images")
remove_ground_truth("data/cityenviron/aerial/normal/train/images")
remove_ground_truth("data/cityenviron/aerial/rain-0.5/train/images")
remove_ground_truth("data/cityenviron/aerial/snow-0.5/train/images")
remove_ground_truth("data/cityenviron/aerial/train/images")
remove_ground_truth("data/cityenviron/aerial/test/images")