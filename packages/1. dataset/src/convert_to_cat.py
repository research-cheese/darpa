import os
import json

from PIL import Image
import shutil
from typing import List

from utils.core.config import PREFIX

CATEGORIES = ["pedestrian", "vehicle", "construction", "nature"]
ID_TO_LABEL = {i: label for i, label in enumerate(CATEGORIES)}


def create_coco_annotation(id, image_id, bbox, area, category, categories_dict):
    """
    Creates a COCO annotation dictionary.
    """

    category_id = categories_dict[category]

    return {
        "id": id,
        "image_id": image_id,
        "category_id": category_id,
        "iscrowd": 0,
        "bbox": bbox,
        "area": area,
    }


def create_coco_image(id, file_name, width, height):
    """
    Creates a COCO image dictionary.
    """

    return {"id": id, "file_name": file_name, "width": width, "height": height}


def convert_to_coco_detection_folder(
    dataset_folder_path: str,
    output_folder_path: str,
    categories: List[str],
    prefix: str = "",
    max_index: int = 100,
    min_index: int = 0,
    annotations_name: str = "annotations.json",
):
    """
    Converts images and annotations in the folders to COCO format and saves them in the output folder.
    """

    metadata_path = f"{dataset_folder_path}/metadata.jsonl"

    metadata_dict = {}
    with open(metadata_path, "r") as f:
        for line in f:
            metadata = eval(line)
            metadata_dict[metadata["sample_index"]] = metadata
    out_metadata_dict = {}

    sorted_categories = sorted(categories)
    categories_dict = {category: i for i, category in enumerate(sorted_categories)}

    annotations = []
    images = []
    categories = []

    # ========================
    # Create categories array
    # ========================
    for category in sorted_categories:
        categories.append(
            {
                "id": categories_dict[category],
                "name": category,
                "supercategory": "N/A",
            }
        )

    # ========================
    # Create images and annotations arrays
    # ========================
    images_folder_path = f"{dataset_folder_path}/images"
    target_images_folder_path = f"{output_folder_path}/images"
    target_labels_folder_path = f"{output_folder_path}/labels"
    target_metadata_folder_path = f"{output_folder_path}/metadata"

    # If the output folder exists delete it

    index = 0
    box_index = 0
    images_dir = os.listdir(images_folder_path)
    images_dir = sorted(images_dir)
    for sample in images_dir:
        if not sample.isnumeric(): continue

        
        # if index >= max_index:
        #     break
        index += 1
        current_index = index + min_index

        image_path = f"{images_folder_path}/{sample}/Scene.png"
        target_image_path = f"{output_folder_path}/{prefix}/{prefix}_{current_index}.png"
        bbox_path = f"{images_folder_path}/{sample}/bounding_box.jsonl"
        metadata_of_index_sample = metadata_dict.get(int(sample))
        out_metadata_dict[f"{prefix}_{current_index}.png"] = metadata_of_index_sample

        # Copy image to output folder ==================
        shutil.copy(image_path, target_image_path)

        # Populate images array ========================
        image = Image.open(image_path)
        width, height = image.size
        image_id = current_index
        images.append(
            create_coco_image(
                id=image_id,
                file_name=f"{prefix}_{current_index}.png",
                width=width,
                height=height,
            )
        )

        if not os.path.exists(bbox_path):
            continue
        # Populate annotations array ===================

        shapes = []
        with open(bbox_path, "r") as f:
            for i, line in enumerate(f):
                # Files are stored in this format {"class": "vehicle", "xmin": 170, "ymin": 30, "xmax": 186, "ymax": 45} in each line
                bbox = eval(line)
                category = bbox["class"]
                bbox_width = bbox["xmax"] - bbox["xmin"]
                bbox_height = bbox["ymax"] - bbox["ymin"]
                area = bbox_width * bbox_height
                annotation_bbox = [bbox["xmin"], bbox["ymin"], bbox_width, bbox_height]

                annotations.append(
                    create_coco_annotation(
                        id=box_index,
                        image_id=image_id,
                        bbox=annotation_bbox,
                        area=area,
                        category=category,
                        categories_dict=categories_dict,
                    )
                )

                box_index += 1

                shapes.append(
                    {
                        "label": category,
                        "points": [
                            [bbox["xmin"], bbox["ymin"]],
                            [bbox["xmax"], bbox["ymax"]],
                        ],
                        "group_id": None,
                        "shape_type": "rectangle",
                        "flags": {},
                    }
                )
        # label_path = f"{target_labels_folder_path}/{prefix}_{current_index}.json"
        # with open(label_path, "w") as f:
        #     f.write(
        #         json.dumps(
        #             {
        #                 "version": "0.1.0",
        #                 "flags": {},
        #                 "imagePath": f"../images/{prefix}_{current_index}.png",
        #                 "imageData": None,
        #                 "imageHeight": height,
        #                 "imageWidth": width,
        #                 "shapes": shapes,
        #             }
        #         )
        #     )

    with open(os.path.join(output_folder_path, f"annotations/{annotations_name}"), "w") as f:
        f.write(
            json.dumps(
                {"images": images, "annotations": annotations, "categories": categories}
            )
        )
    
    if not os.path.exists(target_metadata_folder_path): os.makedirs(target_metadata_folder_path, exist_ok=True)
    with open(target_metadata_folder_path + f"/{prefix}.json", "w") as f:
        f.write(json.dumps(out_metadata_dict))


