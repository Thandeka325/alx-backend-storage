#!/usr/bin/env python3
"""
This module lists all documents in a MongoDB collection.
"""


def list_all(mongo_collection):
    """
    Lists all documents in a given MongoDB collection.

    Args:
        mongo_collection: pymongo collection object.

    Returns:
        List of documents, or an empty list if none found.
    """
    return list(mongo_collection.find())
