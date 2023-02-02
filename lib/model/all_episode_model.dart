class AllEpisodeModel {
  final Info? info;
  final List<Results>? results;

  AllEpisodeModel({
    this.info,
    this.results,
  });

  AllEpisodeModel.fromJson(Map<String, dynamic> json)
      : info = (json['info'] as Map<String, dynamic>?) != null ? Info.fromJson(json['info'] as Map<String, dynamic>) : null,
        results = (json['results'] as List?)?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>)).toList();

  Map<String, dynamic> toJson() => {
        'info': info?.toJson(),
        'results': results?.map((e) => e.toJson()).toList(),
      };
}

class Info {
  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  Info({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  Info.fromJson(Map<String, dynamic> json)
      : count = json['count'] as int?,
        pages = json['pages'] as int?,
        next = json['next'] as String?,
        prev = json['prev'];

  Map<String, dynamic> toJson() => {
        'count': count,
        'pages': pages,
        'next': next,
        'prev': prev,
      };
}

class Results {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final List<String>? characters;
  final String? url;
  final String? created;

  Results({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        airDate = json['air_date'] as String?,
        episode = json['episode'] as String?,
        characters = (json['characters'] as List?)?.map((dynamic e) => e as String).toList(),
        url = json['url'] as String?,
        created = json['created'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'air_date': airDate,
        'episode': episode,
        'characters': characters,
        'url': url,
        'created': created,
      };
}
