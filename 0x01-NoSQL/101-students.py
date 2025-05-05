#!/usr/bin/env python3
"""
This module to return all students sorted by average score.
"""


def top_students(mongo_collection):
    """
    Returns all students sorted by average score (desc).
    Each student document includes an additional
    'averageScore' field.
    """
    return mongo_collection.aggregate([
        {
            "$project": {
                "name": 1,
                "topics": 1,
                "averageScore": {
                    "$avg": "$topics.score"
                }
            }
        },
        {
            "$sort": {"averageScore": -1}
        }
    ])
