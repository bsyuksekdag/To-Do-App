// Todo sınıfı, her bir todo öğesini temsil eder.
class Todo {
  String title; // Todo'nun başlığı
  bool
      isCompleted; // Todo'nun tamamlanıp tamamlanmadığını belirten boolean değer

  // Constructor, başlık zorunlu, tamamlanma durumu ise varsayılan olarak false olarak ayarlanır.
  Todo({
    required this.title,
    this.isCompleted = false,
  });
}
