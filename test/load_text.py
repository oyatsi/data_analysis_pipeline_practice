import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), ".."))

from scripts.wordcount import load_text

text = load_text("test/example.txt")
print(text)