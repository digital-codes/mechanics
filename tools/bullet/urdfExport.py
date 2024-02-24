import xml.etree.ElementTree as ET
import re


def process_element(element, data):
    if isinstance(data, dict):
        for key, value in data.items():
            if isinstance(value, dict):  # Fix: Use 'value' instead of 'data'
                sub_element = ET.SubElement(element, key)
                process_element(sub_element, value)
            else:
                element.set(key, value)  # Fix: Use 'element.set()' instead of 'element.text'
    else:
        raise("Text: invalid")
    return element


def create_xml(objs, name=None):
    root = ET.Element("robot")
    if name:
        root.set("name", name)
    for obj in objs:
        process_element(root, obj)

    tree = ET.ElementTree(root)
    return tree


# Example usage
object_data = [
    {
        "link": {
            "name": "base_plate",
            "visual": {
                "geometry": {
                    "cylinder": {"radius": "1", "length": "0.1"}
                },
            "material": {"name": "gray", "color": {"rgba": "0 0 0 .5"}},
            }
        }
    },
    {
        "joint": {
            "name": "base_plate",
            "visual": {
                "geometry": {
                    "cylinder": {"radius": "1", "length": "0.1"}
                },
            "material": {"name": "gray", "color": {"rgba": "0 0 0 .5"}},
            }
        }
    }
]

urdf = create_xml(object_data, "rob1")
urdf_string = ET.tostring(urdf.getroot()).decode()
urdf_string = re.sub(r"(<(?!/))", r"\n\1", urdf_string)
print(urdf_string)
filename = "test.urdf"
with open(filename, "w") as f:
    f.write("".join([
        '<?xml version="1.0"?>',
        urdf_string]
    )
)


