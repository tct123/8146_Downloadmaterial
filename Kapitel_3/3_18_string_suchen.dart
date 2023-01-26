void main() {
  final possibleGreeting = 'Hallo, Freunde!';
  final screamingGreeting = 'HALLO, Freunde!';
  final whisperingGreeting = 'hallo, Freunde';

  final expectedGreeting = 'Hallo'.toLowerCase();

  print('Es ist eine Begrüßung: ${possibleGreeting.toLowerCase().startsWith(expectedGreeting)}');
  print('Es ist eine Begrüßung: ${screamingGreeting.toLowerCase().startsWith(expectedGreeting)}');
  print('Es ist eine Begrüßung: ${whisperingGreeting.toLowerCase().startsWith(expectedGreeting)}');

}
