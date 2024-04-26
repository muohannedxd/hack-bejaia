Map<int, Navire> naviresData = {
  1: Navire(
    id: 1,
    name: 'Bliss Ship',
    departureTime: '26 April 2024, 19:25',
    estimatedArrivalTime: '3 days, 4 hours',
  ),
  2: Navire(
    id: 2,
    name: 'Sky Blue',
    departureTime: '23 April 2024, 11:05',
    estimatedArrivalTime: '14 hours',
  ),
  3: Navire(
    id: 3,
    name: 'Icon Of The Seas',
    departureTime: '25 April 2024, 20:25',
    estimatedArrivalTime: '6 days, 2 hours',
  ),
  4: Navire(
    id: 4,
    name: 'Tassili Board',
    departureTime: '10 April 2024, 08:25',
    estimatedArrivalTime: '3 days, 14 hours',
  ),
};

class Navire {
  final int id;
  final String name;
  final String departureTime;
  final String estimatedArrivalTime;

  Navire({
    required this.id,
    required this.name,
    required this.departureTime,
    required this.estimatedArrivalTime,
  });
}
