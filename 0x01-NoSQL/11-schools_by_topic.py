#!/usr/bin/env python3
"""
This module finds schools by topic.
"""


def schools_by_topic(mongo_collection, topic):
    """
    Returns the list of schools that have a specific topic.

    Args:
        mongo_collection: pymongo collection object.
        topic (str): topic to search for.

    Returns:
        List of documents where 'topic' is in the topics array.
    """
    return list(mongo_collection.find({"topics": topic}))
