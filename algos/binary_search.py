"""Iterative binary search over a sorted sequence."""
from typing import Sequence


def binary_search(items: Sequence[int], target: int) -> int:
    """Return the index of `target` in sorted `items`, or -1 if absent."""
    low, high = 0, len(items) - 1
    while low <= high:
        mid = (low + high) // 2
        if items[mid] == target:
            return mid
        if items[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1


if __name__ == "__main__":
    data = [1, 3, 5, 7, 9, 11]
    print(binary_search(data, 7))   # -> 3
    print(binary_search(data, 8))   # -> -1
