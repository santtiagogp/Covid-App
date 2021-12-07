abstract class Mapper<T> {
  T fromMap(Map<String, dynamic> json);
  Map<String, dynamic> toMap(T data);
}