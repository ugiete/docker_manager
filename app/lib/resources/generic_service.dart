abstract class GenericService<T> {
  void save(T object);

  List<T> list();

  void update(T object);

  void delete(T object);
}