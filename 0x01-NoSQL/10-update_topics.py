#!/usr/bin/env python3
"""
This module updates topics of a school document.
"""


def update_topics(mongo_collection, name, topics):
    """
    Changes all topics of a school document with a given name.

    Args:
        mongo_collection: pymongo collection object.
        name (str): school name to match.
        topics (list): list of topics to set.
    """
    mongo_collection.update_many(
            {"name": name},
            {"$set": {"topics": topics}}
    )
