abstract class RepositoryInterface<T> {
  List<T> getAll();
  void save(String valueToSave);
  void remove(String valueToRemove);
}
