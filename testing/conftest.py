"""Shared pytest fixtures. Add project-wide fixtures here."""
import pytest


@pytest.fixture
def sample_numbers():
    """A small unsorted list reused across tests."""
    return [5, 3, 8, 1, 9, 2]
