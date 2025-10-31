extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String toFullDate() {
    if (isEmpty) return this;
    final date = DateTime.parse(this);
    final int month = date.month;
    final int day = date.day;
    final int year = date.year;

    final months = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'];

    return '$day de ${months[month - 1]} de $year';
  }
}
