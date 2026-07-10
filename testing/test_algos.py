"""Example pytest suite covering the algos helpers."""
import sys
from pathlib import Path

import pytest

# Make the sibling `algos/` package importable when running from repo root.
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "algos"))

from binary_search import binary_search  # noqa: E402
from quicksort import quicksort  # noqa: E402


@pytest.mark.parametrize(
    "data, target, expected",
    [
        ([1, 3, 5, 7, 9], 7, 3),
        ([1, 3, 5, 7, 9], 1, 0),
        ([1, 3, 5, 7, 9], 8, -1),
        ([], 5, -1),
    ],
)
def test_binary_search(data, target, expected):
    assert binary_search(data, target) == expected


@pytest.mark.parametrize(
    "data",
    [[], [1], [3, 1, 2], [5, 5, 1, 8, 2, 9, 4]],
)
def test_quicksort_matches_builtin(data):
    assert quicksort(data) == sorted(data)
