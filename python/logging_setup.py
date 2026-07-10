"""Reusable structured-ish logging setup. Import and call `configure()`."""
import logging
import sys

_FORMAT = "%(asctime)s %(levelname)-8s %(name)s: %(message)s"


def configure(level: int = logging.INFO) -> logging.Logger:
    """Configure root logging once and return the app logger."""
    logging.basicConfig(level=level, format=_FORMAT, stream=sys.stdout)
    return logging.getLogger("daley_helpers")


if __name__ == "__main__":
    log = configure(logging.DEBUG)
    log.info("logging configured")
    log.debug("debug details visible at DEBUG level")
