SELECT count()
FROM github_events
WHERE (repo_name = 'apache/pulsar') AND (toString(event_type) IN ('PullRequestEvent', 'PullRequestReviewCommentEvent', 'PullRequestReviewEvent', 'IssueCommentEvent')) AND (actor_login NOT IN ('github-actions[bot]', 'codecov-commenter')) AND (number = 9276);
