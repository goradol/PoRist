class UserModel{

//fieldคือตัวแปร
String id,resultCode,name,surName;
//ConstructorคือMethodที่มีชื่อClassเป็นตัว Set,get
UserModel(this.id,this.resultCode,this.name,this.surName);

UserModel.fromJSON(Map<String,dynamic> map){
id = map['id'];
resultCode = map['ResultCode'];
name = map['Name'];
surName = map['Surname'];

}

 

}