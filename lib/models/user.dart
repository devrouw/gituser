class GitUser {
  final String login;
  final int id;
  final String node_id;
  final String avatar_url;
  final String gravatar_id;
  final String url;
  final String html_url;
  final String followers_url;
  final String following_url;
  final String gists_url;
  final String starred_url;
  final String subscriptions_url;
  final String organizations_url;
  final String repos_url;
  final String events_url;
  final String received_events_url;
  final String type;
  final bool site_admin;
  final double score;

  const GitUser(
      {required this.login,
      required this.id,
      required this.node_id,
      required this.avatar_url,
      required this.gravatar_id,
      required this.url,
      required this.html_url,
      required this.followers_url,
      required this.following_url,
      required this.gists_url,
      required this.starred_url,
      required this.subscriptions_url,
      required this.organizations_url,
      required this.repos_url,
      required this.events_url,
      required this.received_events_url,
      required this.type,
      required this.site_admin,
      required this.score});

  factory GitUser.fromJson(Map<String, dynamic> json) => GitUser(
        login: json['login'],
        id: json['id'],
        node_id: json['node_id'],
        avatar_url: json['avatar_url'],
        gravatar_id: json['gravatar_id'],
        url: json['url'],
        html_url: json['html_url'],
        followers_url: json['followers_url'],
        following_url: json['following_url'],
        gists_url: json['gists_url'],
        starred_url: json['starred_url'],
        subscriptions_url: json['subscriptions_url'],
        organizations_url: json['organizations_url'],
        repos_url: json['repos_url'],
        events_url: json['events_url'],
        received_events_url: json['received_events_url'],
        type: json['type'],
        site_admin: json['site_admin'],
        score: json['score'],
      );

  Map<String, dynamic> toJson() => {
        'login': login,
        'id': id,
        'node_id': node_id,
        'avatar_url': avatar_url,
        'gravatar_id': gravatar_id,
        'url': url,
        'html_url': html_url,
        'followers_url': followers_url,
        'following_url': following_url,
        'gists_url': gists_url,
        'starred_url': starred_url,
        'subscriptions_url': subscriptions_url,
        'organizations_url': organizations_url,
        'repos_url': repos_url,
        'events_url': events_url,
        'received_events_url': received_events_url,
        'type': type,
        'site_admin': site_admin,
        'score': score
      };
}
