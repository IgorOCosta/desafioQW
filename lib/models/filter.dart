class Filter {

  final bool isUsed;
  final bool isntUsed;
  final List batch;
  final bool clean;

  const Filter({
 
    required this.isntUsed,
    required this.isUsed,
    required this.batch,
    required this.clean
  });
  
}