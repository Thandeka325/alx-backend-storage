#!/usr/bin/env python3
"""
This module inserts a new document in a MongoDB collection.
"""


def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document in the collection based on kwargs.

    Args:
        mongo_collection: pymongo collection object.
        **kwargs: key-value pairs representing fields of
                the new document.

    Returns:
        The _id of the newly inserted document.
    """
    return mongo_collection.insert_one(kwargs).inserted_id
