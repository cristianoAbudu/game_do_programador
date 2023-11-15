class ProfissionalTI {
  const ProfissionalTI(
    this.nome,
    this.stress,
    this.salario,
    this.dificuldadeDeAprender,
    this.dificuldadeDeArranjarEmprego,
    this.vagasInternacionais,
  );
  
  final String nome;
  final int stress;
  final int salario;
  final int dificuldadeDeAprender;
  final int dificuldadeDeArranjarEmprego;
  final int vagasInternacionais;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'stress': stress,
      'salario': salario,
      'dificuldadeDeAprender': dificuldadeDeAprender,
      'dificuldadeDeArranjarEmprego': dificuldadeDeArranjarEmprego,
      'vagasInternacionais': vagasInternacionais,
    };
  }
  
  factory ProfissionalTI.fromMap(Map<String, dynamic> map) {
    return ProfissionalTI(
      map['nome'] as String,
      map['stress'] as int,
      map['salario'] as int,
      map['dificuldadeDeAprender'] as int,
      map['dificuldadeDeArranjarEmprego'] as int,
      map['vagasInternacionais'] as int,
    );
  }
}