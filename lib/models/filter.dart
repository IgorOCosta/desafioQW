class Filter {
  final bool isHalf;
  final bool isInteger;
  final bool isUsed;
  final bool isntUsed;
  final List batch;
  final bool clean;

  const Filter({
    required this.isHalf,
    required this.isInteger,
    required this.isntUsed,
    required this.isUsed,
    required this.batch,
    required this.clean
  });
  
}