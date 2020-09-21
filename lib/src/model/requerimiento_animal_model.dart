class RequerimientoAnimalModel {
  final double ms, em, pb;
  double ndt;
  RequerimientoAnimalModel({this.ms, this.ndt, this.em, this.pb});
  @override
  String toString() {
    return 'Model Ms: $ms Ndt: $ndt Em $em Pb: $pb';
  }

  setNdt(double value) {
    this.ndt = value;
  }
}
