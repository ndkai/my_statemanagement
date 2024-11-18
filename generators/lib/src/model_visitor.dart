import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  Map<String, dynamic> fields = {};
  List<MyMethodElement> methods = [];
  @override
  void visitConstructorElement(ConstructorElement element) {
    final String returnType = element.returnType.toString();
    className = returnType.replaceAll("*", ""); // ClassName* -> ClassName
  }

  @override
  void visitFieldElement(FieldElement element) {
    /*
    {
      name: String,
      price: double
    }
     */
    String elementType = element.type.toString().replaceAll("*", "");
    fields[element.name] = elementType;
  }

  @override
  void visitMethodElement(MethodElement element) {
    // Get the function name
    MyMethodElement methodElement = MyMethodElement();
    print("methodElement.name ${element.name}");
    methodElement.name = element.name;
    methodElement.returnType =  element.returnType.toString().replaceAll("*", "");
    methodElement.arguments = [];
    for (final ParameterElement parameter in element.parameters) {
      methodElement.arguments.add(MyArgument(
          parameter.name,parameter.type.toString()
      ));
    }
    methods.add(methodElement);
    // Store the function signature
  }


}

class MyMethodElement{
  late String name;
  late List<MyArgument> arguments;
  late String returnType;

}

class MyArgument{
  final String name;
  final String returnType;

  MyArgument(this.name, this.returnType);
}
