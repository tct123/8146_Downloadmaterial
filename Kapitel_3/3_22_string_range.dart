void main() {
  final greeting = 'Hello, World!';
  final startIndex = greeting.indexOf('World');
  final endIndex = greeting.lastIndexOf('!');
  final world = greeting.substring(startIndex, endIndex);
  print(world);
}