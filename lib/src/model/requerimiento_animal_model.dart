class RequerimientoAnimalModel {
  final double ms, ndt, em, pb;
  RequerimientoAnimalModel({this.ms, this.ndt, this.em, this.pb});
  @override
  String toString() {
    return 'Model Ms: $ms Ndt: $ndt Em $em Pb: $pb';
  }
}
