class UserModel {
  UserModel({
    this.id,
    this.nama,
    this.kelas,
    this.jurusan,
    this.telfon,
    this.alamat,
  });

  int? id;
  String? nama;
  String? kelas;
  String? jurusan;
  String? telfon;
  String? alamat;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    nama: json["nama"],
    kelas: json["kelas"],
    jurusan: json["jurusan"],
    telfon: json["telfon"],
    alamat: json["alamat"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "kelas": kelas,
    "jurusan": jurusan,
    "telfon": telfon,
    "alamat": alamat,
  };
}