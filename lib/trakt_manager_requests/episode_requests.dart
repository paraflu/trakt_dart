part of trakt_dart;

extension EpisodeRequests on TraktManager {
  Future<Episode> getEpisodeSummary(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false}) async {
    return await _get("shows/$id/seasons/$seasonNumber/episodes/$episodeNumber",
        extendedFull: extendedFull);
  }

  Future<List<ShowTranslation>> getEpisodeTranslations(
      String id, int seasonNumber, int episodeNumber,
      {String language = ""}) async {
    return await _getList<ShowTranslation>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/translations/$language");
  }

  Future<List<Comment>> getEpisodeComments(
      String id, int seasonNumber, int episodeNumber,
      {CommentsSortBy sortBy = CommentsSortBy.newest,
      RequestPagination? pagination}) async {
    return await _getList<Comment>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/comments/${sortBy.value}",
        pagination: pagination);
  }

  Future<List<TraktList>> getEpisodeLists(
      String id, int seasonNumber, int episodeNumber,
      {ListType type = ListType.personal,
      ListSort sortBy = ListSort.popular,
      RequestPagination? pagination}) async {
    return await _getList<TraktList>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/lists/${type.value}/${sortBy.value}",
        pagination: pagination);
  }

  Future<EpisodePeople> getEpisodePeople(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false, bool includeGuestStars = false}) async {
    return await _get<EpisodePeople>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/people",
        extendedFull: extendedFull,
        includeGuestStars: includeGuestStars);
  }

  Future<Rating> getEpisodeRatings(
      String id, int seasonNumber, int episodeNumber) async {
    return await _get(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/ratings");
  }

  Future<EpisodeStats> getEpisodeStats(
      String id, int seasonNumber, int episodeNumber) async {
    return await _get<EpisodeStats>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/stats");
  }

  Future<List<User>> getEpisodeWatchers(
      String id, int seasonNumber, int episodeNumber,
      {bool extendedFull = false}) async {
    return await _getList<User>(
        "shows/$id/seasons/$seasonNumber/episodes/$episodeNumber/watching",
        extendedFull: extendedFull);
  }
}