def get_coco_path(name):
    return f"coco/mcai/airsim-data/mixed/{name}"


def convert(name):
    output_folder_path = get_coco_path(name)
    target_images_folder_path = f"{output_folder_path}/images"
    target_annotations_folder_path = f"{output_folder_path}/annotations"
    target_labels_folder_path = f"{output_folder_path}/labels"
    if os.path.exists(target_images_folder_path):
        shutil.rmtree(output_folder_path)
    # os.makedirs(target_images_folder_path, exist_ok=True)
    os.makedirs(target_annotations_folder_path, exist_ok=True)
    os.makedirs(target_labels_folder_path, exist_ok=True)
    os.makedirs(f"{output_folder_path}/train2017", exist_ok=True)
    os.makedirs(f"{output_folder_path}/val2017", exist_ok=True)

    convert_to_coco_detection_folder(
        dataset_folder_path=f"{PREFIX}data/mcai/airsim-data/mixed/{name}",
        output_folder_path=get_coco_path(name),
        categories=CATEGORIES,
        prefix="train2017",
        annotations_name="custom_train.json",
        max_index=100,
        min_index=0,
    )

    convert_to_coco_detection_folder(
        dataset_folder_path=f"{PREFIX}data/mcai/airsim-data/mixed/test",
        output_folder_path=get_coco_path(name),
        categories=CATEGORIES,
        prefix="val2017",
        annotations_name="custom_val.json",
        max_index=1000,
        min_index=1000,
    )

    # trainval_annotaions = open(f"{output_folder_path}/annotations/train2017.json")
    # test_annotations = open(f"{output_folder_path}/annotations/val2017.json")

    # trainval = json.load(trainval_annotaions)
    # test = json.load(test_annotations)

    # trainval["images"] += test["images"]
    # trainval["annotations"] += test["annotations"]

    # with open(os.path.join(output_folder_path, f"annotations/annotations_all.json"), "w") as f:
    #     f.write(json.dumps(trainval))


convert(f"{PREFIX}dust-10")
convert(f"{PREFIX}dust-100")
convert(f"{PREFIX}dust-1000")

convert(f"{PREFIX}fog-10")
convert(f"{PREFIX}fog-100")
convert(f"{PREFIX}fog-1000")

convert(f"{PREFIX}maple_leaf-10")
convert(f"{PREFIX}maple_leaf-100")
convert(f"{PREFIX}maple_leaf-1000")

convert(f"{PREFIX}rain-10")
convert(f"{PREFIX}rain-100")
convert(f"{PREFIX}rain-1000")

convert(f"{PREFIX}snow-10")
convert(f"{PREFIX}snow-100")
convert(f"{PREFIX}snow-1000")

convert(f"{PREFIX}test")
convert(f"{PREFIX}val")
convert(f"{PREFIX}base")