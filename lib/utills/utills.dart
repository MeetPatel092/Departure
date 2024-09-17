class LikeUtils {
  static List<Map> likedShlokas = [];

  static void addShlok(Map shlok) {
    likedShlokas.add(shlok);
  }

  static void removeShlok(Map shlok) {
    likedShlokas.remove(shlok);
  }

  static bool isShlokLiked(Map shlok) {
    return likedShlokas.contains(shlok);
  }
}
