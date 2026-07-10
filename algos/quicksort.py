"""Quicksort — simple, readable (not in-place) reference implementation."""
from typing import List


def quicksort(items: List[int]) -> List[int]:
    """Return a new sorted list using the divide-and-conquer quicksort."""
    if len(items) <= 1:
        return items
    pivot = items[len(items) // 2]
    left = [x for x in items if x < pivot]
    middle = [x for x in items if x == pivot]
    right = [x for x in items if x > pivot]
    return quicksort(left) + middle + quicksort(right)


if __name__ == "__main__":
    print(quicksort([3, 6, 1, 8, 2, 9, 4]))  # -> [1, 2, 3, 4, 6, 8, 9]
