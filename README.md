# Exam
Variant 26
Використовуючи засоби ООП, описати країни, що виробляють, експортують та імпортують товари.
  Для товару описується назва, а також список та кількість товарів, необхідних для виготовлення
одиниці даного товару. Товари можуть не мати необхідних товарів (товари-сировина), або не бути
необхідними для інших товарів (товари для кінцевих споживачів). Для країни задається назва,
список товарів-сировини та середня кількість, що виробляється за рік, список товарів для кінцевих
споживачів та середня кількість, що споживається за рік. Реальна кількість виробництва та
споживання кожного року є випадковою з діапазону навколо середніх значень. Країни по-різному
підходять до виробництва, експорту та імпорту товарів:
 - Деякі експортують всю сировину і імпортують всі товари для кінцевих споживачів;
 - Деякі намагаються виробляти всі потрібні для себе товари, імпортують сировину, якої не
вистачає, та експортують лише надлишок своєї сировини, але не експортують і не
імпортують товари, що виробляються з інших товарів;
 - Деякі вибирають кілька «традиційних для даної країни» товарів, виробляють їх, частково
використовують самостійно, частково експортують. Всі необхідні товари, яких не вистачає
для виробництва чи споживання, імпортуються.
 - Деякі вибирають кілька товарів, на які був найбільший попит за минулий рік (тобто їх більше
імпортують, ніж експортують) і виробляють ці товари, аналогічно попередньому підходу.

  Реалізувати алгоритм, який для даного списку країн та діапазону років обчислює баланс для
кожного товару за кожен рік – різницю між сумарним експортом та сумарним імпортом.

  В інтерфейсі користувача реалізувати перегляд списку всіх країн, можливість вибрати країну і
подивитись деталі (товари, що виробляються, експортуються, імпортуються). Можливість вибрати
список країн і подивитись баланс товарів по рокам.
