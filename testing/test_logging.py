"""Tests for the logging_setup helper."""
import logging
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "python"))

from logging_setup import configure  # noqa: E402


def test_configure_returns_named_logger():
    log = configure()
    assert log.name == "daley_helpers"


def test_configure_sets_root_level():
    configure(logging.WARNING)
    assert logging.getLogger().level == logging.WARNING
